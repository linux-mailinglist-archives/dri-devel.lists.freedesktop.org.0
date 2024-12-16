Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCDC9F31A7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B3110E680;
	Mon, 16 Dec 2024 13:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XEUpqdbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9536D10E67D;
 Mon, 16 Dec 2024 13:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQ7oY4MvXLaUCL0KtAMwrbu04c7wPatq7zJNLeNjye8WljvGKxGhHxKfmhW1/2bnScjPsnxj44/9JpNVqb1vfRqlOrALtM6nf08foOfCJRmtQ/OpIzopqrHPc8SbT56CTg9sIfDPbJyxgGDNmxNfTGgjCwjRehfnqUxQLi4IRhcFKsnUfrhlgh56vmmclF7FaVDjzIniw9P95H7Qb0ex+hGe3aEJSMW4Ts9FTdq8Z2SoPFvqyLdAguy5jZ85PkdEb8t/4GSrjnuezazBJkbjrEpU3twj2G+CqrR0iQijuHraryCN60tkIT2H37iu9aHN7y5wQxLrgunFx8oR+h6mUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qjy8pKFCkX++eX3TaTADxIWsRly0lSkD4Dg8QSmj7U=;
 b=FxxJ6qVHg+NHicGODaIfa99OZ5ImrKShTQ3fKD+iEtubbLPXOrK77WD39/gujqZ0tsbBPPIR+tcfsfbKtGa9JrP8jGQxcC0Ap8SVX9YwHbFbaGUB805aLgDBcR6K/LEbYtgT7LadUkSToRjYZfA2keH1ZFVaMs9pghP4a/G3nxusuvIzHVdrEfdaTLraSUH7VHYD8DBVkT4NulDuDGeU9z2hZ8mNFT/Jz1DTgt2UAQPeCenJFkDqQLa6JIy5srkk8WbKXSj3XIChA/SIIXjrpMiNF6pBHFJsP/bLAVtw3DjtgG0BaZvRrjo26GHoKcu/hsOG5ZTpcksYndY7bUr4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qjy8pKFCkX++eX3TaTADxIWsRly0lSkD4Dg8QSmj7U=;
 b=XEUpqdbd3bAdIvTP4XiRem2TLU9rPSZztY1i6CYh9FYHCuhe6be3J1u11NI+LyI/g9yWyZb283O23IHBhZTxuyMHZvWSZHwDmRMqWFCsnA7U66dl/vcyEC1aTNUnsNxsjWFjjwbjNRjznSxtQGiueMlR/REbYTU6GJrRSUWjph0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8138.namprd12.prod.outlook.com (2603:10b6:a03:4e0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 13:36:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 13:36:46 +0000
Message-ID: <e7da8e04-c296-43f9-967c-83f74e384c4b@amd.com>
Date: Mon, 16 Dec 2024 14:36:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
 <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
 <7c64746a-c1f6-46c6-a97f-cfd87e9ec3b7@amd.com>
 <5f7dd8ac-e8cc-4a40-b636-9917d82e27f5@igalia.com>
 <84b6dc5b-8c97-4c8d-8995-78cf88b883fc@amd.com>
 <8d6395fc-8143-4099-a9d6-b13d450d7fd7@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8d6395fc-8143-4099-a9d6-b13d450d7fd7@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 530911c5-2449-43cb-b306-08dd1dd6af80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUZrSXZ2SXExeEJxMFg2N2FwalV0Nmd1NXRFb0ovQW9SUTMrYkRTS2prRkli?=
 =?utf-8?B?SW9lamlrdzBiNFhiaHVrdUR2cUp0NGk5bzBqYlpYM2cvRHBPaVk2NDU5LytQ?=
 =?utf-8?B?Z1JGVFg4QlY4WXN3dCtxT3BTOFRscWtLMHJUT0hVOEVTYXBjWHhiSmtTU2Nz?=
 =?utf-8?B?V3c3blFySDA0R296M1JUZmIrbUxnOWY4U3BIRFpKTEZNY0ptb21GRmFrOHZn?=
 =?utf-8?B?OVlUb3c0bnR6cDRwTnpGZ1NrRk1EWXljeGcyTjlhQkdxdTdrUVRLczJOSHFV?=
 =?utf-8?B?eXFleDlyblA2eHpYVldDN1d3cFYwM09lYXZ5eDJFZDkydEVDZ3JNZ3BXZGpF?=
 =?utf-8?B?YktabzRaL3Nubm1uMFhLUWhCSlJ1THJyOEhDR0NWNzZKL2ZwWDN4djU0WDdt?=
 =?utf-8?B?U0pZc3VBUUpyUG5RVkYwZ0dyOVQraTdPZ3VqT2lId2E3SjNkODdOUktSWUVV?=
 =?utf-8?B?cUJ0MEVDVXN3a0RFNlFXMkJiVFJRd3BKSHpjY3Q3Vzc3QzNuT1hqSnZid21W?=
 =?utf-8?B?S0xGa1RkMXZ6cHdlS3R4eVdXSFZ4Um9IOFc0a25vdngzZ0lJYXVnS0lLSm9S?=
 =?utf-8?B?dFpCd0lxaEd1NEpSUGdabndpT3Q2bkY0YjVxOXdFdTNWRUoxazNyUktmZVd4?=
 =?utf-8?B?VnJERnRJcnVmZTVFZFFCZHhNQlpnNFZHNW01M3BBaWc3VXNUUE4yQTdFTENM?=
 =?utf-8?B?bENCUlNUdCt2MlVybjNGbnNvNEQxTXN3N1dDaHQvNFpCRGFKREN2USs0VXk4?=
 =?utf-8?B?clNBMkxZeGNvazVEajNtcUlDY1lxemxTMWpUdWQyWndHa2puMFNGbVk5djB5?=
 =?utf-8?B?Lyt1YlQ1VUp2WWxyVjZmSXQ3a1orY09QM0F6a25Ud09uVHU1MkFQWFkxWEUw?=
 =?utf-8?B?MEhqaDR1bytFT0d3UU1LMDZKdnJSVndERndFY2YrSEZzclpsYnNQUkZNajRS?=
 =?utf-8?B?Sy8vNC8vOXpXSGxPdW1rOGtLSHl0cUl6N0srZnBnSVFxQ3gwL2x4STJtNThU?=
 =?utf-8?B?OWtibkpFYmtRVFhSdDB6c24rVjJrY0lSNXlEaks3a0pDWjArYy9JYlJ6TzVU?=
 =?utf-8?B?aFdGQm53TXU4d0tUbmkyZHRaNXVxbWNtdFgxVWllcURFU1RiU3JVb2l2Vkx6?=
 =?utf-8?B?c2hoRUp6OXBxYkdaRlVrNTd1Mk5IZWpQbVFnaEc3NDRmei9Kbjg0TU50M0Zo?=
 =?utf-8?B?cFp0ZVg5NGRmbkd4WDE3SmZiMmFkY3NVV3A4KzZaUGhUb1o0S0lHdkRWN1Bz?=
 =?utf-8?B?R0s4ZEhPb3hXcHl1SGFkaklZZzVGdVdBMTBIWDdFZDB0akEwTFZ2eDhzUlFQ?=
 =?utf-8?B?NzRheVRnZXhnZ2hsSHArWUNJeVpmMmlYQndReDI5WHQzd0U3VzBCTmxqbVN6?=
 =?utf-8?B?RUtEdHFjdWxSQzN1cEJQMklXOGxaQVhOT3cvYjBmYU01cHlYV0xoK0JkK1Mv?=
 =?utf-8?B?QlR6M1g2YjVjditpNDlkdm5VWlozdzc5SEp4ZDI2cmJ6cGVUVnlvK1I2M1hm?=
 =?utf-8?B?dGhiMkovVjR1VnBsUmNxQnFVb3VsSjFoS1liQ3BFUkZ2cnE5RXBVL3RjbVha?=
 =?utf-8?B?SXNtS29XOHM3TFk4S1pqRGVveVFwc1oxSUwvSzJsRDBRc3pNUGdsblRiYTYz?=
 =?utf-8?B?YzVra2dDclBObGFBYUpaa2pDUTdyUU1mQlRYZzFoL00vc0wxdVNua01Fd0g4?=
 =?utf-8?B?VzY2OWpwcDV3YlQ0cW1mZnl1VEtwajY1TWQ0QVZZS0lCTnZCSVdBOHBjdFlo?=
 =?utf-8?B?M204OGFJcVl5N3FmVnFVSWNtV01uSUpQSEl4cThJNEIwYTBKNVBxcTBFc0lO?=
 =?utf-8?B?UDByZlNRUGJ2QnpyL2RIdGo3TFBVZ0t5WDV4NDZvemYzTEFTMzZLWEdVWUVh?=
 =?utf-8?Q?dwea8dhNnf0q6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjlaVWtYQ25ueGl5L1dJTXdtT0hTSjNxNndOcnBHUHlQblhzNzMrUXFSNTlX?=
 =?utf-8?B?ZTJ0SmtML2R2Kzh1dk9zNGIwOWQ2NUF3QWJFdVBLcXRPU2hLalFldFZLSnN1?=
 =?utf-8?B?eG4zWUcwR1VyR3F0STkxYTBBVkN0Sy9US3JxSFV1MXNGQWtndTJIQ1VLekRG?=
 =?utf-8?B?K3N5ZEFSNDFPelZpRWJ0c0NkUy8rWHJZcEhVNjhZVEY2TFNaeWIxZzF0cnRy?=
 =?utf-8?B?cXFTclNkYVlXbCsxc2swYjd5cVhGcXZHWVlsdDdQSnNhY25FM2d3RjkwdWZ1?=
 =?utf-8?B?bDEwV2ZBQ2laT1R5TEE5eTNoUnNadStiM1Y0YTQ0NHExQ0JuZW1oNU9qQUFE?=
 =?utf-8?B?MW14NVAzQ2NLQnhVcUlLRERqY21DTWhxWU5QSE5NM0N0THlNam5FdW5GMElC?=
 =?utf-8?B?QXZhbjUzbVNUSTRReWFTc2JodnRLSkdkZm1WWXltMUlIVUFqaHBOcTdPbjF2?=
 =?utf-8?B?TEZpME9FT3BLeW9qMS9QN25kVHp0OFJnY0I0R1dnYUpySytoSVlraWNpZlVa?=
 =?utf-8?B?WWVTc0hHQUp0cGN4QXFpT2ltQ2dwQysvQUR3MitiakQ3bExYYkZhVXBBRG5z?=
 =?utf-8?B?MkF2VzI4cnFFZ21FRk9nKy9UVXFHeXBYQ1g3Mitjd1U5Y2t1enFJZ1pxeHFM?=
 =?utf-8?B?NXUxUEY2NDVHdHYvSVJ0andQVXpHb3ZQeTJzbkZNQTc1MTdwUkdvRlluR0Jm?=
 =?utf-8?B?Wjhxenpvb09pVWhaNkdncTMzc3JrWldHbFVoSWZEWVU0MVBCYmxrNWtaT2NS?=
 =?utf-8?B?Q21YSFUxSENCWHVxYU5CR2tPeUhMWTB4RmVhZUlMOUMwcGJzeXorVTB4ME9I?=
 =?utf-8?B?a3dPYTliNDQ3UlNsVVNCY2kwd0tsSkdDcEtQVmx6SytIM2dRYmVKRDIyZEdW?=
 =?utf-8?B?TXcyTUxxSnFLc2pRZFBxODZXdlo5VHIwQnZlNFBHbGhaTGpCRWg2Qy9CaUZE?=
 =?utf-8?B?bU5TRHJMNXNHU0xPb3V3ZDFsK2hJQmFXa3U1R3UxeDUvY0JvL2lORk1pN3VG?=
 =?utf-8?B?NTBtdTdJRkNlVUwzZGcxMElOVk9rMG5TaDV4Kzd0WlJiVnVlZGJCS1h0QUlw?=
 =?utf-8?B?WnArVms5ODNLOG9IQ3ZGVXVJT0tMMUcvOENoOEN3WndoNGFMNXdIaVRFVVRJ?=
 =?utf-8?B?N3JVcE50Qi9FbXJ2amJpaGRIODRaRzMvWnl4eUloNGpJTldHbEVvZmJGdFpo?=
 =?utf-8?B?cUU2WUI4Z0tlL1VoVU8wY0RiOWlVa0RPOGFKSnhjRHZQUmtrR3JjcU56ZVlR?=
 =?utf-8?B?RkRpMHNUTlpVWFhuS1lGTlhPVy9EOStBa3E5T1Y4cnhEUE9wbklZRTFwWjdr?=
 =?utf-8?B?V2lhVDRmUUZWRlVlQnViaHoreTFVZThURlhpK0oxY0M1SnkwYlVSdHlEOEdU?=
 =?utf-8?B?YWNxc0IvWlhOanNid0dHYXNNaWFGYW5XaVhkR1NQVFgyNnY1SGJ3RkxLSTVX?=
 =?utf-8?B?VEdNUjFSNmpwc0VsQzZya01OenRucVJ5Q3NpajVEdE0rYWtOZWJsbllrWTlT?=
 =?utf-8?B?aitMWmgzeWN3SE96NW9TMEVMOXpmQWRBUU9rbHZpdG5CMjRUOWI3ZzJNTlFv?=
 =?utf-8?B?K0hkaFo0QWdoMCt0RkpxZ05WMTNWOWZ5MkVVRDhzK2h2QUlGN2NBVytmdnVa?=
 =?utf-8?B?MFp5cXJTNWRXeHQzNU5XTkFKcmlxWGZmOVQySUZWUkx6ZjJVS2hSUFJ2Yk5p?=
 =?utf-8?B?OXpKdWJsT0dWY2NuaWppa3FKcDhVVzFpWU1pVWg3aXhnbGFDdU5nd0NvaXlO?=
 =?utf-8?B?UWFzTm44UVh1R3F5bHdRNkpxK1lZbHE3Nm55NU1SNmJIV25IN1VLem50ZG9m?=
 =?utf-8?B?akJMWkhBaHIxT014VjJTMkwyK1Y3cWxFUEx1TjRYQXdVaHlFR0hXemFLMDJK?=
 =?utf-8?B?SDdReUp1dTVlaFA0YnFDNCtEQ0tvbllTTWNENFN1Q0Q4RWUwWVNNQ0o5bEwz?=
 =?utf-8?B?UTFvMnRWTGNRRkV6SUNFL2ZvTENmV3h0UHd0RlBiK3M0YzF6L3JxZzFNZnN1?=
 =?utf-8?B?a2MxbjZzUXVONGpBVUVvK0Z2dW9MM3JLTDJjQmxLTXFtd0tWRUJsWUJ0UFpZ?=
 =?utf-8?B?NjI4a1ZJejdjR0NjN0tGNXdZalhKcytOVDloc1IwT0c0dVBkVXIzN25uU3NV?=
 =?utf-8?Q?X25kcYK0tr0PX1rvsP8Ebfi0B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530911c5-2449-43cb-b306-08dd1dd6af80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:36:46.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXpUKBv8Ojm1Kv0KrIeaP9OY6oif1c5/pP3a8RTOqcPTYWrFQliT5YctJilnyQFo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8138
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

Am 16.12.24 um 14:15 schrieb André Almeida:
> Em 16/12/2024 10:10, Christian König escreveu:
>> Am 16.12.24 um 14:04 schrieb André Almeida:
>>> Em 16/12/2024 07:38, Lazar, Lijo escreveu:
>>>>
>>>>
>>>> On 12/16/2024 3:48 PM, Christian König wrote:
>>>>> Am 13.12.24 um 16:56 schrieb André Almeida:
>>>>>> Em 13/12/2024 11:36, Raag Jadav escreveu:
>>>>>>> On Fri, Dec 13, 2024 at 11:15:31AM -0300, André Almeida wrote:
>>>>>>>> Hi Christian,
>>>>>>>>
>>>>>>>> Em 13/12/2024 04:34, Christian König escreveu:
>>>>>>>>> Am 12.12.24 um 20:09 schrieb André Almeida:
>>>>>>>>>> Use DRM's device wedged event to notify userspace that a 
>>>>>>>>>> reset had
>>>>>>>>>> happened. For now, only use `none` method meant for telemetry
>>>>>>>>>> capture.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>>>> ---
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>>>>>>>>>>     1 file changed, 3 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> b/drivers/gpu/ drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> index 96316111300a..19e1a5493778 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>             dev_info(adev->dev, "GPU reset end with ret = 
>>>>>>>>>> %d\n", r);
>>>>>>>>>> atomic_set(&adev->reset_domain->reset_res, r);
>>>>>>>>>> +
>>>>>>>>>> +    drm_dev_wedged_event(adev_to_drm(adev),
>>>>>>>>>> DRM_WEDGE_RECOVERY_NONE);
>>>>>>>>>
>>>>>>>>> That looks really good in general. I would just make the
>>>>>>>>> DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
>>>>>>>>>
>>>>>>>>
>>>>>>>> Why depend or `r`? A reset was triggered anyway, regardless of the
>>>>>>>> success
>>>>>>>> of it, shouldn't we tell userspace?
>>>>>>>
>>>>>>> A failed reset would perhaps result in wedging, atleast that's 
>>>>>>> how i915
>>>>>>> is handling it.
>>>>>>>
>>>>>>
>>>>>> Right, and I think this raises the question of what wedge recovery
>>>>>> method should I add for amdgpu... Christian?
>>>>>>
>>>>>
>>>>> In theory a rebind should be enough to get the device going again, 
>>>>> our
>>>>> BOCO does a bus reset on driver load anyway.
>>>>>
>>>>
>>>> The behavior varies between SOCs. In certain ones, if driver reset
>>>> fails, that means it's really in a bad state and it would need system
>>>> reboot.
>>>>
>>>
>>> Is this documented somewhere? Then I could even add a 
>>> DRM_WEDGE_RECOVERY_REBOOT so we can cover every scenario.
>>
>> Not publicly as far as I know. But indeed a driver reset has 
>> basically the same chance of succeeding than a driver reload.
>>
>> I think the use case we have here is more that the administrator 
>> intentionally disabled the reset to allow HW investigation.
>>
>> So far we did that with a rather broken we don't do anything at all 
>> approach.
>
> OK.
>
>>
>>>> I had asked earlier about the utility of this one here. If this is 
>>>> just
>>>> to inform userspace that driver has done a reset and recovered, it 
>>>> would
>>>> need some additional context also. We have a mechanism in KFD which
>>>> sends the context in which a reset has to be done. Currently, that's
>>>> restricted to compute applications, but if this is in a similar 
>>>> line, we
>>>> would like to pass some additional info like job timeout, RAS error 
>>>> etc.
>>>>
>>>
>>> DRM_WEDGE_RECOVERY_NONE is to inform userspace that driver has done 
>>> a reset and recovered, but additional data about like which job 
>>> timeout, RAS error and such belong to devcoredump I guess, where all 
>>> data is gathered and collected later.
>>
>> I think somebody else mentioned it as well that the source of the 
>> issue, e.g. the PID of the submitting process would be helpful as 
>> well for supervising daemons which need to restart processes when 
>> they caused some issue.
>>
>
> It was me :) we have a use case that we would need the PID for the 
> daemon indeed, but the daemon doesn't need to know what's the RAS 
> error or the job name that timeouted, there's no immediate action to 
> be taken with this information, contrary to the PID that we need to know.

Yeah, that's all stuff for the device core dump I think.

But if you want to add the PID for high level control then that would 
make sense I think.

Regards,
Christian.

>
>> We just postponed adding that till later.
>>
>> Regards,
>> Christian.
>>
>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>
>>>
>>
>

