Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABA59AB903
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 23:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E853E10E091;
	Tue, 22 Oct 2024 21:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhIkV9wR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B37C10E091;
 Tue, 22 Oct 2024 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729633894; x=1761169894;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4QniiKLNx6aE4vpsrF3AG8UeY87tn/XL+H9qNX1R5bg=;
 b=RhIkV9wRsPnIIUOEfsGNQbskZn9Yp2A2z0ojJqVS8K0c3va8q0tlbJqv
 bmn3hk6CuhfwXR26Zjv9Qwd0YCaK7FUz4pciWN94ya0Sd39IKUsbttQ9p
 cLBWzQ+qEV0nKNWHre+snziDVlUJsPkVjSeyfk9CmzXD6kJZUKuq3YaN+
 eEbL9OR/iR1NXDK+WGLdoB9bfVxo7DYmp7jkIdHJxPGp3XIn3R4luQi6F
 Y9y1mMlykT1oSAOL4TY162pzDX/P6Oa7r/cQSCB4T4Nj+J5ApZ/5Lmjka
 Unk5qqZNhH1/iE+sdXHYrobidyE1ruSE3Pyc2nByKHFs/KyNKt1/ES1OH w==;
X-CSE-ConnectionGUID: zVKsDucwTE+PL4ZuLJWSRg==
X-CSE-MsgGUID: 1E5R83ubRZGMmcIBoZFwJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39816729"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="39816729"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 14:51:33 -0700
X-CSE-ConnectionGUID: UFxW8lVDRCyTX1zu/+1K1A==
X-CSE-MsgGUID: ++jkapG4QxO8AeMU3qIcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="110827240"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 14:51:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 14:51:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 14:51:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 14:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7/XqkpBGXTWW8YyktxzDtfqwORO60FVCbyRkyC0gdtR/TbZ4EuuzFXcudIXVK2K2nocAHBcW3dNeYiUQfnJ4ln9PjGhjg6vdvti9lMzwIxhyg0qf+i8HkboMyFcqw7NL3U2pV5rjzLIQBj3pF1RVVHOedV8AE9O2OsRptcwxUtlyKuQAMcVBFF+Gi9q/wzMNbGZd3Aa/o81M3KjOe/D9m2udPIgNWpAS78/jwtusHDvXocOJaeEkZR1aU7Auw+YuzRQYNOXI8oaSMiUhWxLLRthDb3o0/F4pATMCyt7BObXakQI7fxsr4OfA24nJj0E3UDi4CTT49CSx+Y6nZQCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUAmgzMPddJybejvtMtMY/eie84lKzu8do7gnZjDw3U=;
 b=JK1wtwEvxdgGCwUFjsiqTWG1YQ9W6tEaqglA3LaOEoBvvCKsm8tGMDFsMmSLU8iRv5x4vnPSNVaS8wGYEpM/Cv8/wY9tljD4p8iip3OqtGMYAOaAhdcI72oHFpSTNNSYDd3GbvAoj+BmTZ5qJloRMZ52joLECA/Bh5f6EbGl11RqM2JzSWVXWsElGF0b2hqZP8/WQZSvGOPiL9UP+9iXNfySsKaDvWnuZmoIt/CFRRzvPiLJNsJMvghXewYEz3w3578QRcpptw18mw2Jd4xDtW10cegvS4GT2RmLbmfUSVy6ZcWcyoTRt94v5AEx0YRwTr8QjskvhM+6NxU/uv9E0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 21:51:29 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 21:51:29 +0000
