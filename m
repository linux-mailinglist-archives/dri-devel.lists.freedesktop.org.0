Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF49A5E7E5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5D10E7C4;
	Wed, 12 Mar 2025 23:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFcJRqZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C66910E7C4;
 Wed, 12 Mar 2025 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741820472; x=1773356472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=b5CME6Kq0cM6eI0ZSaR5Sq4qPyAWwrsOUsqySK1L34M=;
 b=IFcJRqZA6C7DP7II+A7ISWPAVyOQRhBnHSsXhiJYzeN8pnkXR/ydRF1C
 WgsFNkHi846Tc9Jyac1dCzJZhynznA27zOY/wtYSJ/7JbZbYlCcXkSful
 FOAJ9NYwm6FBrtFTqmmy2kb1caTZ7k7zkIlV1mk2RAX0RqPbWgWSVclPN
 CePqjxp4aRMMvhD4IZ9pIQsceDasrcDJUUaQ0eQwddVzOOxBqF9n2BUuE
 vvbKHq+8AyNxjiTEvX0PXywub/d1WhjZ8zliZMR9A9aJhX2f/d4bmIi/m
 wJNsumpLECzFYRDv1JuvckWaB268z1OeJVeR+l6uu6LT72uEKUrfNdn+H g==;
X-CSE-ConnectionGUID: RxnqisBQTM6PkGK2Fni40Q==
X-CSE-MsgGUID: HcyZwPVpSuiouwRwLlHF3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43103859"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="43103859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:01:11 -0700
X-CSE-ConnectionGUID: WtPSxywVSGym2PGt3NC3ZQ==
X-CSE-MsgGUID: 89ftNNQXQNGd/wS8rM+hOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="151604654"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 16:01:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 16:01:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 16:01:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 16:01:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wV3v6hM2K2sHjYeOdElEUdNFGwGZ6YMEJvd1ZU6hoSPPDWgwktmgmGY1SicbrMfRpR8JGkZiMpPpyMZ9ZCpKbcNb0XqEqnzpBdw1JSuZDBhUa51NhJZwv1fNLe4leKtQFfOyY4wkc3+Mm56cEd9BK8utJqo/NtSB0Ph3kdfI1k/REAGFXwSSnk+fwfBcj6S5352K2u9Sh7qhx+WJ30pZ2smKhYsc4+Rw5QdvL8F/NvwlIUKrqAy9oiFdB3Vg6e/3kayqDd8HzZoKL7ZJoPHqabsisrxcxQdsdQGPRZW+MdaLisodWZwOakjCD/CzU994gpT1KeJNpmN2umwqMAzMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVwLgLV93AcvNgBV82/WCwJUu1K2L/gGXe2Dnc4Ak04=;
 b=Sxu9KmLNgO+SWTNROsKEPxpGqQSE82JMcsrbMM7mXfvhst6J0TtmvdHTyG02LhOWW7BdhCAHsSym0O6iNTpTHMLo72LvFrCAClWkJbGEseT82tICAOwQNSG09UG+kCnwMweV4TDUsoEivfIEglzcZkZQSAPFZ4T/SuC5BPEoohgMwo/SofVPsZUyjTiS41i8R+bZ0SjwFyxi14078GQGE2rNj2ObkMjiKhcgEhCyvSuUbQTRwnppL3k8UvDobz3WCRF+EE/PWEY1MQJrNqnG5M7lDqwB8nwue8CFpyRQwmaPX26y1Z0XGkox211icMwyIcxJB/ywT0nScVguTFW2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Wed, 12 Mar 2025 23:00:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 23:00:52 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v5 5/6] PCI: Allow drivers to control VF BAR size
