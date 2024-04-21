Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961608ABE8C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 06:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C941120F0;
	Sun, 21 Apr 2024 04:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDUHyTgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7F71120EF;
 Sun, 21 Apr 2024 04:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713672726; x=1745208726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dWrTol8pAiZH9zJ1GxnWDUAGj2S5+zLxA3SwjHzwx5Y=;
 b=aDUHyTgqeQb+oasr7LHlqkddCBA2U/X0pusnfVVYsef5kTf9gS/l9mc2
 GbKQHP5+92ZS7FXIRk5jER5+wPwUqvHhkaIMm2iF6SwalGEvPwO07R7Mw
 07MJiHJjUbdubKT3TLcXdheHBrz9t19KaWrSBdkDqHF2Ygqkm11nuDMnx
 5af76E5guk+nqCS9JNOvyRGK8KxbDJC17Ijx217AYnHZdWw0vGTjebdpA
 1CenrDE2NyeOFEiNAuWks2q4GiRrax2fP3EcEm2k/SkM4VISTjjHaZQIk
 syK8fVVdjwV/Xsj68EI/qbTytozaAXqn0tZCHFC3ukqLTc6HzpRtVR+bW Q==;
X-CSE-ConnectionGUID: b8p+jfvMQHCL1jIemwlbrw==
X-CSE-MsgGUID: vLRZ14HDQve9fdY9rob7hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9457153"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="9457153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2024 21:12:05 -0700
X-CSE-ConnectionGUID: p51fxSTATHSmLb6J93y+qg==
X-CSE-MsgGUID: lUK3pjk9S3mlsCD2k0sevQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; d="scan'208";a="28158878"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Apr 2024 21:12:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 20 Apr 2024 21:12:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 20 Apr 2024 21:12:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 20 Apr 2024 21:12:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 20 Apr 2024 21:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFwVctIkjEn8HgVCpORzsIlYnRA6sWTZgMPbVSE7T4tiO5GRGZdBTVh7gO2ZY0G9u8qBImanBZFoVEDZfknsxugAol8TgTAFeveA5yOAecEwxND8hLk9gs8TgscEWA3FyiPjrhNWso9HQEg2RfalLCl1/GVeVUqufsP+Lq4Vlb2RZ7qhVHcwpTg34cLcyoLG2mph0tH73awGy8WAv827bGwUlXFTwPNw+/e2J9ktWoBvGlDSZhAcnMvLZhmt1dAPws0RdV+HENb3QVhc7glu66ix54m+UIoq0YIyxTc16RQ+b8ta6Y36YAINkLJwOY153rrCFY1abOw6ikjERpKqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4kErBGmsR8dYA1AFrptXgldututuDGEjddcz5D1gRQ=;
 b=RZ/JwDwIfOMKT3mGIIwgJuLC7mfdt7G6GSrFHsZ/LvCN2kcXQsvKgyxHbc5ufwDs9hkk7D3FuSxb0PiBaaU479n6TlNthhgEyMTd/Pec9xSvbOUqzu2MJPEMgwdFFsUbowoYsE0cmrhTSnNNcZQHXnLUiT0gPRsuRhA9aKtpwQ7ff4rSfvmCZ7EZss2DWFrbcS/7+3E4NTNpkzfbZxndtmoyXqgnzoIhbYMvGLhOZ9Bq2wqImyIWeme2pjIO5PVbFXdus+nF7sPAFt7czZY4R3mXFVkHJHVrIqeRkDAc7qqKlSz7GGzIdRkygYhmpkKJaFkOVpZUcIcOiZkN1HbQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Sun, 21 Apr
 2024 04:11:57 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7519.018; Sun, 21 Apr 2024
 04:11:56 +0000