Date: Tue, 22 Oct 2024 17:51:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <ZxgeXeuQU0jYjek3@intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
 <20241009172125.1539-2-michal.wajdeczko@intel.com>
 <ZwnV7WFgRw85mdxZ@DUT025-TGLU.fm.intel.com>
 <66db813f-a475-4043-bdef-25be321e18c3@intel.com>
 <ZwwDq++SAOxI7mbz@DUT025-TGLU.fm.intel.com>
 <d047a927-d94d-43f9-8e1c-7c08e742b897@intel.com>
 <Zw13OJPfibziUQaU@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zw13OJPfibziUQaU@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0cf30d-6823-4a7c-30fc-08dcf2e3af2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NXLzaA5R2sc4NA0SsNTz08EVejQ4hlbzxIwqJobkkYK+L79CmX7yPaMmKH?=
 =?iso-8859-1?Q?11iRK1wuAygAPCQOhddghV42t559nSvRn/MzqxrjlJhnpe+EqcIxxdKri6?=
 =?iso-8859-1?Q?gVelwes6PgpeMQwFAvrRWlXhOKa2/U6GKZ0m+2nX4JSTHAHc0rXY1Wt4hy?=
 =?iso-8859-1?Q?PuoBbSrk7DAUUJlMH5jFc2XY3HZIvW7EfdrGePMXQp8Wja1bMnt7XlbspL?=
 =?iso-8859-1?Q?QESGpRgZu4yXwE3vFeks7irwWmWpz1tycvpqvf54oumRDOuGgJagiHA3+a?=
 =?iso-8859-1?Q?z5buzLOTJsrougyqcL1QLqd1/L3iP5T5plOJTL6mQdXr9CI3DU85Z4sWfz?=
 =?iso-8859-1?Q?hIAqZcQ8MEHoMxFKEkI2HmlHhvuY5nuHSfoJD3Z6iMnQzoNa8ti2Kas0+S?=
 =?iso-8859-1?Q?xJtJIie626BHZNRex8XhPMpSW+rlxOtMfa91LhOevbV7C0V0Kh7wDaNJLA?=
 =?iso-8859-1?Q?YqY55t3IMJ5QZ/zoPIGXJJK5mFviI6grYeDdTYgsZ/zDzE3dz5PpZI7it+?=
 =?iso-8859-1?Q?NoNd+iZbhRNCYt9eSXhwVgBya5yEaqEemnNHV1R2++DIu6C048ZsfBSX3W?=
 =?iso-8859-1?Q?HVBi+2oQL9P1HBFYIlMtuVK0sMJTWNkhJ/fR89+mMvMhHnxqVTip6LAvEc?=
 =?iso-8859-1?Q?KeKK8Gmcy/SQEx/pbBC0O4xTl7BE+tcQST9aYuegqs1u5YPcXCkdj6aY75?=
 =?iso-8859-1?Q?VtzSQ6frH1e0daZ3IHtKtk2lC08H7pHhJRriY+3Hb+J20mObwWcv4EM3jG?=
 =?iso-8859-1?Q?iy5bbIfnIU1pcdx4wJU5ROrk2z2bfV2Y9jwT4KGnl8ez/KZLdZhUOhNbpU?=
 =?iso-8859-1?Q?sAy8c6jRZX0MQhRFbPAZyyARJV2qJcnJQR/4jZ0xE/QZPkOjFCyDB8UVFm?=
 =?iso-8859-1?Q?4CjHwTbOCkzWNme1Wx23MKmIS9Rw5t33Z4Q4E0Xza1+YzpL8qJEz+Mk1I4?=
 =?iso-8859-1?Q?TJfLPv2E8Qz2nlfBrTRbql/qWAudI4HtK7Wdu893y3VcTiThseWG7vTgXi?=
 =?iso-8859-1?Q?s7ygMGPLuHJfiJzVXMkoY6zD4o0iORFLV7RGJhKYdNtU7xhoQ6aYQinIGV?=
 =?iso-8859-1?Q?OB8Owk7frhmAH3kfsdRpe8BfeO2admHtKqcOWo/sGic6gnE6Ui7yOBuQsO?=
 =?iso-8859-1?Q?Ptf73BHByM0nKU/MLTTXo5EOW4jcD0+mUbwY93EBIrRDEhjsa8P23Is++9?=
 =?iso-8859-1?Q?atwJiAW9jrIEFjXPB9axTYFQQhiS0jbCnWrOimNXExUo0ScJAn7rPxnEeY?=
 =?iso-8859-1?Q?MLNQJDuPjGdJbEEYxOhBBJrWG9HEQiG6vY4lWv9ZtQ5WdmBoKUbgBaTtgK?=
 =?iso-8859-1?Q?S4R6oVIcDBV3rPWpj1836Uc1mb5rdNqZ4+3MWwe5T5n7HZfGQ8A+yjZSHD?=
 =?iso-8859-1?Q?cDsyqnCdaw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+GtymsYD2b2fsfPnKgvc/GpYZL0HYEraymV5JJchpn1/75TXiMZYvNuvEj?=
 =?iso-8859-1?Q?3KdjqYP2QCKqNGR5vKbUbp3llR718+fZ9Lf8ZTHhluKTyL5oDA+qTHJju0?=
 =?iso-8859-1?Q?683u4D5KWA0Bt8Jm6se3WHnW3J0feSM+w3EbRQSPOuJdUM5IvDki7pvPTr?=
 =?iso-8859-1?Q?CErrZNxTIaHKWSKR571RWeiGKhGSZP6b5HptgmX6Hf/4dy5YV5KEzcLBqH?=
 =?iso-8859-1?Q?aW8Vga9Kzqh61tnDqRhP2y+Ynm2yfICE+UXRgcLe9rTHEw+pstARSOsMcu?=
 =?iso-8859-1?Q?ramnWrsNvLioCozPpZNqA0vIgTENguNz8FaJUq/Ye9/yBrk/dpx59y4jkk?=
 =?iso-8859-1?Q?JMaHY+NrCg/P/M32SdEnP96q5udjylncL9vo8DPU+YOvyDsXXxfTIjYNYd?=
 =?iso-8859-1?Q?cNiXYk2InwYIHq47Ae4wzEibXj3YRR05X3JS9ggLZMlJw6yIM95Hm5r/Jl?=
 =?iso-8859-1?Q?bbd8WuUItu00lbrWgA70mPOlnyMh8QjYNTzZGWGIwIQBlVrV+0MejMVA1U?=
 =?iso-8859-1?Q?DY9gYuM3XsXdy3AYUFkYJHeaJxpIPwcX89yJz2yMnQNXorRtjWQGvLy419?=
 =?iso-8859-1?Q?mAy3OgoWCrRK7voco5sibeuouyPUpdFHLPuM//qKljvF1EqJksw76CwgSr?=
 =?iso-8859-1?Q?gYlCio2HjTCJBycqG3lHicPQsQ4L/996sIRk1hB4OmegrZzO6X8QN+A0zV?=
 =?iso-8859-1?Q?gzTfrLdjKleGhm6BJ3+CN+83OjsF/xr+AA7BBp2nFxCpuNUKTcjv5/8td2?=
 =?iso-8859-1?Q?oZru3e6b1fwkArpziLbaoPIif37wwKT7tQkcycDqgTDa/o4vlicihym93g?=
 =?iso-8859-1?Q?BLFaAFqoygQoBUUF5J/Nrds6GhrwSUOEigtRPnmkZN0tF0hlN8tV301uw+?=
 =?iso-8859-1?Q?6TvdevMVhQNGGt1dtgfjTAhCsorxWYVF+/Efa/fw223qN7KTEuvMV7aQc2?=
 =?iso-8859-1?Q?wwSOf8tEKCsOM/gX+4xKGDFh7SoyMFJLrhsD1JvuUFZBFrd2Xch2xn5Ill?=
 =?iso-8859-1?Q?Fohus5jWZ4vonHG1UdwRL0j2MP1ag8SFQ3HDwD9lCeugVy6CNl2PAJu9zP?=
 =?iso-8859-1?Q?4zirvS6OdZTZmelK4gCAMJ2IMiKIfJww0OAHZWbFvkIQ163HVisHQ4LD+x?=
 =?iso-8859-1?Q?ntJmiSPy5XGUEomgzZVM005XScoBntYGpFlRhNcKGX/EAXxW/eAt+uJS1W?=
 =?iso-8859-1?Q?oKv51MZU2P4oRnJdb+5f5hzTMFaBB2es5h2+fvrxWVqYONohX26Jju0mcC?=
 =?iso-8859-1?Q?4TPpUad9BG5ZNc07GqT98ICiCBh/2IaJgp3eWBk7KTkyMfq9qOV9x4VvlN?=
 =?iso-8859-1?Q?bwxq2EV4Q4OBGprzTbf7TqvmPj4ZmIo3BMwFst3o4A0olhh7OHqNMM0oKB?=
 =?iso-8859-1?Q?uE4BKV+MbU7rYJDsWnJl78h8h225PX7dAgjF2wssPYaacNGMiWz5FMU4ie?=
 =?iso-8859-1?Q?WOlSu+eSafyB75e62ayxJ2RBJryzqwRi52H0ePetO0mUQijJO9Iy+TRNZU?=
 =?iso-8859-1?Q?SEUtwIe2dwOf8SKTsr+qr8j/FIWm/40vTX2OlEugR+AExa6MYA6rOOqCDX?=
 =?iso-8859-1?Q?pJ86mx3GjFwMHcUuyMQT1kVTalc9jHN0a6U3nV+y6ggi+Jby0inIRSP+sK?=
 =?iso-8859-1?Q?OCHmUvAEvWAZNYCg3bBxTeahHu1iJcp8oHqMBW4BS/wPZxcMfnlSSX9A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0cf30d-6823-4a7c-30fc-08dcf2e3af2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 21:51:29.3442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+6/+3cY+W5rmvVCFypshpzWLbDHvKjB4wZOPmzDjfrvRhOETgs7IOkMqEYtd294kG6h6QH0utJvTO/2rj0pyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 14, 2024 at 07:55:36PM +0000, Matthew Brost wrote:
