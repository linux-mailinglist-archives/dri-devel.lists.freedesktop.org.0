Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C59A3364
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 05:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FAC10E35A;
	Fri, 18 Oct 2024 03:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l63qWfMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B103110E16E;
 Fri, 18 Oct 2024 03:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729222440; x=1760758440;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=hC0T8uOLZyu5oQN3HoLmku+vqvujl9LOVTMw9axBi40=;
 b=l63qWfMDYo1k5AornwmfP0OQC4EOtwUqoVWfgbvH/ub4hiuvbfiQjCCg
 +cNpZSzSbEFSdPJltQIV2YOx4M0h9U6wH3HdGtkecX3Kq06G47oOWAHFz
 mqjiMomVAaiXoaqthnXQo5aXmxvVnmZCXsqRRpyU7OQCeCYxr+VGCHPXd
 hmOSwTnC6U0aKKrqU8QFSiRVXwZpGa+M+fE4eVorxUZla7QytTrTopFF4
 6fNF/NCYUECkZuNgOfu1O962DpnVXSe1Bo9YYFk3YFQrw2wqNrYnVLtxc
 QPjrBCXG0TZowPZPrnIP4DHJ41IypQgPKMmFs5fPtGbmrGxuR17VQzNHk g==;
X-CSE-ConnectionGUID: mi8XF4ycSHiNHo7zc9z5zw==
X-CSE-MsgGUID: TNOo41gbRLqleekI3turKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46200239"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46200239"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 20:33:59 -0700
X-CSE-ConnectionGUID: SfQ1VsZuSB60FlSYNatT5g==
X-CSE-MsgGUID: //8HC3FVQDWPj3r60xIQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="78712502"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 20:34:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 20:33:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 20:33:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 20:33:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 20:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckg3Q0Aj516cEzlSPeV+KtP9kUmHJhFrd4XYvJ4JzoRpVgXmrCPQnjGb4b/tfVtfh01VVA7nqOR1o5sTC5QL11KQ5ff5vC5pfV5+8LPa1c/PqQTLPAPHSbooBKkhpqQzSpWZAeLFcLDnEYu/GhanvTFgsDDSS1C2GjnUGnH6DKpdlL9n8a9CWZc5SEHwLazzIc9Eh0ZnV1Tx9h3oeUpZBEYlFcer/VMOFzccjtEAvFq0NPAroqf/DkxfPekIR/kh2lzu8pdwxIF4V1bm6D8X8caETehRpjLm+909obcsXuyDRspKLsAOd/KbZDhufO/864NU7wjqVfaTWpluN4Ixdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8+4cwDG4VLfwx6AK3K3K35plYFqWv3UGQx2BvYQ8XM=;
 b=JV+yZj7oH8VxjhP4p2QVSiQdoFeVL6kqq0NIZZ5egKNh8CICFWyUgZtyJof8J5zHSFNDzAzSfIxW3BNOcsShN9euiJuE9J+XnOK+0JUTfy06S1TlT/dzZD5f9fHhPjhFmlyxZuNRbLLv6lsnQuW9xFQinLfNMLlYrtpY1FdaE7V65PMoefdw8iddH3jrjODhpU2AIBmIoL/RDyZrCMLFDcL/2ssxgDFsEgOwSH7+D7g4oszQx0REJ9tBNHmjDoC9+j7s/lnAaNWADnZzR0fI5gvL+oOznzzpZgRDV1l6vujxM0N5j5dRqCGMKRc4BYvpnfiWXzu+9uFlhhIIuJpHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Fri, 18 Oct
 2024 03:33:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 03:33:54 +0000
