Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DAB1B6F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E03810E6A5;
	Tue,  5 Aug 2025 14:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="in/qckYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFC110E17C;
 Tue,  5 Aug 2025 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754405903; x=1785941903;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J0t746rjMxnj0JVaanBBCd9t1NDNYUt00aCxL4DPNho=;
 b=in/qckYELcKtB+h7EfVq3e3m4gmauhXXl67/ScftVnTBFIuJW+6NNPzU
 gpZxaVxQkGZBpgv5h9UJqaMUUPAoCUGGt1Rz6rmc7/Fbps6MYODl6uKoU
 yNQ0YZMuASyi6JQS7UvzIaeIxEqYEkbuYYS/xPaMSQOFYx7cSZAg6dGnC
 hV9JSWouHoiqf7PvcfmjmIwZZmheKFLmOG1QimX+f44tR/RUMScHKLVma
 BehDwrArZo2yWFItoF66IxqZa9spNZxwEYURxZ3x4KwFkK4q1LAHRxGio
 /oJgso8pUZaXq+uj1OglZLkgELNyVpDI9Intkj/b0DoFyjnuspVwcJgR8 w==;
X-CSE-ConnectionGUID: IrPEnuguSwWAAHvPdG4wUw==
X-CSE-MsgGUID: 1pC3CppoS9+K3tznub9xwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56415800"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56415800"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:58:17 -0700
X-CSE-ConnectionGUID: +aMRueyFRYGEojYQpwYLvg==
X-CSE-MsgGUID: 1djeoa5SR3aLIAghp50q9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164522319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:58:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:58:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 07:58:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMze0CmHNM6tmMJhp46oxAkXA/Ub9Vsqt74rYlTGdL6xoFiIoFgbQvkHT0EwMwRIJHnowdi8Y6EkG+x4+T/vijEJM4UIzQ4Ft8wofG6uJcipO8SigRZS4y9mN2temTzZIAiMKUboVmHzVkCVXMLQhKTZfrp5W3i31eP79YaDdQfIMFWl97/QQHBFPwXIGLeD/TGR7B02EaB71ltCuETpXr3x0LedfU5LTq4DPBir1dXUncRMD5GPK8zZ64WfB5l5jxr5+rscYbgZE6PqiPxLEl3otYzuQ3HdBKqVB6gy7M+nmLMhrNn3zQwnpfJB1bXRb/VWwISyO6tB9Nxi3cEZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbhjDcXZ+9WYKjhW5ROa5MZylGMGEN/cv3rfIghzYNs=;
 b=mw4oH7D7/LGwWhxZ2I52QyzCfYBkQJRp+WkDdVRCDjGwWi/ixEq6JV+O4SqWBFs2Ic/7ze0iRmZjijjhDawOTB6BLAdPJ9BETFpBoALfyOfMXMIZyDGjs3uJ+YCARTcd5C0bN/Cepxy4ebiltpRlevg0twILuYWLV36RLB2jRB2Mq/iu2/T1c4jYhPHpVx+SmBNP6+sj2nHSi7BLcVNeYX3pKBoMb2tcMh1pSQQ4rqiZVWbdtSzAYYMK22BitaS9cPhyU0XTAoGJ9wm1hgs9S6eLIVsd5Fe/JPW7JhKuISF5RdYpeCok5vEOBGEkDb/D9SjKHbu9DEBZIbMf56BUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 5 Aug
 2025 14:57:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 14:57:30 +0000