Message-ID: <95af603b-10b4-47e1-bbb6-7a819e6d49f1@intel.com>
Date: Sun, 21 Apr 2024 09:41:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
To: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>
CC: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
 <87a5mvppvd.fsf@intel.com> <20240319-devious-natural-rook-df5f43@houat>
 <f3ec8e22-1963-47e0-8c5d-53a7e6fc73ae@intel.com> <871q71wmvo.fsf@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <871q71wmvo.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5d1064-a680-4395-df3e-08dc61b92f16
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmppTWlXTkJKUHRuUnFJNmpkYndJcFNHNEQrM1NqTVlObk1Hc2ErTjF6OHpp?=
 =?utf-8?B?c3Y3eXVkYWZidjNiNEZqTXlPTWpOZVpsUURLM21BTVN3K09ORXU3WGRkdGlQ?=
 =?utf-8?B?a2prV2xHMmNnS0ZrbCtyc0R1U3FkcXd6WUpIVU52VGkzSjNsSXJ1NVZmWmo3?=
 =?utf-8?B?VGRCbWFhbU9GM3RMSU9pVnNWcm5BQWhTN1kxSkpkRHRXSmc4dWVCL3Zic0o1?=
 =?utf-8?B?bEVVbERBMzN5WWVJMVRIbm5NU2Q0bEhicVYyaHpaTXhhQ1Jpb2s1SzN1SjBh?=
 =?utf-8?B?TSs1UWxCOGIzRVJXMTBHWTBRams4T2YrL0JVZVhXd0pLZytHam52VUZJQ05M?=
 =?utf-8?B?dmw5OUZ1VzFVdHhoc1hwQnlEYTQvSGpUNFFBbFB5eDV3MmVWTU0xcStGT0Jw?=
 =?utf-8?B?aWY4N29kNWd6YnArQjRVMW1KRHI1ZmRkWlM4bVB2THh5Yzl2RnhsNk85VXFI?=
 =?utf-8?B?S3JmWnpNV1V2K2VWQS9ETzF2UnlIN0FHSS9GYVJXL3JLQmppUDl4OGlqM1ZI?=
 =?utf-8?B?dGNnRHYydE5Jam9ua21wYWlrcEdsZVIyWVpxSDBQeEtTaEVCRzlRUEdRejZQ?=
 =?utf-8?B?b3JSeGpQTkJSSHdpVXp2NVR6dGdLSlVXa2hJYVpKN2hHelBXbnZVZkZrZGNq?=
 =?utf-8?B?bGNDbyt6eXAyV3c2UUVXTGJHTGNmNTUrbk9odDNpQTVVbElTcjR1ZWYyMTdO?=
 =?utf-8?B?ek5BU3RyOXZVdUJUcTBjYVRucjA3WnhPSFVPV3d5UHhQZ1BmUWFDcEZ4Q1dP?=
 =?utf-8?B?a3JmbE5sRy9UUmxObThWVnBZS0hXTFhyNFRKN3d3alBPVHVHM2JTRlBOa0sy?=
 =?utf-8?B?bUgxWDBqdVNqS3lnRS95a3J4YmVtWWhhZSt2VXQxbkU2cXU2MUozd05VTStk?=
 =?utf-8?B?NkJIeHN5Z2ltQklZdG5udnNpcDNRemhwQitoMHNyRjNOMWtiZ05SZFNQWEZH?=
 =?utf-8?B?dTB4VHJNU2V6U2QxTDZPYTlyNXBaNGJRNjhrN2l3RnJuTFEzYmhjUFNBQ3lB?=
 =?utf-8?B?aGpHYjREQTZlb3VQdURKUXJ5QklUSm95SnJZdG5wcVBpN2V6WHozTlhMcXRk?=
 =?utf-8?B?d2xnWFVrang2aGgrVzJxd3NZN2VYNU1LQ1BaODVMcXFFVW5lNmVzaXhsRzM1?=
 =?utf-8?B?QXJpajVvWWF3YkJZQk5EN242TGFiNE45ekp5NU1uOUZzMTRaNFVsUG9WeUtK?=
 =?utf-8?B?bW1kcUJaRFo2a1NXZWZpWG9lRlpDYXZqRDRzN2Z4aEMxMmt4S1lXSDArU0Rz?=
 =?utf-8?B?eThUb2cxSXI4K1hqd2tIeW4yWlo1aXlVUjF5TUdCditDdWR6RU5KdFlFNlo1?=
 =?utf-8?B?aFhZNnlPWit0OS9wZXN2MzVRMEVPY0VId2pNUnhvdHAvWXMrWDN1ZWhSSmJa?=
 =?utf-8?B?VlNQYU5TVkdVMUhYVXZKSTFJbnJWZ1JKWmppQTdLY0lqTFdEamwyZ1kxYlNi?=
 =?utf-8?B?WFBtNTZHY3VmZ2cyeGs0OTdBWnAxRG9EbjJFdjVBTmtKTGRFdU53TFF4MEtK?=
 =?utf-8?B?Y1ZWVDFpYWh5Q1NROFh4R0hpMDMvdEpzTHQ3T0NPS0MxSHlNd3RITW5UZmpY?=
 =?utf-8?B?bHB4YUVCNnNmVyt1QmxVa0JvS3F1TFpsRWlKUlJwc1RlZnRlOVZyaUxxckRx?=
 =?utf-8?B?KzRkbmptajRPVHowOHpJWDcreXgxaGhwdWxoUDNLc0JVOCtwbGRxN2dIdHBT?=
 =?utf-8?B?OUF6dkJWNlNkYjMyKzF5dk1SWXJtUmpWZkpucWJaREYrRlVSL1lDRnlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJ6a3JjT0RHQm45R1J1djlqbVMxSG4wWWhud1pUZnJHcm9sUlMrN2JDM3ZM?=
 =?utf-8?B?YVVxVnVvY0JXcnVTcS9tcnI1SkZiUDNYcVJEVnJGR1U3ZXBsbVlpT3piOVVH?=
 =?utf-8?B?MWt2NjJRdXV2b3lia3A2bVk2VWV5UEZ2azYrbFhVRUhzQmI3ZnVIMnFDR2w2?=
 =?utf-8?B?d1N5eThDSHBzemtZTDJaNHZ5bmV1OTErY3NiZFJWSHY3YnBJYjdZbUVPenAr?=
 =?utf-8?B?bkhLSVg0YkNwdmdqcm5EWjk3dkFpbzFuS3dvd1c2bjlVcmowcjNzdHlRRnpa?=
 =?utf-8?B?cmF3UDI1azlFdk5iTVkzVmhYbERSU25XNVFPRW1VQU02eDBrdmh0ZEh5M3VJ?=
 =?utf-8?B?VFM2cHk0bUwvckhqazFmeThLL2oreTBaRUlodTVFdFlKTUNraGJ1cHh6STdE?=
 =?utf-8?B?QWhCcm9XMVNsNmxidVBya1dKT3NmajNVMFFJc3EweU1QRXpqUm9pbEorTDg1?=
 =?utf-8?B?K1JNdm5zb1BTY3J0alJwTVU1OGNyTkJQZkZLMDhvUVdubW40ZmNxUmpvVmh2?=
 =?utf-8?B?cWsxOFhvUCtEbXlMQkdqeTdzamRhY09IZXhIQmt2aWUrUzdURUkzenpLZlFw?=
 =?utf-8?B?RzdzNnJ4SVdkb1BGS0RnMHlEQzRVL29YRXNGVXBIVzhLclJYbnBwQ2FnMU1w?=
 =?utf-8?B?MWMrNHY0cUdHWnl6bEpPRk5XWTVjaWZlaE5ldzJtZlh3bFFYY05tS1o5bGZk?=
 =?utf-8?B?cGE5VUMwSXBsc0llTU9TbzZOVGZnanhZWmJMNVYwL3hUS0kvOVdUOEhSWTEw?=
 =?utf-8?B?QjkyU0FhZzRKWWx5QUx0OFEyOUpSODZ6UStHYmxQR0U1MURESWN3WHRualh5?=
 =?utf-8?B?QytiZ3VHZXpKUG1hVEdNQlg3RCtINFV0SnlkZWVqeWxwUXFHL1RSeTdKaGZU?=
 =?utf-8?B?MFBTeVBnUGFGSUxJZFlPNHBaMzVqTUJIK1ZzekFFQXRjaGxLRTFRUWtIN3d4?=
 =?utf-8?B?Y1ZSS1hwS2xuNUNPYjV3VThtUkRRZG45RU5PZ1RQcGRxeFlhdG0zRzZSUElT?=
 =?utf-8?B?bm1vaEc2VjFGU0Nha3l5SURyeDhPcDRkeHB4OHVWK1BqMkoxTlRSMnNCMzVQ?=
 =?utf-8?B?cXB6dXMrNzZhL3hyZzFNQ1psaklLL0tXR3cwSkJ3S3RMYWJhK3lGMlpjWEtk?=
 =?utf-8?B?OFRHYStSRFRpV0w2bHlDMSt0Ui9rdlFLMGQ1My9SQlRRT2NjZ213Q2MvemxG?=
 =?utf-8?B?dGFlZFNVT0NpdDF0V2Fmc21sUUtsbEtRK2pZOFF5OUdiNDZaNHRObXlETVBO?=
 =?utf-8?B?YXlkVk5XWVQrcGtHRjJuMVA1dW5MT1NLVTlhS3E1eTc2aXNJOHNrd3NPV2Vt?=
 =?utf-8?B?NGFBYjhMRnpvUXNsUW9VRnJJYkozT1AzQ0IwUHZ2TmEyTUhCbEl1dTVXbjc1?=
 =?utf-8?B?blJtc2RLT1Y0NXF2YnhnMGttWCtuZkpWcjJQSElGRXZtMHZ2em9QWGxncmJp?=
 =?utf-8?B?VFZnQ2ZFbXJvSEp0cUo1dUVXRGxHTGFrKzlkMTlCb1luc2k4YTB6d2laQXBR?=
 =?utf-8?B?am9qL0NvbWpjUG8vUVg1YWRhbFVSa2VJWk1wQkZTNjhNS0NyZXcvOWlWcXhE?=
 =?utf-8?B?S1IxYXBORFdnRXpKSHdmZmpFOCt1bTZ0cW5TMmxhVHkvK2lNMUR5WTl3S2dz?=
 =?utf-8?B?ejQyeU9ocE9iVlVuVEd5RkVEL3RNVi9SZUY0aXRrRDBGUDl5TjlST0hJeG9S?=
 =?utf-8?B?dWpBRHJTemE0K3NlZFRNU2NCVXB3R05keUJQWndmTko4MGxMbFRJaldYZGtL?=
 =?utf-8?B?blFkMFoyeEg2aGY5NmkxNlVnZ1J1bGNmSVRVTHpnMFpzTzlIMGxGWVQ4QlJj?=
 =?utf-8?B?TkZ1TkJJb3pPVHNXZXRZVk5Ic3d0UUNhVk1DL1pPTXgrMnZOcnpYQVNEVjZz?=
 =?utf-8?B?WEN5VlBYczdob1FLN3M0c2MzVkFoc3l2ZzN6ZlNNNWtwRVJuZzBoN2pLSEMx?=
 =?utf-8?B?bjVYQVFzaVJva0VwUm9wMTk3TUQ4U1BTRURKZFRXdkFIamFFZ1czYm9EazBz?=
 =?utf-8?B?WDZnV3RWZXN2MWR1MWx3dER0M21xbGo3dytHVEJQWS9od3NTeFVoNlQ3QlVl?=
 =?utf-8?B?ZXBaUkNodmpZcFZab3RyR3RncDhjUXU5eCtBUHV2ZVMyS2lCOEFGMkdoZjVB?=
 =?utf-8?B?OTJDLzY1YzRhZG5UL2FGTzRCa0VFMmRVRCtrVTlXZjEyaGxBU1FJYzkyRnU0?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5d1064-a680-4395-df3e-08dc61b92f16
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2024 04:11:56.8112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+8ji6+Y7jgLXFTIfu2B5eE4xYKHDGogKM2oEIY4t5ntSq5qdgvQUY6t9p5Cir0ZRYVt7HivFC28DFczVcjR51VKWr/vzVw3oRYlCHazmac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
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


