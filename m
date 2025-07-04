Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB8EAF9057
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D14110E9E9;
	Fri,  4 Jul 2025 10:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlAQvWCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C5910E9E7;
 Fri,  4 Jul 2025 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751624996; x=1783160996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VBfIz25O3AC5xqeRruKdpZS4uZ8y2DSN3aHGrzudRxE=;
 b=WlAQvWCnMcWAddbTFT6af+saMzDsGfkAUPlxlhMRL/l5pIN3sx03i1E8
 S86Up5Gh7oybAj1/3tWPcu+h+aiUMbYOCp4L6q0Rd2cz57MJJ9dFyXlGd
 629V3FC5NV6JvjMDYyvkj+mCVchc17NcC6njNG2DwYHzvUCzbEyB9BL2h
 LpRbDDKTQZ7gU85fths9Ptcxrf20C8DzB2O3HgQzL6RnvIiL+VRpRsRH7
 i+6M8Ibrdslvp4rIboOvgCxQjukd+YXf9+m3SOG1C8r9ZUY3piX7/A4zU
 58H0w69WT2h8eZ9A8Ll4uqfczttd3z11ZnSVtm20MM/l6+dnEg6zHefI1 A==;
X-CSE-ConnectionGUID: m5SUlnYAQY2kCoKi9CfGkg==
X-CSE-MsgGUID: XJdZtZubRs+zfijbZllafQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56585085"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="56585085"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:29:55 -0700
X-CSE-ConnectionGUID: EAuIHCkvRH2vG4kLcSU8tw==
X-CSE-MsgGUID: OAB0BgGvTrWU0/m7ofGpjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="155375455"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:29:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:29:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 03:29:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.60)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3EcXzzSIA+YZ1+t2iflXl4e63qRTgDvBZZvtikOoKCkVlBKlY1zov4OKoVP3gdii399v+4GTRGF9o8hPB2dwEjeUvkDv+7DsM0cqj0y1a8cQKnYxqjypGbPgZo/PFXhYqKJaWuWwVAeK0R7qp28tdRRnNIPLX5oDPi30tLQiQtQenCEKgP/Cb0hKbScRjhNv97LL0kJTfN1iA2LoQ2rvGkOTqGGt1RcxknbCcRqesqWSVaWvBX3VeWGOn3etrrx8HWXhHa30lmAbyKn93M+x5wtbii2da9U9OPltbjXbyWQIEy1B/ffSuM+TQqro8T4Q/pgpJJMqdbubgTPVwe7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QldoDHrjvLJUCoZ2I97X9pKUr2dHQIKU7hsG1sfyuA=;
 b=c5KRxu1aYd32adq7SbYh2qpz7QFlg0ALlMKEt9By6fIqAlJ3Ll2lTtHRBntf/nmnDFFVNCWJdINqCIkRlz0dXyxNizZKnuE4un9HvQEEqcnsq8L5oaVFC3ljg3/xwvQDsDeut6HEqAZR6o0yND/VF/iHay0NsFnZ1YFyQKu1QeyA6N8CoNt+qDwVEaLkPSoUShaJD4pnGtvWEe3N4/oHrnp+OW8w3Hnw3yrUp4EWqPz/WlP2iyuUj9dx6X+e/Pw4q+CJCf3JDL5oa3ko6w/8D/rHLZqMyn6Jl3Nu6Bdx30b6bmAzjkGMjWoN3rqjYQzg8+ZJMNRl0w8KpR/aAjx0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 10:29:47 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 10:29:47 +0000
