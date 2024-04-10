Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE49F8A025B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 23:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250DC10F54D;
	Wed, 10 Apr 2024 21:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ku0rDEtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0E810ECBA;
 Wed, 10 Apr 2024 21:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712785881; x=1744321881;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=+gNUG5mh4lILpNZ0Ylu/sKKmBBRJB8XdmU2Gvz6OQtI=;
 b=ku0rDEtlAq5JCqyn7AoCPwtiUQaUEQ5vaXXa6rsp0EMFcik+QfHOsA9O
 ZJHtBU0Pt2XWDRaatEW0VXdRk1yX5GEZvWB+mIkrOqvYZ3Q1dUdKD8NEu
 eQr4xM9PVhLAfo17ewoadXHB3h0H+vQO7gYkFGclqyUo6NAlfnu8fe+FF
 1rDxHhop08oIfivSAVcOMfY/ffp/zUeWCWqDNb3JPJXhbq2vkLZgPcVjE
 SoVZgnJv93DGQ5JdN7OjtCTsC6hqxgbzCyRlXdrQGQ3YDeDcr9xM41tGh
 sUrGE2wtbTRTjuUTU0rTV06LMEz3L2cRI4imkrpSvXeHopngXGB8fllfH w==;
X-CSE-ConnectionGUID: 3CeGPd7nT5mP8BBVB2l2yA==
X-CSE-MsgGUID: llKOzuNiQteu1p8uK7VgJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8397180"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8397180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:51:20 -0700
X-CSE-ConnectionGUID: OQPANL3WTDaCTGDB8T2OIQ==
X-CSE-MsgGUID: qx920WAZSei/Fou0fy4I6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20590628"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:51:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:51:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:51:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:51:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmiHJGDkmcUNaz5R6Tg9YAw+B20yeRJm57fUL/5IsiNhXWORnhvdg2m9B7BhCO5XyQbPyP/fUlQe+C7u2l49FV7MWX+5sFnHSNphz68KAiaNhLa7Gth5Zp/1qk7CBalQ++lC6deKONzzUsDh8lLvpKotZiZwI2jV9yHK4QZjAwFZnCsNRSl7Is8/Db0mZLMHLYtUXky8f2UgUzAlJ8MqnhPrGBQtCcrG1HjH7siVyQ0VEfUnaWVb1dJGmiT4nQ14NbIICMmpkVeV1cdhvreETkKFqqx26//JuvvcLqDqivn52AkPk5z6VRWdXL+FbK8hVN1EG3fNTO3ycvp09faGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27crAp95wXjA9Ba4hiRPaKEgmrm87UrpmoL5A1jaTIY=;
 b=EGr6fMeRG+irLCEYLfN6OMdM8AWXrtvfRw5rYyYr05Mv9d6xTu9iVFb+0gnAX713rt8IVsc84B6RHw4OoWzPKj9+dnPTKWCA+iQTUWtEsnA0LCShLE1z6qx7lFPdW+QMxeoZ/NbUnVGDYnvHck6LKYfJclvjMh/0yLuSnHDxVdmLxbIp0w0F0b1sq1qXGlUprvCQsbSr+N6Sq2jtG3va9H1tBaRjrWu0A8MtQvExH283HaDPb+VGKXhcS20bZIbajdk6i+Up67bL1nxd+fRP0dJUThaXuhyltTybkTgielCDRFCUJI7iWTOIw2TXqNxIhqFkgoECtic/dQ6mP94hQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM3PR11MB8681.namprd11.prod.outlook.com (2603:10b6:0:49::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Wed, 10 Apr 2024 21:51:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:51:11 +0000
Date: Wed, 10 Apr 2024 17:51:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZhcJxlzc6zLMC1c-@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM3PR11MB8681:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6FW8vqvq5eThXJ9R1S8JWkebCBYolhexRBsBW88H5t18XJJxOAhPM5pCIrX/iYNs38G/sJZVAtpCXHvNTfGWHmKwkEGDD8y15KsQ/AgYN7yBztFve1bZt8hExPYlmvR91loV2Jf+Rgpfb3mcm7tR6IEf9cjSx1OzSZu+SKdb2mNHsQB6mL5XUJqEySxd3Rv/y1y2LgV8dJayPvnIcfULN6bM0VnUNAmgKs6EAZfPnSTKjobUj1fRoSGJUM/ns2b1iU7U/BnsWFz/+UdnF28Jz9yyfGqWKF7cPVDBY2sH24qL0PJyDmwReSrzPLwvPMT+ofvhATdHB1YsyoP1fZcvohb7TxrBjsSL2Bntqwtd7iz75kF8pUZmk83P4rFkuqpVk4MgAYMHZ86o/asuGzN6a7VorI0zH/GGHQi6DrRuYB8AZZOVKS24GACPobAb8jBJJC9JZa4kRczxH4itsUQlDbxC54pg4D2Gg2aDTdBq5C/7K6uKF7CkpK6F3wWNrPQXdohmRvI7r2jqbOrlBHKCG2j4s16r2HtNfgwiw6YA8aFufqGjvu6JHuuj5gG9WucitD66rplpRnRELubWoE6KqoxS6RuZqNFhJMwoub0G4V8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+X/6MsxcDSLzayNk2PccI+XT+yf04dWHsEQyPJXEughZyqnWr6bGrB15Nh?=
 =?iso-8859-1?Q?Vx717hK72O2eRn8w5kVgjQEFhgEnPQ6+NcMlnRfJ8/fNj+NOjd0zzFMT8r?=
 =?iso-8859-1?Q?J+oKGjY5pWuCosmR5BY0gxZadu6r/KAsaEqcyJxvLzElHuNOtehUDBS2pl?=
 =?iso-8859-1?Q?Aw71u9dJzuyXHiAxGRhyEqrdQAx14AFgUcS/J9/rCOG5uHIo/dppYx2YAt?=
 =?iso-8859-1?Q?Hcd3YGIS3VotwlxU7zYJ1UhAWGwiaJkxdFGe8g7RsLV4yJqE9MqOFkKtg0?=
 =?iso-8859-1?Q?hnqWzPfZ73FXMxSoM9svvX0Qeog0sV6phZeY8pfcD7+cJ/VZ6OlB8rkrb/?=
 =?iso-8859-1?Q?FAK5LHdFjJEqH7w6V5FGwfVUTUsxhojysd/pmRa5RhF0+osYmvAf7nDYk2?=
 =?iso-8859-1?Q?rKnjob+hEfRPCg5dSa91ZMobT8H9dXIGZMiQEvJj/FHkxvp+4BicldNa9T?=
 =?iso-8859-1?Q?YMdsU3ear5VaT6eQDa2DbPDe9iy2T3CZo0KEsItaPB7dP3dK1Ed4MNFYaF?=
 =?iso-8859-1?Q?6NTQFj6j5Ol1gHwjho/pbyMBRgpHWO7L9f3hVNyYiDA0KIZRdin5RIbtSL?=
 =?iso-8859-1?Q?3F13VV1F8AtdNNQqenHgBmoIC5KIsumUxkt777aH8wsoMga5NhB5prjeJy?=
 =?iso-8859-1?Q?Vy3bqfCSmAX7hVV/fgImYIHqDyhhx63JjXoTG5cd5s3oKVCTuAEM7hw+HI?=
 =?iso-8859-1?Q?8FNDHXKm4w70DzMoVsfpkOc1kYaTEVQYBk5A4MCeBUKMFfOyswD/l00Qbx?=
 =?iso-8859-1?Q?+kCiBcRF0qSv3PrWAXXQrXIY7V32Gw0iGMZOwsBI1ldrIYGHYfybl/vutL?=
 =?iso-8859-1?Q?UFP+L4f+EGdRVu39k/PQI7oWDRGsI87D6QS6EPmRwd07xC8Wd9RtKAeR0+?=
 =?iso-8859-1?Q?3oLXqAG4omVczYXsiDPgatX49T7UcjYTj1QK7bwK7yhyrkgoxUBGKFekOw?=
 =?iso-8859-1?Q?hbO0/9dOTBggHFFhzml09zYmzjirTFCKBR3SwFs9tSiTIXXBxGlPtaQWRP?=
 =?iso-8859-1?Q?1oQc5yAqlO9QG9p3Ee4UnTD++Lio01Ja8CoUOrXyW6E03PujL8ukvfjoO7?=
 =?iso-8859-1?Q?ufucJwg7IXn7KcVoLZJ2YruWiOVp7kiIzu8I8EdDh858MjwTjS+lB5XyWR?=
 =?iso-8859-1?Q?91U9CxZnvBiPBlCRMUxhdgVlVHP2OT4TYeK5fZsLPpm39SdLeXqQ2tm4Xv?=
 =?iso-8859-1?Q?kVst8IZ1kDcM6jf3wKR6aHON0xlo5KpeEbMNdbk/aZUr1Dwrw2kM25/jgv?=
 =?iso-8859-1?Q?Nf+VxS8BYjxyGY11KOGL7uFhtALTd8WHiygI4XWiCvXjmr1o3nYpSlN1HL?=
 =?iso-8859-1?Q?Bw404EZ85CDhVSz0fLi4rDm/Y5aoZdVZeVmODrMYk1gwP+/2ZSB8oXQSAW?=
 =?iso-8859-1?Q?2N1adnGYffrnxWsYtvp6a6IO8PbM9ZkRm+rXR2sIqwLnpxYaTim1Gb1uGv?=
 =?iso-8859-1?Q?/hsFWSNbhe7dPUmogSH6DaYfScRF/npAuzDWA7O+jlACk3O1TUab2O39jg?=
 =?iso-8859-1?Q?ORAOJ7d7zK2aOWJr/39GYmVwdKO+7LKttyr40nzm5TOELQopGTNIT0Qqm5?=
 =?iso-8859-1?Q?mFMdqCRArFsLVinRUfRZrcLdLBhwlRBE1syDn/teUtrTTZ7MVMhnRdvv4B?=
 =?iso-8859-1?Q?IYNlvYzqSPedYHYR3/3OYrcVh4iGmtqDqIoau8MDmftFnR/2Xag/uMxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fa6e26-fd52-418e-9629-08dc59a855ce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:51:11.3969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0Eb5BcpI1q4oj73hNVm7yTdpVhGXyaozgBkwqISOJ0+pM+z/7hjwL0RwTzkP3bEc1fh6xFNKHyHGZDolpXCKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
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

Hi Dave and Sima,

Here goes drm-intel-fixes-2024-04-10:

Display fixes:
- Couple CDCLK programming fixes (Ville)
- HDCP related fix (Suraj)
- 4 Bigjoiner related fixes (Ville)

Core fix:
- Fix for a circular locking around GuC on reset+wedged case (John)

Thanks,
Rodrigo.

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-2024-04-10

for you to fetch changes up to dcd8992e47f13afb5c11a61e8d9c141c35e23751:

  drm/i915/vrr: Disable VRR when using bigjoiner (2024-04-08 13:10:10 -0400)

----------------------------------------------------------------
Display fixes:
- Couple CDCLK programming fixes (Ville)
- HDCP related fix (Suraj)
- 4 Bigjoiner related fixes (Ville)

Core fix:
- Fix for a circular locking around GuC on reset+wedged case (John)

----------------------------------------------------------------
John Harrison (1):
      drm/i915/guc: Fix the fix for reset lock confusion

Suraj Kandpal (1):
      drm/i915/hdcp: Fix get remote hdcp capability function

Ville Syrjälä (6):
      drm/i915/cdclk: Fix CDCLK programming order when pipes are active
      drm/i915/cdclk: Fix voltage_level programming edge case
      drm/i915/psr: Disable PSR when bigjoiner is used
      drm/i915: Disable port sync when bigjoiner is used
      drm/i915: Disable live M/N updates when using bigjoiner
      drm/i915/vrr: Disable VRR when using bigjoiner

 drivers/gpu/drm/i915/display/intel_cdclk.c        | 42 +++++++++++++++++------
 drivers/gpu/drm/i915/display/intel_cdclk.h        |  3 ++
 drivers/gpu/drm/i915/display/intel_ddi.c          |  5 +++
 drivers/gpu/drm/i915/display/intel_dp.c           |  6 +++-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c      |  5 ++-
 drivers/gpu/drm/i915/display/intel_psr.c          | 11 ++++++
 drivers/gpu/drm/i915/display/intel_vrr.c          |  7 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 +++++--------
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             |  4 +++
 9 files changed, 79 insertions(+), 27 deletions(-)