Date: Wed, 12 Mar 2025 23:59:48 +0100
Message-ID: <20250312225949.969716-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312225949.969716-1-michal.winiarski@intel.com>
References: <20250312225949.969716-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: f687b3ce-4af6-431f-daa7-08dd61b9bd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajM1Y1QwQU9SRGZYRTA1VVVpVjdlRzFkQjdSd1RXQ1FIRm1QYVJCbVZkS3Rs?=
 =?utf-8?B?blJORmdvV0x2ZGtObnc3bHJRalQyNWlocEpSNHdJT3Z4K3QveFZRYTFVV3Zs?=
 =?utf-8?B?WWxPZlJEOXdEdnhGN2FEM2Z5SkltYUFSS0Z0VU85MUtJbHFDaTZDREJHK0Fr?=
 =?utf-8?B?ZURRVENZWFFFd05NN3VISlJQYmZIcXRGNVNGZFp6SGkrWk16VFhaeDQvemo5?=
 =?utf-8?B?QXBQY1NBLys2ZTBuSXNJMVRUTjVKdGRzcHNab1haVzZ5QnlTUWhNWWttWEE3?=
 =?utf-8?B?K09LZ29rTU5qMUVvd1c5MWwzbEJXcld3NzNlZ0dzVHJsTEtidnNZWHl2bmpR?=
 =?utf-8?B?MjY0TktJVDFEVmxFNTFTQ1lBT1k4UUZjallwaGdUK3NnWkVzTVorbUpVbkNh?=
 =?utf-8?B?V29RcjVjVnNncWRNRmRMNjdsTVJsYXVhbGVHaEE1TlduV0h6ZFpNREpPQkpl?=
 =?utf-8?B?QUo1NnZxOEFONWQ4WkovZDVWaS9ndy9sVWhlR1UzdnRpRmk1UDZ2dmZNMXg3?=
 =?utf-8?B?b0J2MTF1VXI1ZHk0ZWFFdlBzeFUxdUw4eWdpQXBkOGJVRElMR3IvZ0lBT1Jq?=
 =?utf-8?B?Uk1COUxZRmJJRm1WbGVmYjBpWEJWRVdXTjRKMS9XVFZNU2d4NXlPSE5ZYTRr?=
 =?utf-8?B?UFFUN2dBaXQ3Zy9adGNVUDZVUlUrNndvS0g0a3U1SFVuNTkxcnZZMStUWVZo?=
 =?utf-8?B?THVGVFlCTDRPenJkWktER3puZ21uMVZHbkJHMlJPTVVCNXB5SElhWmk0VWJ6?=
 =?utf-8?B?cGx0VXlyRnJ5TEZNRGt5M1RDcCtFMll2TjFZQ1FwVEVQQThJVWlFUXVEWDlF?=
 =?utf-8?B?dGJGK0xmQ3o3NnN2bUk0dmNYQkUzWHU3N1MxNFdua0FUQUt1RFFkU0ovU3pN?=
 =?utf-8?B?SGRoRnlvdFAzNmttWnRhbTQrZldISHVob1VPREhaT2JUUUNMWUVST2lMUXBC?=
 =?utf-8?B?NnJmbG9rS1drRlFZdXNHK05qelNkSTBSZjVnYXVJaGF3R2VkWldNMWs3cTR4?=
 =?utf-8?B?S25WMXBmQk1UZEordXVBRlFsZ0JCb0pxK2FsVmtFQ09zNUNNc044TFZiTjdQ?=
 =?utf-8?B?VFE0VXJsYUtET3l2bFJCMmJZbk5NczIyR3JYWUNNNEVBeEg2Z2oyNDJqMitI?=
 =?utf-8?B?OXVPSkdvQ3pXT3V1MXhzTVZXak0yL3pjSUg1K2xibXRTU1pwWklzcEVaL0ky?=
 =?utf-8?B?SDFxWEw2VHVLUTRkdU8rMExxY290elE0aXhuSEk1cHQ4N1BpMkVaRTgweS9p?=
 =?utf-8?B?RnBERUtUSWhJKzRyMlVWZTZaSHRKdTA4SmpXNDcrTXkyR0xTdkNEQzJjM3VI?=
 =?utf-8?B?SnRiSStobStPSGZQbTVCcE5mOXF1eUJmU0l4aFhqbXppWUxNNXpaMVYrUVcy?=
 =?utf-8?B?cG81aXhKdlRHZkFVQlZsTHlpNjE3ZVZOd2IyNDZzck02Z1BTNE5malRKLzVU?=
 =?utf-8?B?dXZuK0pLS3Y0SFQ3UEhXaWVGUFpTRklLeGtMVWxlNVkzeXg5RkFFQ0xhSVR4?=
 =?utf-8?B?aTFyWWFYRFd1RCs4TUgySE9za0pvVG1BTS9WODhnOHU5ZHIxS0Naa0lNUk1o?=
 =?utf-8?B?WlhYWllXdW9uWnc5N3B6R1NDQXNPOFN3Sy9OaHRzQXlqL2lTZXF1cWdDSWNG?=
 =?utf-8?B?Ulg2enBFRkNEYlpiS2tCSWdKNk5ZOUtubEJ3a2ptMDFLSkFDaVBCbzFHUllB?=
 =?utf-8?B?YXkvN1Fpa2d5WUhXeVNFd0N3ZktRb1BUQmJITm8xc3VQNFlBMUN6YkVQZHox?=
 =?utf-8?B?cTZVU1o5UG1nRnVJQUx2TGE5TXl0Ulk4UUF6RGFjZTltS0FQd2RrOEFNa2pF?=
 =?utf-8?B?bUhzc3pPWkR5U3ZFelNEOVlXbjYrSlJ0SkxqQmc4SjQyMVBvTWpabCtGbUla?=
 =?utf-8?Q?LBv+Yb+AYafXq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHF3dHZjcHpSUjVnZDVEZno4NDlYY013K0pXRWY0RHdVRDc5aFJMenZ1d0lo?=
 =?utf-8?B?TTgwb1JSZFlqcEdLU3B6MTdpUkNJRmRjbjUyR0xGQk5TSUN2enhjQ1dOSnNV?=
 =?utf-8?B?bHhCOTRYNVBQLy9zWjljNHUzckhoYUg2VmF3elVVZDkwbG85Z2VkaEozRFFU?=
 =?utf-8?B?NmdBVlo3YkR4RjV2MmwrNFhwZ2FkUE5xZG5tbkdHdzcvNXJPWkVveFVHRWxT?=
 =?utf-8?B?R0t1MUNKRERHQ0U4UVpMWCtJd1M4SE9jT2xON3F3Z1g2U1hXOFEzMzV3cWdr?=
 =?utf-8?B?cjgwaVdWMmVzbndDaDJSdjlJbWRQZ1pHVm0zUjdDKzlqSEZsR3pPd0FabUlC?=
 =?utf-8?B?ZmhxK3VzdHZ0aWxyQUVNUlVGc2VOWVpDU1IxUVAraVk0dmxmS2xxUDRFclZ4?=
 =?utf-8?B?OWJGb2lIZUpSZTJ4NE9mV2tHdDJOeXorbFU3cDBFVXh3WUZNNzB5WlVHNS92?=
 =?utf-8?B?OUZhUE5vV0xTRjBvcVdlbDFhemxEMVllTHJhZnNTTmhFS1JrQnFnZ253bTVm?=
 =?utf-8?B?U0w2UkhKZ08yOEhKL0JVTjNwUXI1NWdMTTgrY3lRTlFwNUp5WSt5SGNQQ2N1?=
 =?utf-8?B?K2RCRm1PR2ZWYjMxSWFUdWtpajRuY0dzOEVaZTVXTEJLNFZKQ0I3bDIyVmJq?=
 =?utf-8?B?MWRMUW8vUzFseWdwTTd1eGpJcmUrcEtHcmlsYVMzZjhrcnRwKzBVWjVKWHpa?=
 =?utf-8?B?RzM1aUxjSnE3UXVlNHRMN2RqQVBjaTN0R2dJNVFwTmtRcnFlNzZCQnlLdmE0?=
 =?utf-8?B?MytmMXBzamZESm1zTFNIYjVGNXZCdGZYY0dTbDZKWTM4UHMwQVdCUC9rK2cz?=
 =?utf-8?B?RDhKSUs5cG9veE5QSHl3RU5uR1NTUnExa3kzd0RIU2VSYy9rUVMvUTVhQnFr?=
 =?utf-8?B?MG5YTFZNMHhIS0pXY3hFTWlBdmQ5Y3hwMTBESUJPODAyMXNyVGdiWUNuanVx?=
 =?utf-8?B?S3dYZFhZd2V4QnN0dzQ0UVBTWExjWlVNNElXUnBBdzNmV0NHazRNRGk0bjhu?=
 =?utf-8?B?YkNGZElIZHpoNDZYN2l5M2phQkVmZEpkM0JFb3JsUkZzUWF6RHZhL1lzeUV0?=
 =?utf-8?B?NFNaSnlsY3UwNThia1g2cTFFNHhKYlZpNW52WEFPSlM5c1BJVHYvWDZXUGJp?=
 =?utf-8?B?NzJIVldHWEp1S0QyY1ZycHlDV3ZZNWp2Yyt1RFBBcWkvbDNISWVKcXVuYnQ1?=
 =?utf-8?B?VlltdXpyOVFTOVkwc2tlYnZzbWZ2MVRXRkhDMUVYdklKNVk0VmZYRmNjZGtF?=
 =?utf-8?B?YTQ0UEUwZEM5VGhiQ2VVRHJoV1N5MnM2RzNoNEtReDBKVndmYnZidXF2MW5p?=
 =?utf-8?B?QW5MSlNJRnJNaFNSVElZUzkrcUIzUnNSb3lUbUgzUjBxMjhxQkhtYUV3S1hq?=
 =?utf-8?B?dUVHZENUMXRKRTY2NDFzUGtHTlR6NUJMN1BtRTYrRmhiaWZIUGkxNW0vcVRv?=
 =?utf-8?B?cm1Fa3ZTYTBLOFo1VWhZVGZCUmU0YUF6bVAzNmFIMFpjd0VzeFJzNEQxMjNP?=
 =?utf-8?B?TElzU3JSODV6OWMwaTFOQkFTRytHNmlGc29WNXg0ZXIxMGVUNFNmdEJOdTVy?=
 =?utf-8?B?T3BDQ3V2WVpWRTRDZjZuMWF1RjJ5Vm45LzdHMkZSajVMWlhadjNpQWNXMUtW?=
 =?utf-8?B?Y3pjOWtTMVRKZ1JsS2xjQ3U2aVV2dVpJQ0RzeUpWK3FWOTZNeFJhaXZrS3JJ?=
 =?utf-8?B?TEN6aWJTK0RnWmJQV0FzMWxEcUJaVlVGWTYwQXlITTE4QTRSbGNqcy9TK3Jj?=
 =?utf-8?B?UHhVUG5xc2lxWndJVXZYaGlkdzJWb3dDMlB1WENrVnFvRllZMHJsS0FPSXBm?=
 =?utf-8?B?QzZ6dy9NMGtQeDZxYzc2UjBuQ2tFVnJncDRhcWpRaWxQTkNRa3dsZVZRcUZu?=
 =?utf-8?B?Q0ZOdGZUaENySDBEQU93LzhCOG1DL0FWV1FFWFhOOGpvZXJPZHJBWjQvcGwz?=
 =?utf-8?B?TDlFVTdTQWJXRVlzL3hzL1lROFA3akwxSU1YTXFuSG1ZRThkVTJ4b0p2RzY4?=
 =?utf-8?B?Z3FpNnc5SlNuVWJwbVBiU1B2Q3gvSXc2eHFxZFdVc283M1BxWHNPSE9oS2JX?=
 =?utf-8?B?dWJUOVN0TWREdG03V2xPMmd2S3ZkTm41c0ZDeXR5Z3RTYUJvWFdnNytqdHpN?=
 =?utf-8?B?WThibytuOEltVFdaR2s3cGdpUExUazdEb1ZKbEZ4ZG5KVDhDOTJiMnV6aFRM?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f687b3ce-4af6-431f-daa7-08dd61b9bd00
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 23:00:52.5437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzuDcTMj8GAvFCzxsaYLnygQdTpWhKmQrmJHfO1N5iaxc7YJh7Vv0ES3NFdKJErMWTg4pNL6/222frwEl62IuvJwYXmn/0q/mT/ke2UbcTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

