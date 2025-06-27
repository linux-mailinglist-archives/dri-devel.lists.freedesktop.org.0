Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59436AEB97F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 16:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BCD10E326;
	Fri, 27 Jun 2025 14:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYpRf6Na";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7CF10E323;
 Fri, 27 Jun 2025 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751033232; x=1782569232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FZhHgQKXSolAmeLZIMAiOCKmK0/w+1PwOJaYy1WPARU=;
 b=fYpRf6NauWv5OedVDmTDALrz/jmTOwfzMAAdECHrdbts8hWjLMidMLD8
 aej6DSXXMoS1yMFEI7s2xiTKDaBJ+vGpShc1d5TQFJXC6zJG/iXsevll7
 Hlh3iGwcWDTSpdFpTeV42YJFUyGCVFgt/CM0PCW0aPVaB7Z6onYDi02D+
 jWS8VUU+X1n+FeR3obbaLCDW3mryQFGrP4rHP9hKmo/c/AJ//wCU5+FZG
 zab29WFLf3Z7uryqs9kD5+6HOrh9Q4FKM/doZkYnQ9qnVKxPIZA6QasIM
 DpmyMwcqUM2P3yU+ZGG5A+SwO879Dl+UcJESLtkfFPq2/t23XqxcgXCjc A==;
X-CSE-ConnectionGUID: 2VSR4fj0Q1WfUzpTNzgtbg==
X-CSE-MsgGUID: YhQxBxXMSViYVN2t3G/3+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53497041"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53497041"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:07:12 -0700
X-CSE-ConnectionGUID: ieuwIiBnQz6Prqj2F2UdMQ==
X-CSE-MsgGUID: cmmInP/kQpScZG1LIHI/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153528684"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:07:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 07:07:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 07:07:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.81) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 07:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJtHEpckqpzhMVAnS2Hs0E4IASSGARrO8uNYhCZjOFpRC3JHfFXp29DNQEQtBembZLiXQ4aypnIbeGJUHeA8wbTy1wm1YgOudu0/zCP0i0trLll30aoX4lHHHyVC4wZF2JvBH6g3e1IQJL+lXNMraWktTH2MMR9TUZiN5nYpedsbfx+SHIqrwKHVAuW6PHOA4pj1E5+M8Radsi9hff8/Gl92hjH1on7+NaC8CoI1MFs0yYlVH3SDbfsHP9ooEKyrkggwZUgIBYDuAOgJMj+XkNLZhQrbi/MUKVYMqD+QwX4lU7WPVoYSANI6b7xxUbn81SuFpPqaowEko/K4JckQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=410LgYdkqs2mNVltFQnlb/rJJAdTzBTlC+DRr8XQ0Mo=;
 b=hnxurqJSnhTc0yENDbq9QFvJS0MZVtyluAvDeM//0peEXPqHdHZCr0F2VbILYcU1tEJMheYDTN4sYo6b2SX1YNktmsct5GucKI7PFffnPsYDvcfOLSdGNlFdQoYQsteKgjslPQDjSy9lIlpO2dTOwEPFx3G7daa27c7D9OcK9ljMdwSRNgNczEOdMQYrEQZOq50CSMcS3EA1kzhwzhzjw5ihJvicrBnK4x5amHOEDL+Q8M3+n+fDQiJaa+GYE9ict0Oq5Dfm/taVx2dHPkFFdCdV0kB13FYQogm+L+Uz4W5tdljUsGheGQSXEZH5gEjdG5wyVHT3Cb/Gk1gaSLVBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB7212.namprd11.prod.outlook.com (2603:10b6:208:43e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 14:07:03 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 14:07:02 +0000