Message-ID: <0b40eadc-c763-4cbc-910d-cbeb03b432d4@intel.com>
Date: Fri, 4 Jul 2025 15:59:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component driver
To: Greg KH <gregkh@linuxfoundation.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <alexander.usyskin@intel.com>,
 <daniele.ceraolospurio@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-3-badal.nilawar@intel.com>
 <2025070421-cattishly-buffed-d992@gregkh>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2025070421-cattishly-buffed-d992@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab62ce5-5564-47cc-2918-08ddbae5b361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHpocko0aVkzYlVuWno1c1hNMlErdmJkc3BxWkhkaHVOWi9GWWJDVUR0eWlz?=
 =?utf-8?B?WmdwVUJTTG16REw0NFVEV3JtRERXbkpGbkhvbFBWN1k5dWFRQ0FHUC9pVmZn?=
 =?utf-8?B?MzZJV2d1SWJGZlpSNGxKaHg2R2djS1FSenQxSWlLbURpMkFjOFJpaXhOVUJl?=
 =?utf-8?B?b01vanFjRmJ6ZnlNcDVkWmlVZVUxWHBFZGFPUWJFVFZORTVVdjRkOUw1VUh3?=
 =?utf-8?B?MjQ5a2xQN2JmN0xDdlZ2V29xcm1pb0VhbEU0cXR0RVd3NjlsRlFLU29ZZ29h?=
 =?utf-8?B?UVBSb2poU1VXS0JxblJ2RUtraHI3V09ndm9xckpGRVJudDBxUk9IakMzMEVw?=
 =?utf-8?B?MGZodXVlRVFCV3RlclR6YkFMTHNHcFZrZ0xiUE9GUGNqaVJHQnJwZTZsMkE1?=
 =?utf-8?B?UTlhSDl1OWhHV0QwdUVKa1Q2TkgvOXpUWUd4Vk5aLzBmcVdhKzNqSGtaK0dO?=
 =?utf-8?B?cTVYTUhzY3JOcnlyR1p2aDg0M2NXcDdpNUwvejlCTERNQ1hqTW5xcEdHMnY3?=
 =?utf-8?B?SS9iUjBNTko5blhFbDhaYUZMdVVTeGgrV1VHTkdHYmROYWNIWXJPM3AvbC8y?=
 =?utf-8?B?R3hHOHFTVWd2N2hLdG1XR1VvYmU2TGRZR1U4VURWZWZkd2NuU0JyMmpJZGhI?=
 =?utf-8?B?TDBSMFd6RzdyRklwc0kzd0pSdDJCSnozSHJtNVl0TnpYb1dkOWFwUkVqZVpp?=
 =?utf-8?B?VXhzQjMzcVp3TEJrTGMxMGhsN2NnRXFoeTJTRmg3aGRydFA2N2NEQUVvL2ZG?=
 =?utf-8?B?c3NRa2JEZlpkbStmWm5VeUJraGdSdHowQjRRaTMxd3RmZ0tyTjE5L0lDTGpE?=
 =?utf-8?B?bkFCNUd2UWQ0VEQ3V1BKUEd6ZGQ1YXdUMExWK3Q2a1BRS1p3RmFVSUZlUUVz?=
 =?utf-8?B?SHBham9DYzhYOHhlR2VScGdWSTNJalM0ckpFL3NlMDJBZ1NyanFRN2syTTFn?=
 =?utf-8?B?bytlL1pHb1VUQ2sxWlFzZlo5UjZEZmthNllGZG1JL3lTc08zK1ZRbmZIUXd2?=
 =?utf-8?B?Z0ExaTBBODdHKy9rV1BadDNyaitqVG9EU2NhVzNaKytWV09Mc3VJSWVWdWFY?=
 =?utf-8?B?NXA5MGtrUjNnZ0Y5RDJ5dlZkek9RVEFNRE5nTEVvSnVMWUpHMDd1bmxNMjNr?=
 =?utf-8?B?RmYwWjgvWVUvalNDZU9kWnl1UVppU2gyYkRsWi9xOWQ4cWVjK1dtQnJQZ0Z3?=
 =?utf-8?B?dThUME1ndk4xeTFRTzdzNklheVBXZ0ZSY1JyT09TNGZOREZKSXQvVityd3ZT?=
 =?utf-8?B?eFdXUjI2L0xoeFRaVmkzL1RYSGc1SEpsdDAzblBlL1FtUWNac3JXSjdOalEx?=
 =?utf-8?B?d1V5R0dsYkJVY3paeG5ibGtlYTJEMWN3bEFLRUJ6TnVuc08vT1RMc2t5YzYv?=
 =?utf-8?B?OTUvUGdJanV0dWdIMW0vM3RITzczN2pEb3BXZ1E3QlNVR2xmMXZ6d2h0c0tr?=
 =?utf-8?B?QjBhcTdrMmxvSlhKZ2huUjQ4cWwwdklZRXVzOGVUYWJERVZSamRaRjMrMVZx?=
 =?utf-8?B?dU9WaDVUdVhoczJwTHYvZ0tlRHpHT0NFUEdDakhkVVdUMC8zVkFpMXBSQjFR?=
 =?utf-8?B?YlBibVk2NjUrVVhlbHNwbitjTG96RjRtb2d6Z3d0U3VxR2ZSNW8wRnRpcHQ3?=
 =?utf-8?B?c3FlaW1wZUxQV0NlVG9MS2cvTTRYSDFRUUx1dEdhU1lxR3Myc3R5dTlSdXZt?=
 =?utf-8?B?S1A1dXNpOW1aQlNrUDZkcEpUNnVkVDR4RlRnMWk1dGJ1OXBxWC9XRE5PZkpY?=
 =?utf-8?B?dS9hRGJweWtpcVFDTFd2UGtxaFhrTU4xKzR0MVpGYlg4bHJrREZ0WWh4d3FY?=
 =?utf-8?B?eFkyZXZhakkrSUxyZjVBdTJsVFBqNlhSOXNNTnVBcjVBYVNLNGUvQnFWTXRV?=
 =?utf-8?B?ZkhTQndCcnJwbnJqdnZqc0hlZVZjQVdrTzYwSGl5NVBUQmNKU3dJVWJSSEpG?=
 =?utf-8?Q?wZCQteCg4r4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUkweDhqV3VjQndYWHRCMVkwSVliWTB0OTZjeTlFak9BNDU2ZkJOS1JGdjBk?=
 =?utf-8?B?RkgwODFwaFJKOTg3TjJxRmFBRWNISm82YTl4Zm5MalFCQ0pXNSs4L0tsdEUv?=
 =?utf-8?B?Wlo4K0t5a0t5K1NGRzhmV1JKOFRBRk5tZjhJMk1LQVRSTHAzdU5QTXMwVWl3?=
 =?utf-8?B?YWpJalZxTXQ3SnNSbCs5YnNOQnFVdzhiK1Q3WFVuOUVJT1AzNTRVQWptaFR3?=
 =?utf-8?B?eWFkaE5ncEdmbGF6ZlprZ3N4WFp0WmZrYm9EUnJHNnhaSXZSRmJDT1BJblJx?=
 =?utf-8?B?MkZHdXhlYmR3MnNhMzFmTkdIcGh6OThUcGYzOTBBQkpoWjV1Z0RDYU5BeGRn?=
 =?utf-8?B?KzFab2Qyb1BYUnBnY0YrTDJGMWhQVndnTjZIU0JuWHNib2dlMzUwcktJbStN?=
 =?utf-8?B?UlRQdG8rSjdMVUdBSmxSTUdlWnM2bEpjWk9HNUVxcXN0QWhZZDJwMlRCeGJK?=
 =?utf-8?B?TWdZeUZFUldGdVlGZk9HU3VobTlCak1QZlhENDNJMWRHZTJDVEFvUWtzOFU2?=
 =?utf-8?B?K3hXdDZuSGpiTmI2eVVCUW1zQ3EyS1EzN2IraFd0RThNZklidE96bHRRZjFt?=
 =?utf-8?B?YlZSQjZtL1VUaXVwSFhlQUpMT01laHBoVEVRU0JTdmhNbU5SSUZkbjBxVHNX?=
 =?utf-8?B?bkFOT2ZMWXE3VS9xNWV3ZFByMWtwYVJkdlQ2RWhzYXZoOStsZTBDYzJuMU9O?=
 =?utf-8?B?ZGwxS2tBMmNhZmtvUnBZckFNaEZIWmpqNXJ6V3YrR1RsZ3A5bkZjNDNqd1Bx?=
 =?utf-8?B?TTBUVzRZcmIrWWFiMjhjZUVCcHREd0xxYVNOb1FMbkgrK3VQazFZZC9vdmln?=
 =?utf-8?B?b3JLVlZjWURpWXlGbUh5OWNWREJFM2huN2RNUGh5SDUrVnZrdzZTenlFOVdI?=
 =?utf-8?B?RlQxK1UrcnpFUS9pNHh6eFVrZXpGQXgxQ0JNd0NGeWU0amxub0hoRUp5WUlW?=
 =?utf-8?B?K1VlTXJyY0VKb2hMRFlWTnNNR09UWjlrQzJ3U3NMaFArZTRlSHdhck9wYnlO?=
 =?utf-8?B?amlzNno4S1hsWVBWWWZ5a0FNVWo2eXhXYzJOSHRhQlhSTksvaE85VjY1THp1?=
 =?utf-8?B?WmlscXhqV1RhamJaVU9vYUp2cGdhSGNINE1jb1BCNVlLUlJBalpJM05tSThh?=
 =?utf-8?B?dFkvT1JpcGFNaEwyS2NiaWlxS2N1b1A5N3cvZW9FbWhkWE90b2VVWkh3eE1x?=
 =?utf-8?B?UjVlRGxQKzAzYjJkemtMNVMxTnl4enlLb0RGMXg3VHN2WE5WdUR1enk1KzJp?=
 =?utf-8?B?Qkl4VGZFT01VTmV5aG5aVlZMaUd2ajl4ZFV0dHZLSHFQMTBsOEFNMkEwZGhv?=
 =?utf-8?B?SU5RTXA2SWdjSk93UyszS3ZNY2dMaE9vWnNuMGRVVE9IczRHUFJEV0NUVzdC?=
 =?utf-8?B?Z0ZXQ1JLMjU2bGN1OTZPVmVKZk1MV2l4c2ttRmkvM283dUxSdGpiTTVlMmpY?=
 =?utf-8?B?L0puYUZWZnVxZFhrM25MTkF6bjZTVDdUR1dnWGwvSXIvb2FtMzNDbEZEM2ll?=
 =?utf-8?B?Vm9heXlYd2YvTk9Ec2NnL2Q5WTJXdUw4bm9VQ0dDSlZYNVdlL1BIWXNzUUUy?=
 =?utf-8?B?WWxBQk1IRzlpME5SVEFoYlJSZlpBVkFCeVJKZ2tzVGlCc1FiTGMzNE0vTDNj?=
 =?utf-8?B?VmRHdkxFM0ZxRXgyTXhnMjhRNkJLRTc3Nmt5Um83L3JYVUR4OG5BMUM3NGRO?=
 =?utf-8?B?VkFuV0VvNTZCZ20rdWdXSTBnWkFnM21yYzRybU9YcUlaN3NQZ0hWdmkvc1hY?=
 =?utf-8?B?bDFWWlpIMFNhZ2htSkd5VVJBV0NWY2NaeHpZS25oWWFnWUFpZ3hsVzFEWnFy?=
 =?utf-8?B?aEEvakkzNGNoaFJPWEFuaEVHeFEvOURjc0h4WUFLVktaRXM3MXpubjB1blJt?=
 =?utf-8?B?U2pIMTVOZGhIK2o2T1BlTFR3OEpIWlBuUHlTU3pNVFU2Sy9RbWZ5NXkyVFVG?=
 =?utf-8?B?UGx2S0JZdWN0cjFxWXc5YjQ2bkVqS0Nucmp5dnJWQlh0Q3BsVDZucUoyWmJ4?=
 =?utf-8?B?Y2JaRkdtNjBEMkkvdE4xTkVQaExKZTRqdjVyR0RJMWpoV3M2L0o3UlAxcVlC?=
 =?utf-8?B?Tk1NZzZpV0FQVjZQRXNiamlmaGhNVGtONWhpdXFvN2NSWGtCZVhOL3VBSUlH?=
 =?utf-8?B?elh2M3FaSlJhMWdDbDUwTU5meVlnWlp2QTgrZWphcHVHVVAvNHF3aFI1L3hC?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab62ce5-5564-47cc-2918-08ddbae5b361
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:29:47.7280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OF/sE81ha8XByTEqY9b1sR9whWQ+XRrxnR5bXpAEwlZirxn2DZoJ35kVhdFSTTBo+VonFSKWtl9RBroAiRNLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
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


