Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FCFAEA8E3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 23:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC3E10E918;
	Thu, 26 Jun 2025 21:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYpJDVAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88E110E917;
 Thu, 26 Jun 2025 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750973545; x=1782509545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bd8gABKnlaqG7t8JXb/471UjQ+A3ICk7/N1W0FXdptk=;
 b=NYpJDVATwZEh0bGq5fnYsBzO+XkLa2bqFAyHfE/6DvT5FjF5rsMBRGaQ
 LewGnShrTUo7roAlIEzWaMe6h4KcX7q4b/9DoHWtcak7f6r0eDeMjTKYn
 zxurQfAUrlIWr6mK0nCYbKSxCVfdbmPax+K7rt/9LUR7HMS3VwA3EXYM1
 KvbzSgT1p7eM4N3Ze3zOm5hZGhUMfNlnOiF2zEl0Xat6LRZIe9J3UM0Nn
 Qm0IeiAxGhdURgUcO8tNmmrMT8yfgAozLf2uz5GAppbTTCC2QTR9s02PB
 jvxA09t1BXNJQhsEpnH9L+akJ+2a7kp47icm1qgDyhwflKlIZpfkNPJLo Q==;
X-CSE-ConnectionGUID: KOdjqhJ6T7yD9P0zZEikmg==
X-CSE-MsgGUID: dUM3k8O8TA2DZtfZIFBt6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53008407"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53008407"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:32:25 -0700
X-CSE-ConnectionGUID: PJSHawUTTIK/a0NwMAyvzA==
X-CSE-MsgGUID: G6zSxCcHTHax3REi0z29Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153149873"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:32:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:32:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 14:32:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT5dxXgIhhqehnqi1Ju+9b5V8OaRZ8etZEZTsNcAdzmnfF59ZTrwQzNriXDTN4Qu8YCAPcjvFLvDuyGPZbL/igSu0SdckUY8D4LorGIytnqFGhsR/tPl00vIviKr2Ai+YCVMUmNjAqP2DrTjTWV7jAE+8zwCz4GFZP4l4K+rdVnua3N9B4p9iClOv//N5ha1ylyn3LaOyoEGeRvHWm/KrOHItyBRi31TnglTsxyTqXoC+4GzqMjNftTPjLQJvx8FX4DtYKEbYqWTpQOyqrNjG7JeXV35EwN/E4s2nMUiQOfrES66Zf2//pMg+odkJqq1TRIhotgyQOYGXxe3NRYr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHvXiD4gpLJ3fXHSHxh/BEsxTLiQlt+ZtYAi/CLO7Uk=;
 b=yWwer9qRcgG2Iz6qM+n6fkAor2awL9lthBZuX4Aiq7eT+PHArI5ea6a0OUJ6ViNxzjiObNt0VvNBSa4yAjU1NF3PlNMfAWVxFAyqgYZM7SgfsCdtnna33gObonCSxFupzZvGP1FtyaIhFEbquNKEy60Q1Tzf7piIKg61ofyKUwY10PtQ3KbNxetxCTf9xeCYGjVpVlgcvonoN7OWRb7rQ7o+CMKURfhINH/279QWS1SEA9xer3SnJz+TtFDIwNBjD/REVNLo76bOPu8u0LpwaA7XWEv8ouhBANS+X0cNss08nwz7/8cVfhChGxvfC9fOVIC0DS3gB7l61Nk8xX/gBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ5PPF06F7EC6B5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::807) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 21:32:20 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 21:32:20 +0000