Drivers could leverage the fact that the VF BAR MMIO reservation is
created for total number of VFs supported by the device by resizing the
BAR to larger size when smaller number of VFs is enabled.

Add a pci_iov_vf_bar_set_size() function to control the size and a
pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
allow up to num_vfs to be successfully enabled with the current
underlying reservation size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 78 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  6 ++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index d6d63083884e6..76846df2a26d8 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1290,3 +1290,81 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
 	return nr_virtfn;
 }
 EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
+
+/**
+ * pci_iov_vf_bar_set_size - set a new size for a VF BAR
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @size: new size as defined in the spec (0=1MB, 31=128TB)
+ *
+ * Set the new size of a VF BAR that supports VF resizable BAR capability.
+ * Unlike pci_resize_resource(), this does not cause the resource that
+ * reserves the MMIO space (originally up to total_VFs) to be resized, which
+ * means that following calls to pci_enable_sriov() can fail if the resources
+ * no longer fit.
+ *
+ * Returns 0 on success, or negative on failure.
+ */
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{
+	int ret;
+	u32 sizes;
+
+	if (!pci_resource_is_iov(resno))
+		return -EINVAL;
+
+	if (pci_iov_is_memory_decoding_enabled(dev))
+		return -EBUSY;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return -ENOTSUPP;
+
+	if (!(sizes & BIT(size)))
+		return -EINVAL;
+
+	ret = pci_rebar_set_size(dev, resno, size);
+	if (ret)
+		return ret;
+
+	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
+
+/**
+ * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to num_vfs
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @num_vfs: number of VFs
+ *
+ * Get the sizes of a VF resizable BAR that can be accommodated within the
+ * resource that reserves the MMIO space if num_vfs are enabled.
+ *
+ * Returns 0 if BAR isn't resizable, otherwise returns a bitmask in format
+ * defined in the spec (bit 0=1MB, bit 31=128TB).
+ */
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{
+	resource_size_t size;
+	u32 sizes;
+	int i;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return 0;
+
+	while (sizes > 0) {
+		i = __fls(sizes);
+		size = pci_rebar_size_to_bytes(i);
+
+		if (size * num_vfs <= pci_resource_len(dev, resno))
+			break;
+
+		sizes &= ~BIT(i);
+	}
+
+	return sizes;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 7192b9d78d7e3..76de900c652f8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2393,6 +2393,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2445,6 +2447,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{ return -ENODEV; }
+static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{ return 0; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.48.1