On 04-07-2025 10:44, Greg KH wrote:
> On Fri, Jul 04, 2025 at 01:00:58AM +0530, Badal Nilawar wrote:
>> From: Alexander Usyskin <alexander.usyskin@intel.com>
>>
>> Add late binding component driver.
>> It allows pushing the late binding configuration from, for example,
>> the Xe graphics driver to the Intel discrete graphics card's CSE device.
>>
>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>>   drivers/misc/mei/Kconfig                    |   1 +
>>   drivers/misc/mei/Makefile                   |   1 +
>>   drivers/misc/mei/late_bind/Kconfig          |  13 +
>>   drivers/misc/mei/late_bind/Makefile         |   9 +
>>   drivers/misc/mei/late_bind/mei_late_bind.c  | 272 ++++++++++++++++++++
> Why do you have a whole subdir for a single .c file?  What's wrong with
> just keepign it in drivers/misc/mei/ ?

There is separate subdir for each component used by i915/xe, so one was 
created for late_bind as well. Should we still drop late_bind subdir?

cd drivers/misc/mei/
       gsc_proxy/ hdcp/      late_bind/ pxp/

>
>> +/**
>> + * struct csc_heci_late_bind_req - late binding request
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @flags: flags to be passed to the firmware
>> + * @reserved: reserved field
> Reserved for what?  Set to what?

Reserved by firmware for future use, default value set to 0, I will 
update above doc.

>
>> + * @payload_size: size of the payload data in bytes
>> + * @payload: data to be sent to the firmware
>> + */
>> +struct csc_heci_late_bind_req {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 flags;
>> +	u32 reserved[2];
>> +	u32 payload_size;
> As these cross the kernel boundry, they should be the correct type
> (__u32), but really, please define the endiness of them (__le32) and use
> the proper macros for that.
If we go with __le32 then while populating elements of structure 
csc_heci_late_bind_req  I will be using cpu_to_le32().

When mapping the response buffer from the firmware with struct 
csc_heci_late_bind_rsp, there's no need to use le32_to_cpu() since the 
response will already be in little-endian format.

Are you fine with this?

>
>> +	u8  payload[] __counted_by(payload_size);
>> +} __packed;
>> +
>> +/**
>> + * struct csc_heci_late_bind_rsp - late binding response
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @reserved: reserved field
> Same here.
Will fix this.
>
>> + * @status: status of the late binding command execution by firmware
>> + */
>> +struct csc_heci_late_bind_rsp {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 reserved[2];
>> +	u32 status;
> Same on the types.
>
>> +} __packed;
>> +
>> +static int mei_late_bind_check_response(const struct device *dev, const struct mkhi_msg_hdr *hdr)
>> +{
>> +	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
>> +		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
>> +			hdr->group_id, MKHI_GROUP_ID_GFX);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (hdr->command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
>> +		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
>> +			hdr->command, GFX_SRV_MKHI_LATE_BINDING_RSP);
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
>> +static int mei_late_bind_push_config(struct device *dev, enum late_bind_type type, u32 flags,
>> +				     const void *payload, size_t payload_size)
>> +{
>> +	struct mei_cl_device *cldev;
>> +	struct csc_heci_late_bind_req *req = NULL;
>> +	struct csc_heci_late_bind_rsp rsp;
>> +	size_t req_size;
>> +	ssize_t bytes;
>> +	int ret;
>> +
>> +	cldev = to_mei_cl_device(dev);
>> +
>> +	ret = mei_cldev_enable(cldev);
>> +	if (ret) {
>> +		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
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
>> +	bytes = mei_cldev_send_timeout(cldev,
>> +				       (void *)req, req_size, LATE_BIND_SEND_TIMEOUT_MSEC);
>> +	if (bytes < 0) {
>> +		dev_err(dev, "mei_cldev_send failed. %zd\n", bytes);
>> +		ret = bytes;
>> +		goto end;
>> +	}
>> +
>> +	bytes = mei_cldev_recv_timeout(cldev,
>> +				       (void *)&rsp, sizeof(rsp), LATE_BIND_RECV_TIMEOUT_MSEC);
>> +	if (bytes < 0) {
>> +		dev_err(dev, "mei_cldev_recv failed. %zd\n", bytes);
>> +		ret = bytes;
>> +		goto end;
>> +	}
>> +	if (bytes < sizeof(rsp.header)) {
>> +		dev_err(dev, "bad response header from the firmware: size %zd < %zu\n",
>> +			bytes, sizeof(rsp.header));
>> +		ret = -EPROTO;
>> +		goto end;
>> +	}
>> +	if (mei_late_bind_check_response(dev, &rsp.header)) {
>> +		dev_err(dev, "bad result response from the firmware: 0x%x\n",
>> +			*(uint32_t *)&rsp.header);
>> +		ret = -EPROTO;
>> +		goto end;
>> +	}
>> +	if (bytes < sizeof(rsp)) {
>> +		dev_err(dev, "bad response from the firmware: size %zd < %zu\n",
>> +			bytes, sizeof(rsp));
>> +		ret = -EPROTO;
>> +		goto end;
>> +	}
>> +
>> +	dev_dbg(dev, "%s status = %u\n", __func__, rsp.status);
> dev_dbg() already contains __func__, you never need to add it again as
> you now have duplicate strings.  Please remove it.
Sure.
>
>
>> +	ret = (int)rsp.status;
>> +end:
>> +	mei_cldev_disable(cldev);
>> +	kfree(req);
>> +	return ret;
>> +}
>> +
>> +static const struct late_bind_component_ops mei_late_bind_ops = {
>> +	.owner = THIS_MODULE,
> I thought you were going to drop the .owner stuff?
>
> Or if not, please implement it properly (i.e. by NOT forcing people to
> manually set it here.)

Somehow I missed this. I will drop it.

Thanks,
Badal

>
> thanks,
>
> greg k-h