Message-ID: <86e06365-8fb9-4b39-a3a8-e250803fd76a@intel.com>
Date: Thu, 26 Jun 2025 14:32:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] drm/xe/xe_late_bind_fw: Extract and print
 version info
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-10-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250625170015.33912-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ5PPF06F7EC6B5:EE_
X-MS-Office365-Filtering-Correlation-Id: 592b9b69-fac5-499e-7fc2-08ddb4f8ee68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDZpaC9aYVZKYlp0NTBVU3RLOGxsMTlhaUpoRTNyOE1oQVhtSXRkWklEaXRh?=
 =?utf-8?B?bG03QjB0WVNITzFMNHZFMk5iS04zRWZFZm9zMEJsSy91NW9aUWhlekE4YURB?=
 =?utf-8?B?N1JMZjJVVENqZkt1YVRxNmFZUzNobzFLUEk5TGh1VGZoTUVGYVFDU0h4dmIx?=
 =?utf-8?B?d2VGVCs2NEpXZDdqZlBTS21lWXo0cDFRT3lPVDUwQUJXMzRNU2ZEcEpGbjQz?=
 =?utf-8?B?MkFSV3cyTzJLMC9IMVdHNWxWaE9CS2x3aFZQV3ZLcVFtdEpKVUtGZ2daRzN1?=
 =?utf-8?B?VEZrY3hncnNVWGdUdzNZN3kxV0Era3dUYzM2bzhFYXFOd3dRaHlBVmtISHRG?=
 =?utf-8?B?eUY1cEYzVDQ3WUJ6d0VnakFOWEI4UmMwN1VYWCtYc20xVWk3QzJYZDUvOHRX?=
 =?utf-8?B?WVJzUzJmVHRTaVYwMWxEUE9ibnJwSDczVzZ6Z3VUQVhNVytNZnNWNjNyeGI0?=
 =?utf-8?B?RnEvUm5vTnJUUkNqNktlUkhLYVh3OFVpdUdXdGRpWjZEOUlpb3lNNytKbk4v?=
 =?utf-8?B?MGh5WUgzQ2Q5b0ZMemJzK3A0ZFpBY2E0bFU2VHEyU2crVjV4NjhhWVdPVmo0?=
 =?utf-8?B?VG1wYi9IcTlGRW5sSS9tbG5HUkJ6ejF4UFc1aWU3amxicUpSd1VpbzY4L0N4?=
 =?utf-8?B?T0RDZ2RTZWFidkhobWVYSnplczdUbTZMR2t5SW9yWFc5QnZzUDJZQmlZOGl1?=
 =?utf-8?B?UndjM1Z6WkgxZm8vSEpyeGtCamU1WVFzdG9IU3p2ekowL1VOYzJ3N0t0WlBJ?=
 =?utf-8?B?VWNvQlVNaTN3UU9iNkMrY01TTTBERmtFc3QwREV3S0VraHdVSTRmNi9rdkdX?=
 =?utf-8?B?TUcxd1J0VkVGME1OZjRRdUxqYTdHM1pGQlBBa3dvVXFhbUhzMWNTQ0I1dFBW?=
 =?utf-8?B?Mkpzc1ZFZUFlbEw3ZlJPcyt4ejRKL2xGTnJWWEQ2ZEVkaWRFNDdwZVFpd3Rv?=
 =?utf-8?B?RUk4c05jQU9RUXlvL0xBek5yaHo5bWY3emdPK2xxMFZDUW5VVUJ1SmZMR2xz?=
 =?utf-8?B?b2VoM09HSExwYjgyMnlNZDBYSDRlTnVaaEhheHJsZWd4YkJwM3d0UmdUcCsr?=
 =?utf-8?B?YkIxQ2VmbFUzb3dHSkdCOFdramxKZzdHR1VwYUkzZEpyTVM2SmdjK0hKSlhW?=
 =?utf-8?B?RGVhSzN0S3BKMW5WdnBEZWlidkE4cnhvYWFNTUgzMjFMVjd5bHhJQ3JNdmx2?=
 =?utf-8?B?cnd0VUZwWVNTOFRHbXM5UHRoOGdXbEdySjVKU2xwRUhoRnY2WGNwbWMva3NZ?=
 =?utf-8?B?WFJjam1yQVhpZEg2ODIzR0hlZU9ZN3lyYW53bEJMUnl1ajRMdWRob0haT05J?=
 =?utf-8?B?ZFl5MlZNSUkvM3l0VmRoTGhuTGNjZzNYS1FzNE5hQTBacW9nVmg4N3o1UFdB?=
 =?utf-8?B?NFgvRjNrQUVxNjVLSWdrbzJxeGpGTHQwR0VzZHNodDE3emhYL1p2Yk9SNmpK?=
 =?utf-8?B?dlJYK3VpRFk1ZlMwd3g2L2VqU05zNmlEQ05nY3o1QVFseHlSTGNXNUtFMHVE?=
 =?utf-8?B?ME1RekF6aGZCNTdsQVN1YkVtanBHVk5mMjQxOFREWERDOENPT1NsSW1ReFhY?=
 =?utf-8?B?dUxTUktXclhNTFJWOU9Vc0FoQTZ1MnpEWWozcC9NY3dMVExiZjZKTjNMWTRp?=
 =?utf-8?B?QnNNeWVMMzh5ZEF0YjBuak9aZWVtRC8vL1ZvWW8xK21SVENhdHBEeHNjNmJJ?=
 =?utf-8?B?NW5ab3dCcjhjdEpUVGYwblRpOFJKbTdlSHA1TlFyUXoxdldaWkx1NDlBdG90?=
 =?utf-8?B?VWhIVm9leEhIb2Jvd3FMTTl5Y1A0aTlOT1htRjBIM05SU3gvOXg3ZEpDN3hh?=
 =?utf-8?B?Z3lFdmN6Y2k1R0FJSEhQQ21UallDcFZKYjRqb3ZyZTZTdHNHdW5hODNEdDd3?=
 =?utf-8?B?b0c3aFJiTDFZVHQzREdDTUIzOG0wMnZGeHNYZGt2N3VSeEV5ZFM3RFBEaW1a?=
 =?utf-8?Q?uqC0P1Ze4ss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEw4NlhPYzl4RVdYOTMxT3JVZTIyUHFZMjRrWWRIblZkQ3hKb2pnZjFPZWlB?=
 =?utf-8?B?RVNaRUFYYk1LRC8rakp1TTZhREFFNXk5TFhXdDB3RW44NmlOcWVEWWJuSVJR?=
 =?utf-8?B?Ykg2emdMbHErbThGL1pjUVNFMmlBV1ZjcURWZ1g2SmdXUTJmSHhyOTQrZ1VQ?=
 =?utf-8?B?clJ3WnU4VVN2ZGw4cm9sc1l2bFRnTkJBeGpOVElVYUh0ZTM1dVVFYmJqRHRT?=
 =?utf-8?B?bE9uS0hacXNIeTN0Snp5N0FtcStHaFphN1JrQlV5NWpzM2p0R2Z4UGJHNHJq?=
 =?utf-8?B?NWhQNUlHbjdvQjZrRE5kQ2ZnVjBVMkxkWHBGYVEwRmhWbm4yYVdPV3lIelpE?=
 =?utf-8?B?cUhRNi9udUQ0aDZPeHQ3aitvZ2NKS2ZLTit3OTFUN3RDbis0RVJ5MnVuODFx?=
 =?utf-8?B?VHdvR0RuUnA2ZWxtQW9jd0JubmZHbFZ3UFAzbWRJTHF0bXJDODk0NkQzOFp3?=
 =?utf-8?B?NmU0UGNSMUxOWDM1UUVaYjFiemgydUp5aUlDdVllNHM1VGZGcVcrV3kyQlky?=
 =?utf-8?B?eGNCaTFDNjVxY2UzamtRZDJ3bmFVcFVsRmRsUzlPK1NjektTWUxiUll6Si9P?=
 =?utf-8?B?OE8xVVFlWTRWb3Jhc1FKNEJUalZJNzJKRi8xMWlGTHE5WjFXSnRYbnFpS0o5?=
 =?utf-8?B?czZFQThQWXd2bkQ2citxY1VGaU1nOG1TbkZ3bWhRMmRXSnM2ZEJiT2Q2cFZu?=
 =?utf-8?B?YkFDRElVTHA3a2krWE1wUGRUczJBcjNqdXJqdmlmRjlOVHFTVmcrVWMwbTZn?=
 =?utf-8?B?SXI5UkxKenVFcUpPQUNIa3JndGJWbWJpMitEVUNzWWk0RUhKUXlEam9xdGti?=
 =?utf-8?B?SSs2aGk0L1QzNkMvWFBjb2ZIbzRkS21sTlFOTTBPUDMyeTVlbUFaVEs3bzBE?=
 =?utf-8?B?NEdQTmhBblNFYVRnQllGbENpcy9zNXV5eUgxUERkdEZBc011RGJTY29mRkV6?=
 =?utf-8?B?YytrSk9Fa3ZsUmhVVEtrRTJuSEJUenZNL1dNcWp1WlV1Y2lsa0ZKNTVDVERv?=
 =?utf-8?B?NVpHVS9UU2EzdWU1YTVocTBxbGhrdG1ndFJZN1h4cHNPVnBZRFV0NWtCVXBm?=
 =?utf-8?B?eGN1R2c5Vk1VN0RIcWs2RkhvYVlTNFU3ayswcEhRa3JNejdEWnRHZjVwVkZO?=
 =?utf-8?B?d3h6ZDdHRlBIZG4xeWIyMEJZdWcxRDZtWW45QjBUMTR3a3BOTEJjUmJrU205?=
 =?utf-8?B?UllZZFZaaTlmcFY1ZzI0ZFV1NXBxQmFVOUkzeWtRUGtTRHFVVmRPNlVoSUo0?=
 =?utf-8?B?aDJYaFFMcVpHTzRkWEhwVjNqSnB5dGN2cExhVTkxdXNOWHJWVFFLSGZpSlRB?=
 =?utf-8?B?UWxaSEVnSURuOVhhTlNqdS9aMnNGcFNGeVpYVzdZL1grSlFHSVN6eFc0OTZ5?=
 =?utf-8?B?U3FrV0R1SW5zbzVDUnVId05pd1hwTWV3RlJOcEd6U2VPY3c4WSszZ3AxK1d3?=
 =?utf-8?B?QmhLTlBleDBvOHE4NHc3OTVHUVViUzJQNXV3Y1g1YmpiM2dTaVhOT2NFMEsv?=
 =?utf-8?B?b0trdXNabzBtbVBxMXRBRmsyM2kwMzRHM1Z4ZXZaMUZoSWVhcENxUWVvL0dj?=
 =?utf-8?B?M1N4RnJ6NVFCZFpEQUtPR2tlTE9HdVlscmhSQVFodmNhWVZUdFFWdk94YUo2?=
 =?utf-8?B?ME9XdVE5YmJhMWsvYUU3cnp5Zkk3aWsweEdwV1VLSjVjL1pOVUgzWHNNeFhz?=
 =?utf-8?B?R3B1MFZzc0Nwd2FyK3JWSUxiV28yZXdicENHMjFIdHJVS2ZjTGVTVG5aUGZM?=
 =?utf-8?B?SFRWd3dGRXd6SXk5cGtucHZqZzhqS1ErM0UzNTBGRTA0RnNjZW9TbjNKTG9M?=
 =?utf-8?B?Njd4eSt5N2REOVBibHJwcWRUb3dNNmNvUHUrVmNMU05ZcVN6MWRTMnFLeUNO?=
 =?utf-8?B?ZjY0MFFRbEVmaW5BcldWSnFMNG5aMFlMNVo1bVA1aCtWNy9iVjhXeHlUekdm?=
 =?utf-8?B?ak5nVU95RXVEdFVZcTdWbHZvMnIzc011ZE9teWU3Ri9adnVucU0wOVJnMEky?=
 =?utf-8?B?M2JRN3p2UC9Kd1o0NmpZR0dwdXF1eGY3QzlPeTRBZy9EUlRsTHV6REViVU9i?=
 =?utf-8?B?VWdTeGtQb3BGaDRDS2ViUnkzdjBST3FKY0tidXJBL1ZXM0V5aHd1RVF3cFJE?=
 =?utf-8?B?dEpaZHBlUVg0VzBDRy9jMFJlWE5GYnA3RFovaU9WQ1daM21hY29xT2tROXQ0?=
 =?utf-8?Q?D89WqXGrlGxAC9zEBT5M1ko=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592b9b69-fac5-499e-7fc2-08ddb4f8ee68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:32:20.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAXgQwDMHm5At8SvkBoen3RRQtjgVN/vWnmdJrLCfGDMBUwv47pcTKAjR5DFlbuPFBGLxJyzc2QDEheUp93GpasSbanLMCrVTWe80Wr8mlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF06F7EC6B5
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