On 4/19/2024 6:05 PM, Jani Nikula wrote:
> On Thu, 04 Apr 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
>> On 3/19/2024 3:16 PM, Maxime Ripard wrote:
>>> On Mon, Mar 18, 2024 at 04:37:58PM +0200, Jani Nikula wrote:
>>>> On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
>>>>>    An Adaptive-Sync-capable DP protocol converter indicates its
>>>>> support by setting the related bit in the DPCD register. This
>>>>> is valid for DP and edp as well.
>>>>>
>>>>> Computes AS SDP values based on the display configuration,
>>>>> ensuring proper handling of Variable Refresh Rate (VRR)
>>>>> in the context of Adaptive Sync.
>>>> [snip]
>>>>
>>>>> Mitul Golani (9):
>>>>>     drm/dp: Add support to indicate if sink supports AS SDP
>>>>>     drm: Add Adaptive Sync SDP logging
>>>> Maarten, Maxime, Thomas, ack for merging these two patches via
>>>> drm-intel-next?
>>> Ack
>>>
>>> Maxime
>> Thanks for the patch, ack and reviews, pushed to drm-intel-next.
> This came up again today [1]. The acks absolutely must be recorded in
> the commit messages when pushing the patches.

I apologize for the oversight. Moving forward, I will ensure to 
consistently include the "acked-by" tag when pushing such changes.

Regards,

Ankit

>
> dim should complain about applying non-i915 patches without acks.
>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/Zh_Q72gYKMMbge9A@intel.com
>
>