Message-ID: <d9e38b99-c985-4e18-b6f0-bfcb907f3689@intel.com>
Date: Fri, 27 Jun 2025 19:36:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <CY5PR11MB6211FB957C9078592ABB49C6957AA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211FB957C9078592ABB49C6957AA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9f4d37-75cc-4a96-6f02-08ddb583e381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R054NUlrOEM5Rks4cVVPb3lyNTFwVC9HOGVUc056QW5QaFlSNXAwMGZ4aWda?=
 =?utf-8?B?YXFnNDhtb3FwTHVsWHdabHl4VmJWQzd2QmJqbzlVUmJPMURZSTVqUWx6YXBv?=
 =?utf-8?B?ODA2NGR3ZFN1SWJUOW85bEQxZ2w0ejJadTRVM1B0NHNJaStVaTNGaFZheGtt?=
 =?utf-8?B?MFRIOS9MMHhtWHUzeDFTT2k0WGdCTnlvY3QwRWdMYkxGVE1sRW9ZeXp2d29m?=
 =?utf-8?B?N09zS0RhUFlQSDJrMnNvMFpVUTBXT25yQ29BSjdNSWNlT3FnbUR2WXBsdjRW?=
 =?utf-8?B?VHg4aWxyZDlPUEhBL0czQXBWbndkcU1paXd0b1VxUEtjRUYyeXY2b1lmV3l1?=
 =?utf-8?B?V2hsVGx4bDJOYWpFbVdYT0FPL3hpcG1LOU40MEJnbHBSN0ppK25jOFdQRlNk?=
 =?utf-8?B?YXhYalN5NGFGc3hSclVab2paVENJSnpRMGxUQmpuSTZlaVZDazdtTiswVG9F?=
 =?utf-8?B?ZWFrU25Ld3g5MkRCQmpJc3ZZc0RrZzlueUI5a1ZiVmF0ODlsM214S2R3aXpL?=
 =?utf-8?B?MjlDVFB5YkFjOWVrUVVORkdQYWlzbE5Wd0tzWWFmVmRhTmdpUitCdG8xQlor?=
 =?utf-8?B?L3ZteCtucVkxaFhNRDZuWHlCZUNCOEpaMTZwUkN3d0I4L1pwN3puNjllVHBu?=
 =?utf-8?B?NjNzQVBuV0RFSWQybC95VW5pLzVHTlZzYTE3T0VKTzZEZXFWZ2daNzNlc0VX?=
 =?utf-8?B?a2FjSUJRbm0rUW9ySEZSMkVic094MjM1REhyeWpadytjQ2dBWFp2M2ZrQkln?=
 =?utf-8?B?TnhqT2szUTN6eXVGaWY4cDNlaDZWVDgrb3hJUUZjbDZLS0ZLTzdGK3dSN0JP?=
 =?utf-8?B?WlFrdkpzaEVGRi9nWFF0OGxCay80N0IxZE5DaHk1QTNCV1ZZYU5Ic2J4VWYv?=
 =?utf-8?B?YnpGbmFzUXlGczNnNmt4LzJGQzZXNEs1Tm9KY1grZTRoWlhUUDVUK2FxL2hv?=
 =?utf-8?B?aW1aMzMzZGNMK1Fvc1pZS2hmTDMvU3JvajRUc3pVZUVqdmp2SE5uRkhPbUJJ?=
 =?utf-8?B?ZlJDWEhxdTJLVmZQaktKNFNtanVJYXRLQU1XSjF1RkFXeWIxY3VHUFBSM0RJ?=
 =?utf-8?B?T0lJN0lrLzFNZDRIK2RzeTlPRUIxU3lDdEhqb29uNUUzR0ZQK2E0ek5XdzRs?=
 =?utf-8?B?Y25CZ2FZTTZMaEU0QjR0TE8yR2hDSm5ha09nRWRzd00zUEwvU3MwcjVjMmlo?=
 =?utf-8?B?VFg5MXVuRkFacjVnN01RaXMza2xoRldOU3VvdVppVE5YUjE3VUpBZkxUNFhC?=
 =?utf-8?B?eVFsRElvSmpkK3JRRGozelI2SE56M0N5b0Q5ZkNNbEcrWFhRU2hSakszRko2?=
 =?utf-8?B?dTJScHI2UklKQXh1dkVXczViTGlvVDJzRkpwZzV4TGVpWGNFOW1MUkNyV0Vp?=
 =?utf-8?B?bFgwb29aWmhhUUJyQVZkTUY2eXRLS1F1OEtYdG5kenJucUlMbU16TGwyUGwx?=
 =?utf-8?B?bmRENjdjYlZXRUlxMlFiNjZWL1d3cUxkVS9obDhRdlRFODVmVlh3d1VVT0lJ?=
 =?utf-8?B?MWVwUCtEUE5QU1V0TnZNNENpMEl2aytUNVVTYStwbEp0LzBMUDdlanBGWmlv?=
 =?utf-8?B?ZU1VSE9zNmZHQmxmK21teVV4SUJUZnJQSG5VdXNCcDBidlAwZTJaS05EcG1S?=
 =?utf-8?B?R0gveVZvZG5sdUtxUERSL3ZHWUFFZXJ6STVFc1NPRmlISEZmTHp6RTVuOGxj?=
 =?utf-8?B?RnB6STdxVzB6ekNPWU5oM2t5c05vZ1VBOHNtZS9ySDBDRnBCUFBncGlvNWZ2?=
 =?utf-8?B?NzdST29GbDFtdCtDalcvRnhjNlJaZ1BWMjJXVS9mbkpvREFIOE5hNEZmQTQz?=
 =?utf-8?B?QnRiOHhvbU5kbmpPRUxpWnhOeXpCeERWUlVtbXlzbGJXNkVPU0RHYUNGRXBt?=
 =?utf-8?B?cy95ZjFFWEdHYmZ4UFNjWXRhbVJJRExYR1hOdW5oK3U2M0tOaVY2cTN2Ung3?=
 =?utf-8?Q?H1/XWMg1drw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sks5MGtFRFd2cnBjK3VjUmRjQVpVVzFEdnM2U3J6RmxFbDBqNWs2ZTZ3UXR0?=
 =?utf-8?B?TEI4R0FqakxxZnE5VHNGRC96WlBTSU1Rc1YyK3ozTGFKNzlxY2R2ckRxanVX?=
 =?utf-8?B?QnZ4QmwycFB0VlJqNDk0RlV4SE9uMHhVdzNxaStlTEwyMDBMb0QzL1VRY21u?=
 =?utf-8?B?YkwyTUh4dXVubTByNmRwME04cWRXNzdpaDRJS1hoRlFWUXo5NEIxSVFJMTNU?=
 =?utf-8?B?WGpTK2hnbitNUHlDVVM2QzAva04vOHRMeVlXbVdrTU1kQzR6MTlXQVVINWdv?=
 =?utf-8?B?WUxnb2hoY1VZT25hT1k4MGIvTDNTUG0vdG80alN1S0JBZmVHeldLQWhKZ1hv?=
 =?utf-8?B?MXc3UkVkZGhrRXoyZUYxN1VZRllmZ3FNeTFvMVhDTW9Edy9UVmprVjcrcVI4?=
 =?utf-8?B?d2VaRjZMSFJNeDY3ZE1NWUNOMk1FK3VLRkJtVkRIYmZ0ZUc4c0xHUmgrSEdI?=
 =?utf-8?B?WFI3OWZiUHlXemRNUzk5Tzg4bnVQdGNmS05hMWdxMkRRbnpaeTFNQlNrVjgw?=
 =?utf-8?B?MVUwbVdic01hdTQxSDczWWRKaHFFdy9ZSjVMSVluNVp4TG1FSWVjUXlmcXJZ?=
 =?utf-8?B?emF3Z2Z2bDZnR3RZcnc4RXMvSnhuUFpJZXhVZ09XdS9wdjF6YTF1WlhWTDBW?=
 =?utf-8?B?bTNUcmFLVnB2M3lLaERiRnUrQVcvSkJRUVB0VzU5TXNOL29uOHJ4TEpUYXVB?=
 =?utf-8?B?VEdXQ0k2UE9kUzhHc2ZKZ2VDdmliZXA5S1NrQTBDaGkrek9ldG9hVGVrNXl4?=
 =?utf-8?B?aXRYc1FyNlBIZGJwYUlRRXJRaU95eGErUXNVM3JyQVpYMTg5SjAzWWtTaXZz?=
 =?utf-8?B?UklDOCt5elJ0TW5WbkkvelBuMU90YVcvRDlmN296dVlRN1E2N2h0aloyWW9N?=
 =?utf-8?B?b3dHNXdzNlNDTDh6R3oyMjBsLzZhZlE2cG1sMERDNW0rWktsSVI0cEZORVZT?=
 =?utf-8?B?bDBOMml0RVN2c2NDc3FPNUg1ZkR3b29jd002RmhEYzNtTStaQmFvajJZWXpk?=
 =?utf-8?B?S1p3bVFPYmhWWE5BVFRneElVSWpya0RkWG1OclVzbUhnMDU0TlF1U1JZbjdy?=
 =?utf-8?B?SmVleHpaZW51Z1o1a21nUjZHYTI2V0xuSWJsT3d5eml0RWZUaTk2WXZEbVVH?=
 =?utf-8?B?YS9LUThMQnRieTFsUUpISFN3VzU4ZXRDa2tiZmhtbXp0TkNOSmdmWmJDQWhN?=
 =?utf-8?B?RkpLMmNUWm52ZmtMRzl6K0NxYXd5UnorcG1WMUYxMTFzVXRYd2RhZU9xMjFj?=
 =?utf-8?B?K0VlYjkwVjZwdTdUWjN0cklmcThtWFF0cUV4dnRFMU92TnJrcGNxUG9YcTJu?=
 =?utf-8?B?T0ZoWnR4RmlPTmY3Uno1UXV5NHUycUNqRHpsZUVyOHJjcm1oczVMdnpxeWwx?=
 =?utf-8?B?TmlNaitDVDc2aERUYVpJTnNIL3RGb1BUeHV6dllTQzBNNjdIYjJ3K1BTYmFw?=
 =?utf-8?B?bVFoN3JKbGcyTitaeldFdFk2bExLbzcwOWp1YVJhR1ROL3c2bHp0TVNKSnA3?=
 =?utf-8?B?OXVrZ05uNVpydDd3WWs5ZzBrY3VhREpneEdvdUpTblpPdGZXemdzY2pCZ2NY?=
 =?utf-8?B?dkJJOVJHbytYd0pDbUlodVd0OTZUTTlRa01vTjJnYjhxQjFKQW1ta1RWQlA1?=
 =?utf-8?B?bTV4cEUwVllWQVpuaG5MWGY2RHlyR2xYbGdvUFNVbW1kMElVU0xQRXYyUzk5?=
 =?utf-8?B?R0VCOWxLWjFBbmhwZDRnYWx4SzlFcDJzK3JpY09QZ3hFbUxZN2pzNDVCWVIx?=
 =?utf-8?B?VTJ4alZHL3A3RTEwTG45bXY2TlFvOFJRbi9hOXFvbzA1MHJSNjliUFdBRE5P?=
 =?utf-8?B?eWY2WnZmN0hTRy9wNzl1SXZ1OTdORzBRMzRzWDJBOTNiYjZPYTFkYWl0WVNN?=
 =?utf-8?B?dzdrc29KZmppaWthV0pydGJnMDhWMmExSGIyUWc0b2VIeE5LYmNEZ3ZyUURz?=
 =?utf-8?B?eHdlVXhNT2ZrVDBvaWQ4WVVnZ1ljUnl5UnQzaW1GeHBZVjBXbGtWdlhINTdn?=
 =?utf-8?B?UE80aWEyNUJ1QkhEalhUeU1RaE1keDBLWmRaMEtCektZOFRyUFBidUxoUWlJ?=
 =?utf-8?B?eDlCd2VlRFJsSlhlalltTzVPTzBWVjVUNkxIWlRydFo4bHJ6eTlvdktuS0VM?=
 =?utf-8?Q?6HUA/vdzT593IR3Wd0VkSXPBf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f4d37-75cc-4a96-6f02-08ddb583e381
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 14:07:02.2108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuzfdQLMJEZBCSFGMwXKl46NAOEZTcTU11ivqHuniw0QGuHCSW1baS93BglhN7MRV6LvMAtjxV2D2HxSSscbWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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