Date: Tue, 5 Aug 2025 10:57:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Maxime Ripard <mripard@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>, "=?iso-8859-1?Q?Andr=E9?=
 Almeida" <andrealmeid@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Message-ID: <aJIb1NbxmxKbUT5U@intel.com>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728102809.502324-2-riana.tauro@intel.com>
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 665ae786-1676-4ede-46ae-08ddd43066ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?naaxzwaO8ZH8UBA0ZBe1033hp2qUnwlcKR3qC3y4FXSoSUOzjGp8NXTzUX?=
 =?iso-8859-1?Q?FZRg/O9IuFCA7vl9U66fPWkPvcziGe4veezaogVcV6vf4LuBJcwld/uLMb?=
 =?iso-8859-1?Q?gsIEA5kr0GQZ6Hc6r9fHP4rRK3H7CLCs4wJXjDcPAKTgVRs2M8rGbWcuPk?=
 =?iso-8859-1?Q?ly5GscU+j3PlObalkiaal8vuaEriDNq3MvoQqF1WbLvaaRYps1auyeL3UF?=
 =?iso-8859-1?Q?D6mQtDpe7R552tDMdeNaA2PSemKLtuHXi2u/un62ShrFCt94ctBBdqkRT/?=
 =?iso-8859-1?Q?t/quSXPSBzA5mnLJ7mFOHd+pRxiVD6n7vK/Y5RcXKgbkbQQtLhU51dqrds?=
 =?iso-8859-1?Q?UTwOtjVJscAHAsvcTm6Y6FKW0BRkYQEJMR4n/819aqTLxMEUJKuJAZSmYO?=
 =?iso-8859-1?Q?I/Zmb91qorfYtrus0m5DsyfApEr/DULgUNDH84kZXrhl5mf+a18WViiRrD?=
 =?iso-8859-1?Q?c0QgirkJgjJmKM4qhfgVsuzkeng5QyeHjngzI7m7Y/LbWFSsp9zkmk7YqG?=
 =?iso-8859-1?Q?pYGQWT0q9jnTZalRx9YbZ98UYyMZ0j+UdwtAZDX+2zaAEhxtFy6hnDZsLq?=
 =?iso-8859-1?Q?CEyyPuQVkoy35Zl2fVFM3oNfztFA5ADP3m/urdpA2t7lCOK8PAsRLXVBZ0?=
 =?iso-8859-1?Q?J6DcrXB2kpEzhhsXRmAqwAs8j4E7QXeDuq3Z+SA28V3CY89XFUHWhro5u0?=
 =?iso-8859-1?Q?H67W+HHP8BFKzzqLw2bQcWqaQT8p+9YUgheOsyEOw2Tjm51hB6jjWQKe2A?=
 =?iso-8859-1?Q?MHgMvX2/eBHEOUYS8WZx/1kZ1ArxBarkjPS3o2qkRg8ZdlVH557rTBzcvK?=
 =?iso-8859-1?Q?JiLBCai+azt+/YDWDi5S3jvlOGcW4oBoEpz2ywC3a6OKO6nZJlh/c5+KMY?=
 =?iso-8859-1?Q?SlFrKHu1bWs3F/VTlgH3d550imQM9WD7colFZYULNiLlasYDbrxIZ/SRxr?=
 =?iso-8859-1?Q?DXgN2Z+yxDLjt3/ml30iQiMDbEBoo2pGGPqDU95TyjL8EXFiPiaKU9eZfh?=
 =?iso-8859-1?Q?qTOmL/tmWo7He/ZpaoP7FqvN24kibZxMiSCAGnuMpzF/F4zh1Sall57J57?=
 =?iso-8859-1?Q?diOzQsbpbqZpgjiQR02PakiwcLSHVOrjxjJdObJUOAXBe+2IPfBNXr9SoW?=
 =?iso-8859-1?Q?DqPjXrnpJnHBOrOgizbw4Hzy/x/4UOtTl43ARgqcahtDTZEtDROHO+w+zQ?=
 =?iso-8859-1?Q?ntAdlvQjPlGN28nwgItx9uhouXdhTjfFdF7SEsby1Fp2pCJDcdBPrTDg+0?=
 =?iso-8859-1?Q?9KUoLttsqmY1i1o2+FNdeH5+6R30Cgt4QjDCNVmOHZTKCGEuaGpucSY/QP?=
 =?iso-8859-1?Q?4aySbFXWuT0+jXeBQCiItvylP5mhdjagf5ATYt0DKgaELWVr2PtATmZYW5?=
 =?iso-8859-1?Q?NOSzyLdkFjl+JsGwGP1dSuciYXRjHItcP9uyXdwW7MqEtnUzTS3lBUTthi?=
 =?iso-8859-1?Q?0JUh6fnvD1z9zWd4TrmJNV0edDLv9MHBnGMMopLfjDuMdaVu8gQ+5zpB9I?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iYrYkcuXJtWEKq11JzTRTN0AI7AHv8ETnmpjrWqHvQ+lmu50WjLoKBDvll?=
 =?iso-8859-1?Q?u2F05xZ+5nwwhjlQpAbuewWOe2aaJbDT6Jmf+GCbLf0rYaDcH4Qaq1sFTV?=
 =?iso-8859-1?Q?+QXjUfqQ0oh/Jpjg2qPTrfUsEcbQQZGLtK92B1gEhTbACEzOTj2sHAeqwB?=
 =?iso-8859-1?Q?LX9OgWAOgNSGhxjWxVo7C+QyJ6hmMMYV7g33TbN/oubHXaoRBrQmGrALxR?=
 =?iso-8859-1?Q?nM22fVE1wG7M0MTsgNIBmuRELFkcg35f1msecelJYwRaXZ7OtpW1h/hTiw?=
 =?iso-8859-1?Q?16+L+WBxTSVaZc7gmofLPbczcUoIgJKZ2VOJYBvLpT0JSoaJBVS83GFUOc?=
 =?iso-8859-1?Q?xUfM52RV+8wwc3Q74EdLBGKNJhBYogCo1GpxDHgzSPKpuJRaOD7HKeKiw+?=
 =?iso-8859-1?Q?wzQmjT/M/dKdn5pfYTIf6hDJDqRb6qXlne93A0s3+XgkkufwYOpDYOa6Nl?=
 =?iso-8859-1?Q?mbmNGNrVpYPgrPLkQeCx7TY0zAlOSog2rAqj24ovx5nSk+DGIf82R0nw1J?=
 =?iso-8859-1?Q?ziGJDWLrGCz1CiUYMXjt3X1VBv9zopROkkfS8isrfuf9F3YMLeDb8CWkFt?=
 =?iso-8859-1?Q?QGFFxIsatvxSwUTzb3uM4fRXpFp7dvYy8nQg4FJ7iltVYLlsaIP+7IRXSi?=
 =?iso-8859-1?Q?rU55VNRYSpXrGtbX4NKLW1MD/oOs4LOVOJtLLpyNpl28WE0PR4o/jb4QZl?=
 =?iso-8859-1?Q?QXgc1q5rkDA8Kocyy80O6nbdsj8oGo6Ss6u1S7ZlD850vvWvcSx6iIrrv1?=
 =?iso-8859-1?Q?Mw5gTrk1c9s/TJZWWXHo/XOKf52XANG8knt3yZH4hC/k+AMVDRP1gBj/Uw?=
 =?iso-8859-1?Q?huAMAYxyGdf2iAUuZDTH8vYtOSDDXRwGCNKfdKUmIe9q/Ga7CvIGbHjiOT?=
 =?iso-8859-1?Q?SNRoYhHEQHQW/2UvFSqfoAI9zH3pRlBXE9sQz6OFQjPZX+a1CCiNS9EWNO?=
 =?iso-8859-1?Q?R8rueKl1CMUJo0kHWmdZhdv4mw7WRGHQXu0fVp84fEi7OXDNd2eBe+/5pE?=
 =?iso-8859-1?Q?NbBS88sArDcOF0zUwIzp/eGDBv6sdqoK6uIAw3gtFonxvUFeuxUC9eUu5i?=
 =?iso-8859-1?Q?Tn4lY/IO9dRLlCSnRbnV+pkd1huOV/E+JwhKL6O8oXULOAEh6FtrwupypO?=
 =?iso-8859-1?Q?xsl+syaMfICRsazeNR04cBUMOBmWIUDYsmkGD2faAXm3lUbuoWQubFPyOX?=
 =?iso-8859-1?Q?MBh/hUPhl3TTmN6vkP7ycUwSid/MiECMVtoL3rzht7J+wkw2XTjitRgVTu?=
 =?iso-8859-1?Q?otyS2zVpqnzublgZDt7TdMyrRZFMJtWpY0dZEHv6t5sMoQ57FMoLy/Oosf?=
 =?iso-8859-1?Q?CDWmeBc4X5UP0FxElpk3rFAfpmtWS717IO7pa2mxbSExBpmqocUB6NAQG/?=
 =?iso-8859-1?Q?rWkWiWXOTBCGws1vM80RIJx1/xG8SmsGESZ0iA2O9lMgvlAWiqiLrMkSg/?=
 =?iso-8859-1?Q?mxh0+Qi0s5yT8/L74GVQYF/8Mo+6TAoDNGiqQ/QkgaxFxVJphOeYZAZ2+C?=
 =?iso-8859-1?Q?gLoPcHoyQjLramNIPXK7GYHIpsDjL6DjEFxfJlqlvOLYFO/Vs1zkSYnGkI?=
 =?iso-8859-1?Q?2nm996h6yWsKC4P1AZpNU9XkO7PZS6Nwyx2UQECt46+Bt0SIOVyM9RVIMt?=
 =?iso-8859-1?Q?WYp5V1MucoXTpXlYbN1MKRkYkW4ujoyXV72VF4lzxbmCY6GlvwYKmt8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 665ae786-1676-4ede-46ae-08ddd43066ee
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:57:30.8898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4YGNlzN6cw3PurG2VlY4pjjbv9l0SBta82ejcBAAdqdG3uD52QMk38kpod+XTICcpnke9+er1UQjUTZ4V8zGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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