On 6/25/2025 10:00 AM, Badal Nilawar wrote:
> Extract and print version info of the late binding binary.
>
> v2: Some refinements (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 124 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
>   drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  66 +++++++++++
>   3 files changed, 193 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 777f66692d7f..253908794d4a 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -45,6 +45,121 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>   	return container_of(late_bind, struct xe_device, late_bind);
>   }
>   
> +static struct xe_device *
> +late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
> +{
> +	return container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id]);
> +}
> +
> +/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
> +static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
> +			    const void *data, size_t size, const char *manifest_entry)
> +{
> +	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
> +	const struct gsc_cpd_header_v2 *header = data;
> +	const struct gsc_manifest_header *manifest;
> +	const struct gsc_cpd_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	u32 offset;
> +	int i;
> +
> +	/* manifest_entry is mandatory */
> +	xe_assert(xe, manifest_entry);
> +
> +	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
> +		return -ENOENT;
> +
> +	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
> +		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
> +			fw_id_to_name[lb_fw->id], header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/* Look for the manifest first */
> +	entry = (void *)header + header->header_length;
> +	for (i = 0; i < header->num_of_entries; i++, entry++)
> +		if (strcmp(entry->name, manifest_entry) == 0)
> +			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
> +
> +	if (!offset) {
> +		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
> +			fw_id_to_name[lb_fw->id]);
> +		return -ENODATA;
> +	}
> +
> +	min_size = offset + sizeof(struct gsc_manifest_header);
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	manifest = data + offset;
> +
> +	lb_fw->version = manifest->fw_version;
> +
> +	return 0;
> +}
> +
> +/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
> +static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
> +			   const void *data, size_t size, const char *fpt_entry)
> +{
> +	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
> +	const struct csc_fpt_header *header = data;
> +	const struct csc_fpt_entry *entry;
> +	size_t min_size = sizeof(*header);
> +	u32 offset;
> +	int i;
> +
> +	/* fpt_entry is mandatory */
> +	xe_assert(xe, fpt_entry);
> +
> +	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
> +		return -ENOENT;
> +
> +	if (header->header_length < sizeof(struct csc_fpt_header)) {
> +		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
> +			fw_id_to_name[lb_fw->id], header->header_length);
> +		return -EINVAL;
> +	}
> +
> +	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	/* Look for the cpd header first */
> +	entry = (void *)header + header->header_length;
> +	for (i = 0; i < header->num_of_entries; i++, entry++)
> +		if (strcmp(entry->name, fpt_entry) == 0)
> +			offset = entry->offset;
> +
> +	if (!offset) {
> +		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
> +			fw_id_to_name[lb_fw->id]);
> +		return -ENODATA;
> +	}
> +
> +	min_size = offset + sizeof(struct gsc_cpd_header_v2);
> +	if (size < min_size) {
> +		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
> +			fw_id_to_name[lb_fw->id], size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	return parse_cpd_header(lb_fw, data + offset, size - offset, "LTES.man");
> +}
> +
>   static const char *xe_late_bind_parse_status(uint32_t status)
>   {
>   	switch (status) {
> @@ -217,6 +332,10 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		return -ENODATA;
>   	}
>   
> +	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
> +	if (ret)
> +		return ret;
> +
>   	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
>   	if (!lb_fw->payload) {
>   		release_firmware(fw);
> @@ -225,6 +344,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   
>   	lb_fw->payload_size = fw->size;
>   
> +	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
> +		 fw_id_to_name[lb_fw->id], lb_fw->blob_path,
> +		 lb_fw->version.major, lb_fw->version.minor,
> +		 lb_fw->version.hotfix, lb_fw->version.build);
> +
>   	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>   	release_firmware(fw);
>   	INIT_WORK(&lb_fw->work, xe_late_bind_work);
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 16f2bd6bbdf1..7f98a1380844 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -10,6 +10,7 @@
>   #include <linux/mutex.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
> +#include "xe_uc_fw_abi.h"
>   
>   #define MAX_PAYLOAD_SIZE SZ_4K
>   
> @@ -41,6 +42,8 @@ struct xe_late_bind_fw {
>   	size_t payload_size;
>   	/** @late_bind_fw.work: worker to upload latebind blob */
>   	struct work_struct work;
> +	/** @late_bind_fw.version: late binding blob manifest version */
> +	struct gsc_version version;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> index 87ade41209d0..78782d105fa9 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> @@ -318,4 +318,70 @@ struct gsc_manifest_header {
>   	u32 exponent_size; /* in dwords */
>   } __packed;
>   
> +/**
> + * DOC: Late binding Firmware Layout
> + *
> + * The Late binding binary starts with FPT header, which contains locations
> + * of various partitions of the binary. Here we're interested in finding out
> + * manifest version. To the manifest version, we need to locate CPD header
> + * one of the entry in CPD header points to manifest header. Manifest header
> + * contains the version.
> + *
> + *      +================================================+
> + *      |  FPT Header                                    |
> + *      +================================================+
> + *      |  FPT entries[]                                 |
> + *      |      entry1                                    |
> + *      |      ...                                       |
> + *      |      entryX                                    |
> + *      |          "LTES"                                |
> + *      |          ...                                   |
> + *      |          offset  >-----------------------------|------o
> + *      +================================================+      |
> + *                                                              |
> + *      +================================================+      |
> + *      |  CPD Header                                    |<-----o
> + *      +================================================+
> + *      |  CPD entries[]                                 |
> + *      |      entry1                                    |
> + *      |      ...                                       |
> + *      |      entryX                                    |
> + *      |          "LTES.man"                            |
> + *      |           ...                                  |
> + *      |           offset  >----------------------------|------o
> + *      +================================================+      |
> + *                                                              |
> + *      +================================================+      |
> + *      |  Manifest Header                               |<-----o
> + *      |      ...                                       |
> + *      |      FW version                                |
> + *      |      ...                                       |
> + *      +================================================+
> + */
> +
> +/* FPT Headers */
> +struct csc_fpt_header {
> +	u32 header_marker;
> +#define CSC_FPT_HEADER_MARKER 0x54504624
> +	u32 num_of_entries;
> +	u8 header_version;
> +	u8 entry_version;
> +	u8 header_length; /* in bytes */
> +	u8 flags;
> +	u16 ticks_to_add;
> +	u16 tokens_to_add;
> +	u32 uma_size;
> +	u32 crc32;
> +	struct gsc_version fitc_version;
> +} __packed;
> +
> +struct csc_fpt_entry {
> +	u8 name[4]; /* partition name */
> +	u32 reserved1;
> +	u32 offset; /* offset from beginning of CSE region */
> +	u32 length; /* partition length in bytes */
> +	u32 reserved2[3];
> +	u32 partition_flags;
> +} __packed;
> +
>   #endif