On 26-06-2025 09:20, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Wednesday, June 25, 2025 10:30 PM
>> To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; Usyskin, Alexander <alexander.usyskin@intel.com>;
>> gregkh@linuxfoundation.org; Ceraolo Spurio, Daniele
>> <daniele.ceraolospurio@intel.com>
>> Subject: [PATCH v4 02/10] mei: late_bind: add late binding component driver
>>
>> From: Alexander Usyskin <alexander.usyskin@intel.com>
>>
>> Add late binding component driver.
>> It allows pushing the late binding configuration from, for example, the Xe
>> graphics driver to the Intel discrete graphics card's CSE device.
>>
>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v2:
>>   - Use generic naming (Jani)
>>   - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
>> v3:
>>   - Updated kconfig description
>>   - Move CSC late binding specific flags/defines to late_bind_mei_interface.h
>> (Daniele)
>> v4:
>>   - Add match for PCI_CLASS_DISPLAY_OTHER to support headless cards
>> (Anshuman)
>> v5:
>>   - Add fixes in push_config (Sasha)
>>   - Use INTEL_ prefix for component, refine doc,
>>     add status enum to headerlate_bind_mei_interface.h (Anshuman)
>> ---
>>   drivers/misc/mei/Kconfig                    |   1 +
>>   drivers/misc/mei/Makefile                   |   1 +
>>   drivers/misc/mei/late_bind/Kconfig          |  13 +
>>   drivers/misc/mei/late_bind/Makefile         |   9 +
>>   drivers/misc/mei/late_bind/mei_late_bind.c  | 281 ++++++++++++++++++++
>>   include/drm/intel/i915_component.h          |   1 +
>>   include/drm/intel/late_bind_mei_interface.h |  64 +++++
>>   7 files changed, 370 insertions(+)
>>   create mode 100644 drivers/misc/mei/late_bind/Kconfig
>>   create mode 100644 drivers/misc/mei/late_bind/Makefile
>>   create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
>>   create mode 100644 include/drm/intel/late_bind_mei_interface.h
>>
>> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
>> 7575fee96cc6..771becc68095 100644
>> --- a/drivers/misc/mei/Kconfig
>> +++ b/drivers/misc/mei/Kconfig
>> @@ -84,5 +84,6 @@ config INTEL_MEI_VSC
>>   source "drivers/misc/mei/hdcp/Kconfig"
>>   source "drivers/misc/mei/pxp/Kconfig"
>>   source "drivers/misc/mei/gsc_proxy/Kconfig"
>> +source "drivers/misc/mei/late_bind/Kconfig"
>>
>>   endif
>> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
>> 6f9fdbf1a495..84bfde888d81 100644
>> --- a/drivers/misc/mei/Makefile
>> +++ b/drivers/misc/mei/Makefile
>> @@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
>>   obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
>>   obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
>>   obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
>> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) += late_bind/
>>
>>   obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o  mei-vsc-hw-y := vsc-
>> tp.o diff --git a/drivers/misc/mei/late_bind/Kconfig
>> b/drivers/misc/mei/late_bind/Kconfig
>> new file mode 100644
>> index 000000000000..65c7180c5678
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
>> +#
>> +config INTEL_MEI_LATE_BIND
>> +	tristate "Intel late binding support on ME Interface"
>> +	select INTEL_MEI_ME
>> +	depends on DRM_XE
>> +	help
>> +	  MEI Support for Late Binding for Intel graphics card.
>> +
>> +	  Enables the ME FW interfaces for Late Binding feature,
>> +	  allowing loading of firmware for the devices like Fan
>> +	  Controller during by Intel Xe driver.
>> diff --git a/drivers/misc/mei/late_bind/Makefile
>> b/drivers/misc/mei/late_bind/Makefile
>> new file mode 100644
>> index 000000000000..a0aeda5853f0
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Copyright (c) 2025, Intel Corporation. All rights reserved.
>> +#
>> +# Makefile - Late Binding client driver for Intel MEI Bus Driver.
>> +
>> +subdir-ccflags-y += -I$(srctree)/drivers/misc/mei/
>> +
>> +obj-$(CONFIG_INTEL_MEI_LATE_BIND) += mei_late_bind.o
>> diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c
>> b/drivers/misc/mei/late_bind/mei_late_bind.c
>> new file mode 100644
>> index 000000000000..ffb89ccdfbb1
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
>> @@ -0,0 +1,281 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2025 Intel Corporation  */ #include
>> +<drm/intel/i915_component.h> #include
>> +<drm/intel/late_bind_mei_interface.h>
>> +#include <linux/component.h>
>> +#include <linux/pci.h>
>> +#include <linux/mei_cl_bus.h>
>> +#include <linux/module.h>
>> +#include <linux/overflow.h>
>> +#include <linux/slab.h>
>> +#include <linux/uuid.h>
>> +
>> +#include "mkhi.h"
>> +
>> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12 #define
>> +GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD
>> | 0x80)
>> +
>> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000 #define
>> +LATE_BIND_RECV_TIMEOUT_MSEC 3000
>> +
>> +/**
>> + * struct csc_heci_late_bind_req - late binding request
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @flags: flags to be passed to the firmware
>> + * @reserved: reserved field
>> + * @payload_size: size of the payload data in bytes
>> + * @payload: data to be sent to the firmware  */ struct
>> +csc_heci_late_bind_req {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 flags;
>> +	u32 reserved[2];
>> +	u32 payload_size;
>> +	u8  payload[] __counted_by(payload_size); } __packed;
>> +
>> +/**
>> + * struct csc_heci_late_bind_rsp - late binding response
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @reserved: reserved field
>> + * @status: status of the late binding command execution by firmware
>> +*/ struct csc_heci_late_bind_rsp {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 reserved[2];
>> +	u32 status;
>> +} __packed;
>> +
>> +static int mei_late_bind_check_response(const struct device *dev, const
>> +struct mkhi_msg_hdr *hdr) {
>> +	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
>> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
>> +			hdr->group_id, MKHI_GROUP_ID_GFX);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (hdr->command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
>> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
>> +			hdr->command,
>> GFX_SRV_MKHI_LATE_BINDING_RSP);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (hdr->result) {
>> +		dev_err(dev, "Error in result: 0x%x\n", hdr->result);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * mei_late_bind_push_config - Sends a config to the firmware.
>> + * @dev: device struct corresponding to the mei device
>> + * @type: payload type
>> + * @flags: payload flags
>> + * @payload: payload buffer
>> + * @payload_size: payload buffer size
>> + *
>> + * Return: 0 success, negative errno value on transport failure,
>> + *         positive status returned by FW
>> + */
>> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
>> +				     const void *payload, size_t payload_size) {
>> +	struct mei_cl_device *cldev;
>> +	struct csc_heci_late_bind_req *req = NULL;
>> +	struct csc_heci_late_bind_rsp rsp;
>> +	size_t req_size;
>> +	ssize_t ret;
>> +
>> +	if (!dev || !payload || !payload_size)
>> +		return -EINVAL;
>> +
>> +	cldev = to_mei_cl_device(dev);
>> +
>> +	ret = mei_cldev_enable(cldev);
>> +	if (ret < 0) {
>> +		dev_dbg(dev, "mei_cldev_enable failed. %zd\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	req_size = struct_size(req, payload, payload_size);
>> +	if (req_size > mei_cldev_mtu(cldev)) {
>> +		dev_err(dev, "Payload is too big %zu\n", payload_size);
>> +		ret = -EMSGSIZE;
>> +		goto end;
>> +	}
>> +
>> +	req = kmalloc(req_size, GFP_KERNEL);
>> +	if (!req) {
>> +		ret = -ENOMEM;
>> +		goto end;
>> +	}
>> +
>> +	req->header.group_id = MKHI_GROUP_ID_GFX;
>> +	req->header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
>> +	req->type = type;
>> +	req->flags = flags;
>> +	req->reserved[0] = 0;
>> +	req->reserved[1] = 0;
>> +	req->payload_size = payload_size;
>> +	memcpy(req->payload, payload, payload_size);
>> +
>> +	ret = mei_cldev_send_timeout(cldev, (void *)req, req_size,
>> LATE_BIND_SEND_TIMEOUT_MSEC);
>> +	if (ret < 0) {
>> +		dev_err(dev, "mei_cldev_send failed. %zd\n", ret);
>> +		goto end;
>> +	}
>> +
>> +	ret = mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp),
>> LATE_BIND_RECV_TIMEOUT_MSEC);
>> +	if (ret < 0) {
>> +		dev_err(dev, "mei_cldev_recv failed. %zd\n", ret);
>> +		goto end;
>> +	}
>> +	if (ret < sizeof(rsp.header)) {
>> +		dev_err(dev, "bad response header from the firmware: size
>> %zd < %zu\n",
>> +			ret, sizeof(rsp.header));
>> +		goto end;
>> +	}
>> +	if (ret < sizeof(rsp)) {
>> +		dev_err(dev, "bad response from the firmware: size %zd <
>> %zu\n",
>> +			ret, sizeof(rsp));
>> +		goto end;
>> +	}
>> +
>> +	ret = mei_late_bind_check_response(dev, &rsp.header);
>> +	if (ret) {
>> +		dev_err(dev, "bad result response from the firmware:
>> 0x%x\n",
>> +			*(uint32_t *)&rsp.header);
>> +		goto end;
>> +	}
>> +
>> +	ret = (int)rsp.status;
>> +	dev_dbg(dev, "%s status = %zd\n", __func__, ret);
>> +
>> +end:
>> +	mei_cldev_disable(cldev);
>> +	kfree(req);
>> +	return ret;
>> +}
>> +
>> +static const struct late_bind_component_ops mei_late_bind_ops = {
>> +	.owner = THIS_MODULE,
>> +	.push_config = mei_late_bind_push_config, };
>> +
>> +static int mei_component_master_bind(struct device *dev) {
>> +	return component_bind_all(dev, (void *)&mei_late_bind_ops); }
>> +
>> +static void mei_component_master_unbind(struct device *dev) {
>> +	component_unbind_all(dev, (void *)&mei_late_bind_ops); }
>> +
>> +static const struct component_master_ops mei_component_master_ops = {
>> +	.bind = mei_component_master_bind,
>> +	.unbind = mei_component_master_unbind, };
>> +
>> +/**
>> + * mei_late_bind_component_match - compare function for matching mei
>> late bind.
>> + *
>> + *    The function checks if requester is Intel PCI_CLASS_DISPLAY_VGA or
>> + *    PCI_CLASS_DISPLAY_OTHER device, and checks if the parent of requester
> DOC is still wrong dev is requester here, you are checking base == dev.
> With fixing of that.
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

It should be requester is grand parent of late_bind mei device.

Thanks,
Badal

>
> Thanks,
> Anshuman
>> + *    and the grand parent of mei_if are the same device
>> + *
>> + * @dev: master device
>> + * @subcomponent: subcomponent to match
>> (INTEL_COMPONENT_LATE_BIND)
>> + * @data: compare data (late_bind mei device on mei bus)
>> + *
>> + * Return:
>> + * * 1 - if components match
>> + * * 0 - otherwise
>> + */
>> +static int mei_late_bind_component_match(struct device *dev, int
>> subcomponent,
>> +					 void *data)
>> +{
>> +	struct device *base = data;
>> +	struct pci_dev *pdev;
>> +
>> +	if (!dev)
>> +		return 0;
>> +
>> +	if (!dev_is_pci(dev))
>> +		return 0;
>> +
>> +	pdev = to_pci_dev(dev);
>> +
>> +	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
>> +		return 0;
>> +
>> +	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
>> +	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
>> +		return 0;
>> +
>> +	if (subcomponent != INTEL_COMPONENT_LATE_BIND)
>> +		return 0;
>> +
>> +	base = base->parent;
>> +	if (!base) /* mei device */
>> +		return 0;
>> +
>> +	base = base->parent; /* pci device */
>> +
>> +	return !!base && dev == base;
>> +}
>> +
>> +static int mei_late_bind_probe(struct mei_cl_device *cldev,
>> +			       const struct mei_cl_device_id *id) {
>> +	struct component_match *master_match = NULL;
>> +	int ret;
>> +
>> +	component_match_add_typed(&cldev->dev, &master_match,
>> +				  mei_late_bind_component_match, &cldev-
>>> dev);
>> +	if (IS_ERR_OR_NULL(master_match))
>> +		return -ENOMEM;
>> +
>> +	ret = component_master_add_with_match(&cldev->dev,
>> +					      &mei_component_master_ops,
>> +					      master_match);
>> +	if (ret < 0)
>> +		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static void mei_late_bind_remove(struct mei_cl_device *cldev) {
>> +	component_master_del(&cldev->dev,
>> &mei_component_master_ops); }
>> +
>> +#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
>> +			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
>> +
>> +static struct mei_cl_device_id mei_late_bind_tbl[] = {
>> +	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
>> +
>> +static struct mei_cl_driver mei_late_bind_driver = {
>> +	.id_table = mei_late_bind_tbl,
>> +	.name = KBUILD_MODNAME,
>> +	.probe = mei_late_bind_probe,
>> +	.remove	= mei_late_bind_remove,
>> +};
>> +
>> +module_mei_cl_driver(mei_late_bind_driver);
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("MEI Late Binding");
>> diff --git a/include/drm/intel/i915_component.h
>> b/include/drm/intel/i915_component.h
>> index 4ea3b17aa143..456849a97d75 100644
>> --- a/include/drm/intel/i915_component.h
>> +++ b/include/drm/intel/i915_component.h
>> @@ -31,6 +31,7 @@ enum i915_component_type {
>>   	I915_COMPONENT_HDCP,
>>   	I915_COMPONENT_PXP,
>>   	I915_COMPONENT_GSC_PROXY,
>> +	INTEL_COMPONENT_LATE_BIND,
>>   };
>>
>>   /* MAX_PORT is the number of port
>> diff --git a/include/drm/intel/late_bind_mei_interface.h
>> b/include/drm/intel/late_bind_mei_interface.h
>> new file mode 100644
>> index 000000000000..ec58ef1ab4e8
>> --- /dev/null
>> +++ b/include/drm/intel/late_bind_mei_interface.h
>> @@ -0,0 +1,64 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (c) 2025 Intel Corporation  */
>> +
>> +#ifndef _LATE_BIND_MEI_INTERFACE_H_
>> +#define _LATE_BIND_MEI_INTERFACE_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct device;
>> +struct module;
>> +
>> +/**
>> + * Late Binding flags
>> + * Persistent across warm reset
>> + */
>> +#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
>> +
>> +/**
>> + * xe_late_bind_fw_type - enum to determine late binding fw type  */
>> +enum late_bind_type {
>> +	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1, };
>> +
>> +/**
>> + * Late Binding payload status
>> + */
>> +enum csc_late_binding_status {
>> +	CSC_LATE_BINDING_STATUS_SUCCESS           = 0,
>> +	CSC_LATE_BINDING_STATUS_4ID_MISMATCH      = 1,
>> +	CSC_LATE_BINDING_STATUS_ARB_FAILURE       = 2,
>> +	CSC_LATE_BINDING_STATUS_GENERAL_ERROR     = 3,
>> +	CSC_LATE_BINDING_STATUS_INVALID_PARAMS    = 4,
>> +	CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE = 5,
>> +	CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD   = 6,
>> +	CSC_LATE_BINDING_STATUS_TIMEOUT           = 7,
>> +};
>> +
>> +/**
>> + * struct late_bind_component_ops - ops for Late Binding services.
>> + * @owner: Module providing the ops
>> + * @push_config: Sends a config to FW.
>> + */
>> +struct late_bind_component_ops {
>> +	struct module *owner;
>> +
>> +	/**
>> +	 * @push_config: Sends a config to FW.
>> +	 * @dev: device struct corresponding to the mei device
>> +	 * @type: payload type
>> +	 * @flags: payload flags
>> +	 * @payload: payload buffer
>> +	 * @payload_size: payload buffer size
>> +	 *
>> +	 * Return: 0 success, negative errno value on transport failure,
>> +	 *         positive status returned by FW
>> +	 */
>> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
>> +			   const void *payload, size_t payload_size); };
>> +
>> +#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
>> --
>> 2.34.1