On Mon, Jul 28, 2025 at 03:57:51PM +0530, Riana Tauro wrote:
> Address the need for a recovery method (firmware flash on Firmware errors)
> introduced in the later patches of Xe KMD.
> Whenever XE KMD detects a firmware error, a firmware flash is required to
> recover the device to normal operation.
> 
> The initial proposal to use 'firmware-flash' as a recovery method was
> not applicable to other drivers and could cause multiple recovery
> methods specific to vendors to be added.
> To address this a more generic 'vendor-specific' method is introduced,
> guiding users to refer to vendor specific documentation and system logs
> for detailed vendor specific recovery procedure.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors.
> Vendors must provide additional recovery documentation if this method
> is used.
> 
> It is the responsibility of the consumer to refer to the correct vendor
> specific documentation and usecase before attempting a recovery.
> 
> For example: If driver is XE KMD, the consumer must refer
> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> 
> Recovery script contributed by Raag.
> 
> v2: fix documentation (Raag)
> v3: add more details to commit message (Sima, Rodrigo, Raag)
>     add an example script to the documentation (Raag)
> v4: use consistent naming (Raag)
> v5: fix commit message
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>

Cc: Maxime Ripard <mripard@kernel.org>

> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
>  drivers/gpu/drm/drm_drv.c      |  2 ++
>  include/drm/drm_device.h       |  4 ++++
>  3 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..5691b29acde3 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -418,13 +418,15 @@ needed.
>  Recovery
>  --------
>  
> -Current implementation defines three recovery methods, out of which, drivers
> +Current implementation defines four recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> -more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +more side-effects. If recovery method is specific to vendor
> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> +specific documentation for the recovery procedure. As an example if the driver
> +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
> +referred for the recovery procedure. If driver is unsure about recovery or
> +method is unknown, ``WEDGED=unknown`` will be sent instead.