Date: Thu, 17 Oct 2024 22:33:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <jkldrex5733ldxrla75b4ayvhujjhw2kccmasl5rotoufoacj4@pkvlrrv4orc7>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0351.namprd04.prod.outlook.com
 (2603:10b6:303:8a::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eccd439-46dd-40c0-8bea-08dcef25b0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QsBXoA4xHBqD25T46WUBaZtb2Co48bz6oyPYk4SFtKDpkwj+7pefZ5s3kIpl?=
 =?us-ascii?Q?bOkge+6q+9ZaA3wLKizMQbyRqdSjNggetWJhfac7qKl0TZaLaEdyp4LUvgMg?=
 =?us-ascii?Q?P04rY+mw5JlUAcZVaizjeM8R3lLljL3XbMzAcoo3JC2bkwI8ZxBTB0SxngfT?=
 =?us-ascii?Q?LoQaQuprqPxMg9MNW19ATJDAs0jUNfBGdn08B5w8S9QbrwW31YK4TwvSt/W+?=
 =?us-ascii?Q?jsj94jpcf3LS3SciHcCeK2Nmf5WAlmjjugDYhN/5j1AL6JI716Q5JkGC0YEh?=
 =?us-ascii?Q?wPI35kUtHCuFnVCZJRV0L/oPXeXrf+bmM24SNfXIiDPGjS0Smf8nFANwqD+m?=
 =?us-ascii?Q?tYg7+PJ7pABLeRWP3ZD9Fv7z2F6H1WQHA3+09My/HtNU1g8x95ULBOxAH0xp?=
 =?us-ascii?Q?Gbkg8X7RwZsAThGi6YTda36pv0D58qU++Uq0XCjzXwe4VY4ILYtg7qP26Ul+?=
 =?us-ascii?Q?4BqWHf0byMB3SjIWpvuCV9ElUO9Wga/KSI8Ozr+HUfT0eaazanTPvgzu+scz?=
 =?us-ascii?Q?Oixdsu2Q82nqUKY1azifeYvtyj0iXfbvpZVmTNaAhn0MSW744B1iQPBSg//v?=
 =?us-ascii?Q?7Sl2kn3YIcAdz5NFV8W6/K2soLGR4xueW3V8DkYt5m4/zI5eAJAKHDGaVplJ?=
 =?us-ascii?Q?fKzrylHBOiauaMZ6/IPhjZysDuP1T+EBY0EwgVeLhAQqgmUTNIdbsN8Sqipe?=
 =?us-ascii?Q?oZpam3FSQiMzHxzs96yU/Mlm2mLxr2u5Pr0KdNdBFm8AQeraNcyKD0TlTfdP?=
 =?us-ascii?Q?MgIa+YYp8iIMFas0LhgvmcD5nUeIy5FMKQ6t6IKRm33q6OlCeGrmaNiFfwN4?=
 =?us-ascii?Q?PlCZ8VaH9DF0uAzJPztCArR43w0iBzK1iRlcLqux58QgmG0xEuFClP9uSAOY?=
 =?us-ascii?Q?SGJbcoRE7qVtZMqftkY0lGjksIefF/+xhF6HqGyf0AXpTzYctd0eoD1GoP3E?=
 =?us-ascii?Q?vTD9GE6m9zi2Ev3D8fYe1QfilURJ2HCuDzW/jNugxqi6Tz8gIbME1YlBl2+b?=
 =?us-ascii?Q?Y+E3YRGxaJlSugBUPJOB/6Wq3pTuCQqk6x2PsLerx5hdMi0BpYZTihRKn4RP?=
 =?us-ascii?Q?ZT2DN2vr+a5p9wHlv+9p7pCYhnVeNFfIPTWkbK/nv8wXbGex8kR0IfhbJLUX?=
 =?us-ascii?Q?PbbodC0K/x/jCbUuH5Iuy3dSRhEoom7L/pBIesR0nmukX/zMmJhhftbQB53m?=
 =?us-ascii?Q?bE/j4L+qrnb77MwmHo8CRNOWZPh87eUJaCvDHWQ8su0gsRiSmivLOMkYpMjE?=
 =?us-ascii?Q?SNuy1Y7UxlhH94bdFGc+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gSwjm2IqjvUuDfvMQODvHfe0nOnJQN2D4t+7bWNYVVm0/R9P069kwoMmdnj3?=
 =?us-ascii?Q?7jM38nADS7zp8tPIHnuSazLnNAFjequJOolRv0f2A4fWThznwZuRZJy2mgse?=
 =?us-ascii?Q?wcIAbGjCGGQQUgyn2PUPUO27G7zTrbuJZ+GeM3uINC9TZyYtnnBpo/rPzo4y?=
 =?us-ascii?Q?ENZbflBJ2cf1bcsv6NrnbSGJr/YaruI+azoTI0UPa7BayzmYJftyYpHj4R8W?=
 =?us-ascii?Q?UMO/dgIZqdfpzEM8jkN162M17MmghftW/GLeNMnE4KQJA9pzVWUB8jdd3XnF?=
 =?us-ascii?Q?Su89idERYd9EYEpIp9AM8KpQ8pYJpO52vNVYCHJKVmN9KafW5CHqYDMO9VEk?=
 =?us-ascii?Q?DyltUeeGDIy5wUSi2whusasLpwl+ls/Z03b4dHyut46RtyL0YVTk4bYqjYWC?=
 =?us-ascii?Q?9fb5RlcuLVXRBCDXfW0coHObYZ2ZQ4Ac+NGrW7gTUt0wdTDe8ryV2Evw6Rh+?=
 =?us-ascii?Q?5NZKzeUYgmsUHzJLABMrE/Wrarh/zfLrbsRjAo0PWSgZSmTHl3NseuONzDtv?=
 =?us-ascii?Q?2grLl5Pk1ymxtAg2/TypMSQtRYGw+9DNd7fhf9JpFZuhITFFfXlVpidVR4uw?=
 =?us-ascii?Q?tlXY15hx0cdeHbyILiKoe5h3IJS6aN880C3j/mHTKsdi0PKh4DbeTHksF4Nb?=
 =?us-ascii?Q?N+lLtUmDqzaj0F1H6EJa3wtqdo1CQm55Z08QoFqLUt16BhR9VYTwvDtw+C90?=
 =?us-ascii?Q?oLZMLxYOGiBOqxEAHK3y3TgzAXc8kpPbqrBGptFc82t8iB//OIXGNko2zzHg?=
 =?us-ascii?Q?tKqV26uCpsEA+7vZRvJn7JaEogmDHXAB5vuM/wrO01ktu+XUBQ5/kN/oYhZ/?=
 =?us-ascii?Q?/q0Ps19V63mYoh4oVVeG66f0VxYTygZ0z4HzEU6YMhfncgpdfCf2w7YMlgws?=
 =?us-ascii?Q?78FjOYMH9k3bN6h60vJesPyQJLSmzag4C2hAJs+NTEkRQCwU+trao8sC/UyP?=
 =?us-ascii?Q?8yRDbITqrP1wmD3TxbYZww86JrlqG0DqSkQ6sb9h59sVA2Nep6ZhvFS1E1T2?=
 =?us-ascii?Q?jeBvICdWqcnjAvHtnaV51NGM5Zs03LBfqRvmH3qfNjabC7fzr/KrwMh1aAOb?=
 =?us-ascii?Q?qi2N/N9euF0Q8KiKhgc/+2QKPx4gbcDyn2r3ArWORzr940HcTcREhjLEJ3xC?=
 =?us-ascii?Q?FL2v4jOGJ1bq47aQoteGS4dGDkMVC9TlkEduXWNSNwK8Wbxsug41euuLB7mD?=
 =?us-ascii?Q?R7qkycKsBu0ZtfYIY6e9Lghv1pR2laHnRfApJ7at55NCqMazI8TJGbHpcyNz?=
 =?us-ascii?Q?z9aKbyujmtkYdTAetk4LRqPUz31BGkXk06pZXGrTnP6Ove+mV+y8IS5sT7XE?=
 =?us-ascii?Q?v/QefdEvbVr5OTSWu1b+tthWM9pyV4ymFrxOeF7Oi7m1ZI3YfGT3cXboSqeR?=
 =?us-ascii?Q?A642QdOJrPTvCO+WnyXVMIpL45CnatqoKIeZ+Pal9Bsf3UmSdc7az7bkzXKI?=
 =?us-ascii?Q?Ohme+dAv+TUZ+sTIInzKMaTihnKYxPoGsuFPDNrht5r80RztAm+hsazMK+iY?=
 =?us-ascii?Q?pjnsQ/cb3Sm/ovVNDaD5FTq4QLNWOyX9f4eEQT1U2D4GFRhhG1eTYi9WMdTk?=
 =?us-ascii?Q?MVa8mwMB68Tsm+u3ZJL1dldUSf9VG3IJ+4q1qFCezfvLiamNqxTHvMGrKEO+?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eccd439-46dd-40c0-8bea-08dcef25b0e7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 03:33:54.2102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOhNqQu8uFID/+ZiMALLtNLRQK8PfygegVD4OjIUjA9spZys5JN6/egdbiOwNu3rPGeuBsGMbDPXDSeuKL+A9da7e/52ld8XXHWYqnQW0tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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

Hi Dave and Simona,

drm-xe-fixes for 6.12-rc4. Mostly some error path fixes and locking
adjustements. Timestamp bit width fixes delta time calculations in
userspace and one display fix for tile4 modifier in LNL/BMG.

thanks
Lucas De Marchi

drm-xe-fixes-2024-10-17:
Driver Changes:
- New workaround to Xe2 (Aradhya)
- Fix unbalanced rpm put (Matthew Auld)
- Remove fragile lock optimization (Matthew Brost)
- Fix job release, delegating it to the drm scheduler (Matthew Brost)
- Fix timestamp bit width for Xe2 (Lucas)
- Fix external BO's dma-resv usag (Matthew Brost)
- Fix returning success for timeout in wait_token (Nirmoy)
- Initialize fence to avoid it being detected as signaled (Matthew Auld)
- Improve cache flush for BMG (Matthew Auld)
- Don't allow hflip for tile4 framebuffer on Xe2 (Juha-Pekka)
The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

   Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-10-17

for you to fetch changes up to ffafd12696d1a4c8eeb7386d798d75e1fafb4e01:

   drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater (2024-10-16 09:07:09 -0500)

----------------------------------------------------------------
Driver Changes:
- New workaround to Xe2 (Aradhya)
- Fix unbalanced rpm put (Matthew Auld)
- Remove fragile lock optimization (Matthew Brost)
- Fix job release, delegating it to the drm scheduler (Matthew Brost)
- Fix timestamp bit width for Xe2 (Lucas)
- Fix external BO's dma-resv usag (Matthew Brost)
- Fix returning success for timeout in wait_token (Nirmoy)
- Initialize fence to avoid it being detected as signaled (Matthew Auld)
- Improve cache flush for BMG (Matthew Auld)
- Don't allow hflip for tile4 framebuffer on Xe2 (Juha-Pekka)

----------------------------------------------------------------
Aradhya Bhatia (1):
       drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg

Juha-Pekka Heikkila (1):
       drm/i915/display: Don't allow tile4 framebuffer to do hflip on display20 or greater

Lucas De Marchi (1):
       drm/xe/query: Increase timestamp width

Matthew Auld (4):
       drm/xe: fix unbalanced rpm put() with fence_fini()
       drm/xe: fix unbalanced rpm put() with declare_wedged()
       drm/xe/xe_sync: initialise ufence.signalled
       drm/xe/bmg: improve cache flushing behaviour

Matthew Brost (3):
       drm/xe: Take job list lock in xe_sched_add_pending_job
       drm/xe: Don't free job in TDR
       drm/xe: Use bookkeep slots for external BO's in exec IOCTL

Nirmoy Das (1):
       drm/xe/ufence: ufence can be signaled right after wait_woken

  drivers/gpu/drm/i915/display/intel_fb.c            | 13 ++++++++++
  drivers/gpu/drm/i915/display/intel_fb.h            |  1 +
  drivers/gpu/drm/i915/display/skl_universal_plane.c | 11 ++++++++
  drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  3 ---
  drivers/gpu/drm/xe/xe_device.c                     |  4 +--
  drivers/gpu/drm/xe/xe_exec.c                       | 12 +++------
  drivers/gpu/drm/xe/xe_gpu_scheduler.h              |  2 ++
  drivers/gpu/drm/xe/xe_gt.c                         |  1 -
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        | 29 ++++++++++------------
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |  1 -
  drivers/gpu/drm/xe/xe_guc_submit.c                 |  7 ++++--
  drivers/gpu/drm/xe/xe_query.c                      |  6 ++++-
  drivers/gpu/drm/xe/xe_sync.c                       |  2 +-
  drivers/gpu/drm/xe/xe_vm.c                         |  8 ++----
  drivers/gpu/drm/xe/xe_wa.c                         |  4 +++
  drivers/gpu/drm/xe/xe_wait_user_fence.c            |  3 ---
  16 files changed, 63 insertions(+), 44 deletions(-)