> On Mon, Oct 14, 2024 at 07:32:24PM +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 13.10.2024 19:30, Matthew Brost wrote:
> > > On Sun, Oct 13, 2024 at 01:55:45PM +0200, Michal Wajdeczko wrote:
> > >>
> > >>
> > >> On 12.10.2024 03:50, Matthew Brost wrote:
> > >>> On Wed, Oct 09, 2024 at 07:21:21PM +0200, Michal Wajdeczko wrote:
> > >>>> The purpose of the GuC Buffer Cache is to prepare a cached buffer
> > >>>> that could be used by some of the CTB based communication actions
> > >>>> which require an indirect data to be passed in a separate location
> > >>>> than CT message buffer.
> > >>>>
> > >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >>>
> > >>> Quick reaction without to much thought, this looks like reinventing
> > >>> suballocation which we already have in the DRM layer / Xe.
> > >>>
> > >>> See - xe_sa.c, drm_suballoc.c
> > >>>
> > >>> So I'd say build this layer on top one of those or ditch this layer
> > >>> entirely and directly use xe_sa.c. I'm pretty sure you could allocate
> > >>> from the existing pool of tile->mem.kernel_bb_pool as the locking in
> > >>> that layers make that safe. Maybe rename 'tile->mem.kernel_bb_pool' to
> > >>> something more generic if that works.
> > >>
> > >> TBH reuse of the xe_sa was my first approach but then I found that every
> > >> new GPU sub-allocation actually still allocates some host memory:
> > >>
> > > 
> > > I was wondering the purpose of this patch was to remove memory
> > > allocations from PF H2G function. This makes more sense what you are
> > > trying to do.
> > > 
> > >> struct drm_suballoc * drm_suballoc_new(...)
> > >> {
> > >> ...
> > >> 	sa = kmalloc(sizeof(*sa), gfp);
> > > 
> > > Can we not just wire GFP_ATOMIC here? I suppose this is failure point
> > > albiet a very unlikely one.
> > > 
> > > Another option might be update SA layers to take drm_suballoc on the
> > > stack and just initialize it and then after use fini it. Of course this
> > > only works if the init / fini are called within a single function. This
> > > might be useful in other places / drivers too.
> > > 
> > > I guess all these options need to be weighed against each other.
> > > 
> > > 1. GFP atomic in drm_suballoc_new - easiest but failure point
> > > 2. Add drm_suballoc_init / fini - seems like this would work
> > > 3. This new layer - works but quite a bit of new code
> > > 
> > > I think I'd personally lean towards start with #1 to get this fixed
> > 
> > #1 still looks like a cheating to me
> > 
> 
> Agree this is a less than ideal longterm fix but GFP_ATOMIC is used
> fairly often in the core MM to avoid reclaim - e.g. dma mapping API
> for IOVA allocation quickly comes to mind. 
> 
> > > quickly and then post #2 shortly afterwards to see something like this
> > > could get accepted.
> > 
> > for #2 likely it's not just drm_suballoc_init|fini but also another set
> > of functions at drm_suballoc_manager and xe_sa_manager level to handle
> > alternate flow, that would blur original usage, so I'm not sure that
> > it's worth investment just to cover a niche GuC scenario
> > 
> 
> I do think support generic support for sub-allocations in a reclaim safe
> manner will likely prove to be useful across the subsystem. It seems
> like a use case that can easily arrise.

+dri-devel, Sima and Dave.
Orig patch: https://lore.kernel.org/intel-xe/20241009172125.1539-2-michal.wajdeczko@intel.com/

I do believe this could be useful at the drm_suballoc_manager side.

And easier to start from there instead of creating the guc solution one
and moving there. And +1 on 'avoiding the i915 traps'.

> 
> > and #3 it's not that large as you may think as series also includes test
> > code and there few kernel-doc, and IMO it's more tailored for GuC (as it
> > also supports reading data filled by the GuC from that sub-allocation -
> > there is VF H2G action that uses indirect buffer in such way)
> >
> 
> Agree it is not huge considering the kernel doc + selftest but also this
> is more of avoiding the i915 traps we fell into of reinventing things /
> handrolling solutions rather using DRM level solutions.
> 
> The use case you mention should be able to built on top DRM / Xe
> sub-allocations though, right?
> 
> To be clear, this isn't strong push back on my end to merge what you
> have it is more of just making sure we make the right choice here for
> longterm health of the driver.
> 
> Let's maybe get a maintainer opinion here as it is ultimately up to them
> for things like this.
> 
> Lucas, Rodrigo, Thomas?
> 
> Matt
> 
> > > 
> > >> so it didn't match my requirement to avoid any memory allocations since
> > >> I want to use it while sending H2G with VFs re-provisioning during a
> > >> reset - as attempt to resolve issue mentioned in [1]
> > >>
> > >> [1]
> > >> https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/
> > >>
> > > 
> > > Thanks for the ref.
> > > 
> > > Matt
> > > 
> > >>
> > >>>
> > >>> Matt
> > >>>
> > >>>> ---
> > >>>>  drivers/gpu/drm/xe/Makefile           |   1 +
> > >>>>  drivers/gpu/drm/xe/xe_guc_buf.c       | 387 ++++++++++++++++++++++++++
> > >>>>  drivers/gpu/drm/xe/xe_guc_buf.h       |  48 ++++
> > >>>>  drivers/gpu/drm/xe/xe_guc_buf_types.h |  40 +++
> > >>>>  4 files changed, 476 insertions(+)
> > >>>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
> > >>>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
> > >>>>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > >>>> index da80c29aa363..0aed652dc806 100644
> > >>>> --- a/drivers/gpu/drm/xe/Makefile
> > >>>> +++ b/drivers/gpu/drm/xe/Makefile
> > >>>> @@ -56,6 +56,7 @@ xe-y += xe_bb.o \
> > >>>>  	xe_gt_topology.o \
> > >>>>  	xe_guc.o \
> > >>>>  	xe_guc_ads.o \
> > >>>> +	xe_guc_buf.o \
> > >>>>  	xe_guc_capture.o \
> > >>>>  	xe_guc_ct.o \
> > >>>>  	xe_guc_db_mgr.o \
> > >>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> > >>>> new file mode 100644
> > >>>> index 000000000000..a49be711ea86
> > >>>> --- /dev/null
> > >>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> > >>>> @@ -0,0 +1,387 @@
> > >>>> +// SPDX-License-Identifier: MIT
> > >>>> +/*
> > >>>> + * Copyright © 2024 Intel Corporation
> > >>>> + */
> > >>>> +
> > >>>> +#include <linux/bitmap.h>
> > >>>> +#include <linux/cleanup.h>
> > >>>> +#include <linux/mutex.h>
> > >>>> +
> > >>>> +#include <drm/drm_managed.h>
> > >>>> +
> > >>>> +#include "xe_assert.h"
> > >>>> +#include "xe_bo.h"
> > >>>> +#include "xe_gt_printk.h"
> > >>>> +#include "xe_guc.h"
> > >>>> +#include "xe_guc_buf.h"
> > >>>> +
> > >>>> +/**
> > >>>> + * DOC: GuC Buffer Cache
> > >>>> + *
> > >>>> + * The purpose of the `GuC Buffer Cache`_ is to prepare a cached buffer for use
> > >>>> + * by the GuC `CTB based communication` actions that require an indirect data to
> > >>>> + * be passed in a separate GPU memory location, that needs to be available only
> > >>>> + * during processing of that GuC action.
> > >>>> + *
> > >>>> + * The xe_guc_buf_cache_init() will allocate and initialize the cache object.
> > >>>> + * The object is drm managed and will be allocated with GFP_KERNEL flag.
> > >>>> + * The size of the underlying GPU memory buffer will be aligned to SZ_4K.
> > >>>> + * The cache will then support up to BITS_PER_LONG a sub-allocations from that
> > >>>> + * data buffer. Each sub-allocation will be at least aligned to SZ_64.
> > >>>> + *
> > >>>> + * ::
> > >>>> + *
> > >>>> + *       <------> chunk (n * 64)
> > >>>> + *       <------------- CPU mirror (n * 4K) -------------------------------->
> > >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> > >>>> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> > >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> > >>>> + *                                                 ||       /\
> > >>>> + *                                                flush     ||
> > >>>> + *                                                 ||      sync
> > >>>> + *                                                 \/       ||
> > >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> > >>>> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> > >>>> + *      +--------+--------+--------+--------+-----------------------+--------+
> > >>>> + *       <--------- GPU allocation (n * 4K) -------------------------------->
> > >>>> + *       <------> chunk (n * 64)
> > >>>> + *
> > >>>> + * The xe_guc_buf_reserve() will return a reference to a new sub-allocation.
> > >>>> + * The xe_guc_buf_release() shall be used to release a such sub-allocation.
> > >>>> + *
> > >>>> + * The xe_guc_buf_cpu_ptr() will provide access to the sub-allocation.
> > >>>> + * The xe_guc_buf_flush() shall be used to flush data from any mirror buffer to
> > >>>> + * the underlying GPU memory.
> > >>>> + *
> > >>>> + * The xe_guc_buf_gpu_addr() will provide a GPU address of the sub-allocation.
> > >>>> + * The xe_guc_buf_sync() might be used to copy the content of the sub-allocation
> > >>>> + * from the GPU memory to the local mirror buffer.
> > >>>> + */
> > >>>> +
> > >>>> +static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
> > >>>> +{
> > >>>> +	return cache->guc;
> > >>>> +}
> > >>>> +
> > >>>> +static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
> > >>>> +{
> > >>>> +	return guc_to_gt(cache_to_guc(cache));
> > >>>> +}
> > >>>> +
> > >>>> +static struct xe_device *cache_to_xe(struct xe_guc_buf_cache *cache)
> > >>>> +{
> > >>>> +	return gt_to_xe(cache_to_gt(cache));
> > >>>> +}
> > >>>> +
> > >>>> +static struct mutex *cache_mutex(struct xe_guc_buf_cache *cache)
> > >>>> +{
> > >>>> +	return &cache_to_guc(cache)->ct.lock;
> > >>>> +}
> > >>>> +
> > >>>> +static void __fini_cache(void *arg)
> > >>>> +{
> > >>>> +	struct xe_guc_buf_cache *cache = arg;
> > >>>> +	struct xe_gt *gt = cache_to_gt(cache);
> > >>>> +
> > >>>> +	if (cache->used)
> > >>>> +		xe_gt_dbg(gt, "buffer cache unclean: %#lx = %u * %u bytes\n",
> > >>>> +			  cache->used, bitmap_weight(&cache->used, BITS_PER_LONG), cache->chunk);
> > >>>> +
> > >>>> +	kvfree(cache->mirror);
> > >>>> +	cache->mirror = NULL;
> > >>>> +	cache->bo = NULL;
> > >>>> +	cache->used = 0;
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_cache_init() - Allocate and initialize a GuC Buffer Cache.
> > >>>> + * @guc: the &xe_guc where this cache will be used
> > >>>> + * @size: minimum size of the cache
> > >>>> + *
> > >>>> + * See `GuC Buffer Cache`_ for details.
> > >>>> + *
> > >>>> + * Return: pointer to the &xe_guc_buf_cache on success or a ERR_PTR() on failure.
> > >>>> + */
> > >>>> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size)
> > >>>> +{
> > >>>> +	struct xe_gt *gt = guc_to_gt(guc);
> > >>>> +	struct xe_tile *tile = gt_to_tile(gt);
> > >>>> +	struct xe_device *xe = tile_to_xe(tile);
> > >>>> +	struct xe_guc_buf_cache *cache;
> > >>>> +	u32 chunk_size;
> > >>>> +	u32 cache_size;
> > >>>> +	int ret;
> > >>>> +
> > >>>> +	cache_size = ALIGN(size, SZ_4K);
> > >>>> +	chunk_size = cache_size / BITS_PER_LONG;
> > >>>> +
> > >>>> +	xe_gt_assert(gt, size);
> > >>>> +	xe_gt_assert(gt, IS_ALIGNED(chunk_size, SZ_64));
> > >>>> +
> > >>>> +	cache = drmm_kzalloc(&xe->drm, sizeof(*cache), GFP_KERNEL);
> > >>>> +	if (!cache)
> > >>>> +		return ERR_PTR(-ENOMEM);
> > >>>> +
> > >>>> +	cache->bo = xe_managed_bo_create_pin_map(xe, tile, cache_size,
> > >>>> +						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > >>>> +						 XE_BO_FLAG_GGTT |
> > >>>> +						 XE_BO_FLAG_GGTT_INVALIDATE);
> > >>>> +	if (IS_ERR(cache->bo))
> > >>>> +		return ERR_CAST(cache->bo);
> > >>>> +
> > >>>> +	cache->guc = guc;
> > >>>> +	cache->chunk = chunk_size;
> > >>>> +	cache->mirror = kvzalloc(cache_size, GFP_KERNEL);
> > >>>> +	if (!cache->mirror)
> > >>>> +		return ERR_PTR(-ENOMEM);
> > >>>> +
> > >>>> +	ret = devm_add_action_or_reset(xe->drm.dev, __fini_cache, cache);
> > >>>> +	if (ret)
> > >>>> +		return ERR_PTR(ret);
> > >>>> +
> > >>>> +	xe_gt_dbg(gt, "buffer cache at %#x (%uKiB = %u x %zu dwords) for %ps\n",
> > >>>> +		  xe_bo_ggtt_addr(cache->bo), cache_size / SZ_1K,
> > >>>> +		  BITS_PER_LONG, chunk_size / sizeof(u32), __builtin_return_address(0));
> > >>>> +	return cache;
> > >>>> +}
> > >>>> +
> > >>>> +static bool cache_is_ref_active(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	lockdep_assert_held(cache_mutex(cache));
> > >>>> +	return bitmap_subset(&ref, &cache->used, BITS_PER_LONG);
> > >>>> +}
> > >>>> +
> > >>>> +static bool ref_is_valid(unsigned long ref)
> > >>>> +{
> > >>>> +	return ref && find_next_bit(&ref, BITS_PER_LONG,
> > >>>> +				    find_first_bit(&ref, BITS_PER_LONG) +
> > >>>> +				    bitmap_weight(&ref, BITS_PER_LONG)) == BITS_PER_LONG;
> > >>>> +}
> > >>>> +
> > >>>> +static void cache_assert_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	xe_gt_assert_msg(cache_to_gt(cache), ref_is_valid(ref),
> > >>>> +			 "# malformed ref %#lx %*pbl", ref, (int)BITS_PER_LONG, &ref);
> > >>>> +	xe_gt_assert_msg(cache_to_gt(cache), cache_is_ref_active(cache, ref),
> > >>>> +			 "# stale ref %#lx %*pbl vs used %#lx %*pbl",
> > >>>> +			 ref, (int)BITS_PER_LONG, &ref,
> > >>>> +			 cache->used, (int)BITS_PER_LONG, &cache->used);
> > >>>> +}
> > >>>> +
> > >>>> +static unsigned long cache_reserve(struct xe_guc_buf_cache *cache, u32 size)
> > >>>> +{
> > >>>> +	unsigned long index;
> > >>>> +	unsigned int nbits;
> > >>>> +
> > >>>> +	lockdep_assert_held(cache_mutex(cache));
> > >>>> +	xe_gt_assert(cache_to_gt(cache), size);
> > >>>> +	xe_gt_assert(cache_to_gt(cache), size <= BITS_PER_LONG * cache->chunk);
> > >>>> +
> > >>>> +	nbits = DIV_ROUND_UP(size, cache->chunk);
> > >>>> +	index = bitmap_find_next_zero_area(&cache->used, BITS_PER_LONG, 0, nbits, 0);
> > >>>> +	if (index >= BITS_PER_LONG) {
> > >>>> +		xe_gt_dbg(cache_to_gt(cache), "no space for %u byte%s in cache at %#x used %*pbl\n",
> > >>>> +			  size, str_plural(size), xe_bo_ggtt_addr(cache->bo),
> > >>>> +			  (int)BITS_PER_LONG, &cache->used);
> > >>>> +		return 0;
> > >>>> +	}
> > >>>> +
> > >>>> +	bitmap_set(&cache->used, index, nbits);
> > >>>> +
> > >>>> +	return GENMASK(index + nbits - 1, index);
> > >>>> +}
> > >>>> +
> > >>>> +static u64 cache_ref_offset(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	cache_assert_ref(cache, ref);
> > >>>> +	return __ffs(ref) * cache->chunk;
> > >>>> +}
> > >>>> +
> > >>>> +static u32 cache_ref_size(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	cache_assert_ref(cache, ref);
> > >>>> +	return hweight_long(ref) * cache->chunk;
> > >>>> +}
> > >>>> +
> > >>>> +static u64 cache_ref_gpu_addr(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	return xe_bo_ggtt_addr(cache->bo) + cache_ref_offset(cache, ref);
> > >>>> +}
> > >>>> +
> > >>>> +static void *cache_ref_cpu_ptr(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	return cache->mirror + cache_ref_offset(cache, ref);
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_reserve() - Reserve a new sub-allocation.
> > >>>> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> > >>>> + * @size: the requested size of the buffer
> > >>>> + *
> > >>>> + * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
> > >>>> + * Must use xe_guc_buf_release() to release a sub-allocation.
> > >>>> + *
> > >>>> + * Return: a &xe_guc_buf of new sub-allocation.
> > >>>> + */
> > >>>> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(cache));
> > >>>> +	unsigned long ref;
> > >>>> +
> > >>>> +	ref = cache_reserve(cache, size);
> > >>>> +
> > >>>> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
> > >>>> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> > >>>> + * @data: the data to flush the sub-allocation
> > >>>> + * @size: the size of the data
> > >>>> + *
> > >>>> + * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
> > >>>> + *
> > >>>> + * Return: a &xe_guc_buf of new sub-allocation.
> > >>>> + */
> > >>>> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> > >>>> +				       const void *data, size_t size)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(cache));
> > >>>> +	unsigned long ref;
> > >>>> +
> > >>>> +	ref = cache_reserve(cache, size);
> > >>>> +	if (ref) {
> > >>>> +		u32 offset = cache_ref_offset(cache, ref);
> > >>>> +
> > >>>> +		xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> > >>>> +				 offset, data, size);
> > >>>> +	}
> > >>>> +
> > >>>> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> > >>>> +}
> > >>>> +
> > >>>> +static void cache_release_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	cache_assert_ref(cache, ref);
> > >>>> +	cache->used &= ~ref;
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_release() - Release a sub-allocation.
> > >>>> + * @buf: the &xe_guc_buf to release
> > >>>> + *
> > >>>> + * Releases a sub-allocation reserved by xe_guc_buf_reserve().
> > >>>> + */
> > >>>> +void xe_guc_buf_release(const struct xe_guc_buf buf)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(buf.cache));
> > >>>> +
> > >>>> +	if (!buf.ref)
> > >>>> +		return;
> > >>>> +
> > >>>> +	cache_release_ref(buf.cache, buf.ref);
> > >>>> +}
> > >>>> +
> > >>>> +static u64 cache_flush_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	u32 offset = cache_ref_offset(cache, ref);
> > >>>> +	u32 size = cache_ref_size(cache, ref);
> > >>>> +
> > >>>> +	xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> > >>>> +			 offset, cache->mirror + offset, size);
> > >>>> +
> > >>>> +	return cache_ref_gpu_addr(cache, ref);
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
> > >>>> + * @buf: the &xe_guc_buf to flush
> > >>>> + *
> > >>>> + * Return: a GPU address of the sub-allocation.
> > >>>> + */
> > >>>> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(buf.cache));
> > >>>> +
> > >>>> +	return cache_flush_ref(buf.cache, buf.ref);
> > >>>> +}
> > >>>> +
> > >>>> +static void *cache_sync_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> > >>>> +{
> > >>>> +	u32 offset = cache_ref_offset(cache, ref);
> > >>>> +	u32 size = cache_ref_size(cache, ref);
> > >>>> +
> > >>>> +	xe_map_memcpy_from(cache_to_xe(cache), cache->mirror + offset,
> > >>>> +			   &cache->bo->vmap, offset, size);
> > >>>> +
> > >>>> +	return cache_ref_cpu_ptr(cache, ref);
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> > >>>> + * @buf: the &xe_guc_buf to sync
> > >>>> + *
> > >>>> + * Return: the CPU pointer to the sub-allocation.
> > >>>> + */
> > >>>> +void *xe_guc_buf_sync(const struct xe_guc_buf buf)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(buf.cache));
> > >>>> +
> > >>>> +	return cache_sync_ref(buf.cache, buf.ref);
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> > >>>> + * @buf: the &xe_guc_buf to query
> > >>>> + *
> > >>>> + * Return: the CPU pointer of the sub-allocation.
> > >>>> + */
> > >>>> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(buf.cache));
> > >>>> +
> > >>>> +	return cache_ref_cpu_ptr(buf.cache, buf.ref);
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
> > >>>> + * @buf: the &xe_guc_buf to query
> > >>>> + *
> > >>>> + * Return: the GPU address of the sub-allocation.
> > >>>> + */
> > >>>> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(buf.cache));
> > >>>> +
> > >>>> +	return cache_ref_gpu_addr(buf.cache, buf.ref);
> > >>>> +}
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
> > >>>> + * @cache: the &xe_guc_buf_cache with sub-allocations
> > >>>> + * @ptr: the CPU pointer to the data from a sub-allocation
> > >>>> + * @size: the size of the data at @ptr
> > >>>> + *
> > >>>> + * Return: the GPU address on success or 0 on failure.
> > >>>> + */
> > >>>> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
> > >>>> +{
> > >>>> +	guard(mutex)(cache_mutex(cache));
> > >>>> +	ptrdiff_t offset = ptr - cache->mirror;
> > >>>> +	unsigned long ref;
> > >>>> +	int first, last;
> > >>>> +
> > >>>> +	if (offset < 0)
> > >>>> +		return 0;
> > >>>> +
> > >>>> +	first = div_u64(offset, cache->chunk);
> > >>>> +	last = DIV_ROUND_UP(offset + max(1, size), cache->chunk) - 1;
> > >>>> +
> > >>>> +	if (last >= BITS_PER_LONG)
> > >>>> +		return 0;
> > >>>> +
> > >>>> +	ref = GENMASK(last, first);
> > >>>> +	cache_assert_ref(cache, ref);
> > >>>> +
> > >>>> +	return xe_bo_ggtt_addr(cache->bo) + offset;
> > >>>> +}
> > >>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> > >>>> new file mode 100644
> > >>>> index 000000000000..700e7b06c149
> > >>>> --- /dev/null
> > >>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> > >>>> @@ -0,0 +1,48 @@
> > >>>> +/* SPDX-License-Identifier: MIT */
> > >>>> +/*
> > >>>> + * Copyright © 2024 Intel Corporation
> > >>>> + */
> > >>>> +
> > >>>> +#ifndef _XE_GUC_BUF_H_
> > >>>> +#define _XE_GUC_BUF_H_
> > >>>> +
> > >>>> +#include <linux/cleanup.h>
> > >>>> +
> > >>>> +#include "xe_guc_buf_types.h"
> > >>>> +
> > >>>> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size);
> > >>>> +
> > >>>> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size);
> > >>>> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> > >>>> +				       const void *data, size_t size);
> > >>>> +void xe_guc_buf_release(const struct xe_guc_buf buf);
> > >>>> +
> > >>>> +/**
> > >>>> + * xe_guc_buf_is_valid() - Check if the GuC Buffer Cache sub-allocation is valid.
> > >>>> + * @buf: the &xe_guc_buf reference to check
> > >>>> + *
> > >>>> + * Return: true if @buf represents a valid sub-allocation.
> > >>>> + */
> > >>>> +static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> > >>>> +{
> > >>>> +	return buf.ref;
> > >>>> +}
> > >>>> +
> > >>>> +void *xe_guc_buf_sync(const struct xe_guc_buf buf);
> > >>>> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> > >>>> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> > >>>> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> > >>>> +
> > >>>> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> > >>>> +
> > >>>> +DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
> > >>>> +	     xe_guc_buf_release(_T),
> > >>>> +	     xe_guc_buf_reserve(cache, size),
> > >>>> +	     struct xe_guc_buf_cache *cache, u32 size);
> > >>>> +
> > >>>> +DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
> > >>>> +	     xe_guc_buf_release(_T),
> > >>>> +	     xe_guc_buf_from_data(cache, data, size),
> > >>>> +	     struct xe_guc_buf_cache *cache, const void *data, u32 size);
> > >>>> +
> > >>>> +#endif
> > >>>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> > >>>> new file mode 100644
> > >>>> index 000000000000..fe93b32e97f8
> > >>>> --- /dev/null
> > >>>> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> > >>>> @@ -0,0 +1,40 @@
> > >>>> +/* SPDX-License-Identifier: MIT */
> > >>>> +/*
> > >>>> + * Copyright © 2024 Intel Corporation
> > >>>> + */
> > >>>> +
> > >>>> +#ifndef _XE_GUC_BUF_TYPES_H_
> > >>>> +#define _XE_GUC_BUF_TYPES_H_
> > >>>> +
> > >>>> +#include <linux/types.h>
> > >>>> +
> > >>>> +struct xe_bo;
> > >>>> +struct xe_guc;
> > >>>> +
> > >>>> +/**
> > >>>> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> > >>>> + */
> > >>>> +struct xe_guc_buf_cache {
> > >>>> +	/** @guc: the parent GuC where buffers are used */
> > >>>> +	struct xe_guc *guc;
> > >>>> +	/** @bo: the main cache buffer object with GPU allocation */
> > >>>> +	struct xe_bo *bo;
> > >>>> +	/** @mirror: the CPU pointer to the data buffer */
> > >>>> +	void *mirror;
> > >>>> +	/** @used: the bitmap used to track allocated chunks */
> > >>>> +	unsigned long used;
> > >>>> +	/** @chunk: the size of the smallest sub-allocation */
> > >>>> +	u32 chunk;
> > >>>> +};
> > >>>> +
> > >>>> +/**
> > >>>> + * struct xe_guc_buf - GuC Data Buffer Reference.
> > >>>> + */
> > >>>> +struct xe_guc_buf {
> > >>>> +	/** @cache: the cache where this allocation belongs */
> > >>>> +	struct xe_guc_buf_cache *cache;
> > >>>> +	/** @ref: the internal reference */
> > >>>> +	unsigned long ref;
> > >>>> +};
> > >>>> +
> > >>>> +#endif
> > >>>> -- 
> > >>>> 2.43.0
> > >>>>
> > >>
> > 