What if instead of this we do something like:

--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -441,6 +441,29 @@ following expectations.
     unknown         consumer policy
     =============== ========================================
 
+Vendor-Specific Recovery
+++++++++++++++++++++++++
+
+When ``WEDGED=vendor-specific`` is emitted, it indicates that the device requires a
+recovery method that is *not standardized* and is specific to the hardware vendor.
+
+In this case, the vendor driver must provide detailed documentation describing
+every single recovery possibilities and its processes. It needs to include:
+
+- Hints: Which of the following will be used to identify the
+  specific device, and guide the administrator:
+  + Sysfs, debugfs, tracepoints, or kernel logs (e.g., ``dmesg``)
+- Explicit guidance: for any admin or userspace tools and scripts necessary
+  to carry out recovery.
+
+**Example**:
+    If the device uses the ``Xe`` driver, then administrators should consult the
+    *"Device Wedging"* section of the Xe driver's documentation to determine
+    the proper steps for recovery.
+
+Notes
++++++
+
 The only exception to this is ``WEDGED=none``, which signifies that the device

----------------------

Maxime, is it any better?

Thanks,
Rodrigo.

>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +437,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>      unknown         consumer policy
>      =============== ========================================
>  
> @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>  be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>  device of all user context beforehand and set the stage for a clean recovery.
>  
> -Example
> --------
> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> +consumer to check the driver documentation and the usecase before attempting
> +a recovery.
> +
> +Example - rebind
> +----------------
>  
>  Udev rule::
>  
> @@ -491,6 +498,27 @@ Recovery script::
>      echo -n $DEVICE > $DRIVER/unbind
>      echo -n $DEVICE > $DRIVER/bind
>  
> +Example - vendor-specific
> +-------------------------
> +
> +Udev rule::
> +
> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
> +
> +Recovery script::
> +
> +    #!/bin/sh
> +
> +    DEVPATH=$(readlink -f /sys/$1/device)
> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
> +    DRIVER=$(basename $DRIVERPATH)
> +
> +    if [ "$DRIVER" = "xe" ]; then
> +        # Refer XE documentation and check usecase and recovery procedure
> +    fi
> +
> +
>  Customization
>  -------------
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..0ac723a46a91 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..59fd3f4d5995 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>   * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
>   */
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> -- 
> 2.47.1
> 
