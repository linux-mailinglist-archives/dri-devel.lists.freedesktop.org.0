Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A24CFB637
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 00:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB8510E1D3;
	Tue,  6 Jan 2026 23:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f2W6lhWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEA710E149;
 Tue,  6 Jan 2026 23:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hehajonb1lAXhpQklegB6sVfsBnZZ2R7ZqlrqINSYUFoQS6V1CoA+hAz78fH0I4HLQsZuVPBAWP+dq+r3L8pCXI+MddpFgZC/7uWQfKk2BLlY72Agd9MnQ+BTpu8EHVBD66GupHFYmAP1MBoal00xrUUzS5cJvcF+aQcELxTQloBmHoIZ4u447hxGkXvyyTg0gtvOZwtPSfpvPJF7yqvSkCcYUKtmJblnphCWZ372Dh7ELGe7wLydXkh0Jb8TPskgdNsyizYMc2sPWFB5Uo7zn3OAedabAXMHpJ6poeKR85MlOCy7i9+AgdY3Tb8ubv6jdsogzoKEwE7OA3k17Bt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9cxQYYSTfO7N8dnulIyxIkMuYhX+IDUuVe3NZfEZhk=;
 b=HwqMQdX/aF75HtBmgsT5rMEaKKIulRqynImXnGLmPgU7iIAZQIr4a/nJ1ilvXUUn4L1BDd8qo3opJtNebibMhOeJ7fWmMVSaLSvc3v0wQp/pW4AcNFCd4M9sA+6jTzXHeYlscpcpvzY8j9aWbrqIFBT0Hb+Z8miSetn87oZVVbM9NUdqWDwVgEbKnezm4LqnrcwzIBqGoRWvl8sNLhqREPzT+l5bILL/CH/aJ4PTiZo+8D+C2MeyUaZeL+qSyQmmp7QOPKGinkZBlmue9fhE/0A6BYSuvoymHNteQQ+mjcO9JmnKvxYQu8gv0vsGdsU5MQ89K44zn2Q10++IF51ctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9cxQYYSTfO7N8dnulIyxIkMuYhX+IDUuVe3NZfEZhk=;
 b=f2W6lhWtR6kLnjGtzg5Tgtsmq477kENedISGVGNaTJJ4/uvI8g+v9zhw4s8xPojuVB5cCzEyBn/lZG5+MUKSKvQogyn1naGemqtQaV17t91tgtrG+mjGzUcPUF9byPBZPoj+02aXfQ7xJnk8ip2eGfH4cEXWfTWRQNksKVVflTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 23:50:19 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 23:50:19 +0000
Message-ID: <e2fa6d9e-8074-450c-b287-6c5560770447@amd.com>
Date: Tue, 6 Jan 2026 16:50:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] drm/amd/display: Fix color pipeline enum name leak
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-3-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a213ff-4fab-449c-3358-08de4d7e595a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtYNkV6ejlROXZxNFBnRk5oSm5WWEFMMlB4ZmQyaXgvWXJVb3hRRFQrNDhl?=
 =?utf-8?B?bkxRV3lZVUhRdGR0c1JJcjlEQnR3WC9MUzZvWWJ2SWxXckd6ZkN6QmhyTUVI?=
 =?utf-8?B?QnhuUy9iUTEySitZalFMVk4vTTRUODhLYjl3bjh6RFhwenZVS3RRZEJFMnJj?=
 =?utf-8?B?dlpSbzhSOXF4dW1ITHh2aXZaa3QrUDYzdEhyaVBnd2I3Z1k2TStpQ3I5eG5u?=
 =?utf-8?B?RjkzaFhseVNMaThlejQwd0lGNVN3dDhTZFM0dUM2V1dWZ0lQeUthMmpuWm9s?=
 =?utf-8?B?dGYyMDc5alEyOXdLemxPM0l1TlpUblhsK0FEeEpXcXVReW5XM1VjVGlTRmZG?=
 =?utf-8?B?TklqQmFSV3hQY2NlaXFHWmtleU9yS3hoWkVzK2d3a25sVFBSR05lK3hpcnFG?=
 =?utf-8?B?QzNWZU1UaytFL0tnUUZpZFN4VG9COVBWN0NXU1VIYkE4Z3JmYXB0bFlEdmVS?=
 =?utf-8?B?bTc0c0tWaHRjUU1mT1pZT3k5blpqaVBlZUlUTTBqM0Z3WEdPNm9nSERkS0ph?=
 =?utf-8?B?WGhzWTNzanJJVTRvVDVIa1U2dUZNRWMvb1I3RUNRUzNvcjV3c2gzd09kcXpr?=
 =?utf-8?B?Y2k5cVFxSTdWTFdRQ3NhVmdiVitESEFUa2R1MWZMQkNLZ0tqTVNtc2F5NjlQ?=
 =?utf-8?B?ckxMUW00RGRGeUptcmVsSUNoWjk0ckNRdlkvanBoVU9uTlBHVW5rK1dKTDFD?=
 =?utf-8?B?NEhCODlYUTV2Z3lhWW1LajBabjJMeFFDVkR4R0hlQXdRZFloKy8wcTZkV2lr?=
 =?utf-8?B?amJtbmM3ZWtwNDcwb0JpUzBnMTVISUxldDJnd0dVMFZ2WkRRZzJ0YmVhS1cz?=
 =?utf-8?B?WEFLSzluOFAxWXZtbVFPeFRORERodWdyZ0JIMG5ZRS9uT0Fvc0tLYXNNZWJ1?=
 =?utf-8?B?TVY4L0toek92bUo4b0xUd25LcC9mTHhtV2NBb2tzVllLdjhXV3g5QmFwRmlO?=
 =?utf-8?B?KzUxVzZ1Vm9Gc2dlMFJYLzNJekhKeUR2WGozMVp3VU1vQTk2T0VUT0ZnS1NR?=
 =?utf-8?B?YmVpcXlLN3EyQVljYkE0SkEyNzZtZmU2OUNsL21Rc1NJaERmUEY1Qm5JSUpO?=
 =?utf-8?B?dWVvNHFsY3FvUTd3TytlVVVIeTVwVTMyQXlPdzBiT2Z4YmlScnVuc1ZqR0tT?=
 =?utf-8?B?d25PbkFHVm1pc29Zc2crZHprb25NbWliVlhOajBnUjRyczdCS2dKR28wRzJw?=
 =?utf-8?B?ZTVwby9nRWpCNlRGS0JQL3hDbkNDRDZKa3RoRHZWTHJjNkpmbjB2TnB6ajBP?=
 =?utf-8?B?UXZqSmRaSG5kaDNEUlNFR05UR3AzOWkvSjR0bUFvVUx4cE9FNTNYQ1VESFBQ?=
 =?utf-8?B?Y1V0QjVJS0hBVnNvWDRkcEhmbDNXR1Z5QzY0V0xyNVkvMmlVbUVEcEg5SWlj?=
 =?utf-8?B?ZkRmb08zRjc3MUNseEo2MEd4Uk1yVnZjaENmV3dOUStnbDlNOUd2RGxYaWxR?=
 =?utf-8?B?RmYzaDdtbkxhUElpNFI3bmFJTWtwZEEzWS9RNGV5Wi9PQVI1ZWJSWWZtdHcw?=
 =?utf-8?B?U2wyOWtPaDMwajZZQytVUlFFNCs4S0h1Tm01WGpKaE5uQzlvUy9DZEV3OWZX?=
 =?utf-8?B?Unh6bmc5aGpBYk5Vd1BVTGRPenVVWWNYTy9vRkhmclkrTE9EUUFYSjFSdlAw?=
 =?utf-8?B?blVCWWtjaDZKdzhPRkNjT0REZEw3M1BKR3hmYVMvSGZDazRQVVFpbmVKYTFX?=
 =?utf-8?B?Qzh0dXVnZW1uVUNSRkVld3FsSTlOc3htaFNiNVowY1MyWUhTL3ozanl2Mk5J?=
 =?utf-8?B?OUtIam1qK2E4dTZad2txQXRKbmRSVWZmRzBOUEdVcys2UTJINXpCT1Y5a1Jq?=
 =?utf-8?B?MFhwdmUwQ1FmUldWa0dHaTgwSHFyT3AyQlJmckpBdG8vSXAwYnpVWUdpdTc5?=
 =?utf-8?B?dEl4bHhjcDJRczAyaGhJck5rNTRPQ25BR0I0cjZJanVOVjk5VjU1YUlCbDVl?=
 =?utf-8?Q?ra8JqSnELSnoyp6SLTnBr+H2SSdeUBUh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUptQ0kwOVIxeXVOTlAySUo5NTd0SWV4U3R3SEtneU5xTW9PY1NZSnJBbFBz?=
 =?utf-8?B?Y1lDblNhYkxaVFdhVzBhanBrZHowQkxiSjFEaW51QjVJZGVveHB5Z1BOM2dO?=
 =?utf-8?B?NXBBeGo5dGp5a0ZwblhMTVB3QzlpZkhtQ2M2SmVDc1pJdjN6NDlZQzBNWUFD?=
 =?utf-8?B?enFJWDlWdlMyVUVpbFphdG8zZjk3ejhISjVXTVRpRGhHd3NCY1oxeG1XYXJD?=
 =?utf-8?B?OTRXcXIzQUJXbTMwWmQ1SDBNUW10VUt6RHFwakUwQVdCV3Z2cDVwVE9hb05x?=
 =?utf-8?B?WDQvaGw0NkpOZEtHNG5rQWR0SjZFMDc2eUhDQUt4SmR1U1VwTGR1K1lGTVRr?=
 =?utf-8?B?dkpnQlJ0Mm9rSkhIOWNSSlRhR0dLZUhQOTdWZjdmNU1EMW53bkYvRjhaYUFE?=
 =?utf-8?B?R0NSU2lFdjlUcTNYRUl5ek9lY1Q5eXRmak8zQ2pXbUVGM1h0djlBelBKTGtw?=
 =?utf-8?B?TSt3WXd3eFNVUXJkMzNQV0JSUC9EUVdlSWpsMnRib0hCZ3J3VVJncm9Md0tP?=
 =?utf-8?B?UDZGMTNVOURIMG5SaFFnY1R5SkV0eitGTHVDMGVJbTBQSEg5akVVN3ZPamND?=
 =?utf-8?B?NGFzNkdwWjU0cERvbTk0RDdNakYvN0JtbHdwODJaZUtVa0h6VGdXWWY3MEVr?=
 =?utf-8?B?ekdDdWlONENKM2NxZHNwYW0vQzBNMXZkdUYxVm8rVDVNTGhNWUc3L3VXQU5s?=
 =?utf-8?B?RXpDbEp0TXVqaXYzeHVZUEJkaW5OUE5VVXlCNmE1UTFJbFVhMTdzSmFiYXFz?=
 =?utf-8?B?bEw2U1E0eUV3NE1tRTBzNEtOOFNXbnBrMEw4eklMdWJWdXQxV3JDM2FUY0sv?=
 =?utf-8?B?MXV0L2xzUkNOZFFVSk1mRWlSZkZCQ3QyWS9pTUVjNk52cXZac0VJTnFlOUpK?=
 =?utf-8?B?aExrV1BsZVBWRFdsbUxvQ3pOV3pLT3hadkpxQnZ6bTYwZmN1VWhpK0diVUZ4?=
 =?utf-8?B?QmZWQkdYUTY2RzRZYkxVRElEU244REtEK3hrUndsbXdEazF5dlFIZU9uajBr?=
 =?utf-8?B?RnQ1MnFIMnVvQytIaFhyekJ3QUhRbFdYR1UvU29NMzBBOURKL1JlMVRYSkpX?=
 =?utf-8?B?QVBPUDlxYjlQR2FEU0dzdWpvUi92TVpQVktWWDk3azJRbzUrSU9BQnNsQ0Jj?=
 =?utf-8?B?OUhmZUdJOFhOa3dvaHYxaXdnQVRUMFdHZmlSRHNwZHhScHhxajh3dXlDaitq?=
 =?utf-8?B?QTBoek9sQkd4by9iTTR5TUhrdklwVnMzVzNBQ2trODlYZDJiSUxIV05qZ3BN?=
 =?utf-8?B?c21HZmtvZFJVS1pUeVFKNnRYdm9LOXZXOVNoV2VqY1BBeXovd001NVEzZkQ5?=
 =?utf-8?B?WXg2Z3JHWGdkRjN3NU5HRHl4dlkzNldtVmRGcmhUcC9UaDNtazc0U2JsTjl4?=
 =?utf-8?B?RXdxRTYwdGh0aTFudVorVmZnTlZOa2piSmdweFVVMWFDYWF5NjB1b280aWNp?=
 =?utf-8?B?VDlENUtHMEcxaXM5WFlSaDBpUUFTa2hEOU10Q05INGhnMjIrQ3NITW0wT0ZR?=
 =?utf-8?B?d09DWjlnNXN3WWNmUHNuRFNWNHV3WldzNGtqcUhneElqYmZRY1laTm1Sbmcz?=
 =?utf-8?B?c0orRDlZN1FaNVhNQU5OTXEvSE4xeWdnN2R1dFpkMW00R3M4ajF4V0p4Z3hI?=
 =?utf-8?B?UndDN0ozZ09uN1ZCSHIrbU1pRThHZ09DZS9OMWhRSXIvOTNwMEx0QWtwRi9Z?=
 =?utf-8?B?OGowVUZ3RWpDQUVwRGVzbTJobjRvUXZBdGlmOGt5VXk4clRnT2JyK2JqQWtP?=
 =?utf-8?B?SDZacWtCT2RQM2xsK05ZYUpISHBGZThFWEZyZGRwSnlWS3R1YVNkK2RLRzRZ?=
 =?utf-8?B?UkhPZDNPaFM0Y0QrRFY1VEZiWFBDWTl5eWdwRFFHY0JJZmd5SEIvWGI4cUdP?=
 =?utf-8?B?UEJoSFFRemJ3UUFldzN6THBQcys4S0h5SzcxZm03Y1Z6TnlSRUNXbmROQkt2?=
 =?utf-8?B?YVNicHNHQ2lwaUMvdUErUm42aVNrektqRWpBSEZoelM1WkJEM0hnWDJ2eHNF?=
 =?utf-8?B?NE1hbm5GRlg0eEs2OVdZRXhsQm41RUdJSjYzbE5QK1RTbXNQK2Z2Q3ZnN3Ra?=
 =?utf-8?B?eExtTGFmT1J6aUQwRWJlZS9LTzVUanhObWJIQlcwb3BKOUZNVVFwd2pyQ293?=
 =?utf-8?B?bjFjYUVndUIyN1A5TWhuNjR2aitrQ2hCTGJveUg0TUtLV2lNR0tHYjZ1cXd5?=
 =?utf-8?B?MFpqcU5CUUZlSncxYTZ2cHVRL1lKSER4Z05WZXQrbER6T1lvWnpqSVlvVjgx?=
 =?utf-8?B?SnYxb0E2cmQvMHZzOWNSK2JwOUszZjNFdUtpdXNwUUpYSm1wVk8vMlhkbEto?=
 =?utf-8?B?NTBLMnpKekN4K2hON0t4Z1NDVFI1QWdySEdTcG9SN2c4US9NeFBvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a213ff-4fab-449c-3358-08de4d7e595a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 23:50:19.4869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WrIYYQqda/y+Ti4/MSHvD744HMzM2bR2TsbKdU3n2S6Qns/jfYSr0YMgr8a/PMigmEIMxE/LuNnPZ5pw1zjbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> dm_plane_init_colorops() allocates enum names for color pipelines.
> These are eventually passed to drm_property_create_enum() which create
> its own copies of the string. Free the strings after initialization
> is done.
> 
> Also, allocate color pipeline enum names only after successfully creating
> color pipeline.
> 
> Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in DEGAM block")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c   |  4 +++-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 13 +++++++++----
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index d585618b8064..a2de3bba8346 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -79,7 +79,6 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   
>   	list->type = ops[i]->base.id;
> -	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
>   
>   	i++;
>   
> @@ -197,6 +196,9 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   
>   	drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
> +
>   	return 0;
>   
>   cleanup:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 2e3ee78999d9..7c4496fb4b9d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1790,12 +1790,13 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>   static int
>   dm_plane_init_colorops(struct drm_plane *plane)
>   {
> -	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] = {};
>   	struct drm_device *dev = plane->dev;
>   	struct amdgpu_device *adev = drm_to_adev(dev);
>   	struct dc *dc = adev->dm.dc;
>   	int len = 0;
> -	int ret;
> +	int ret = 0;
> +	int i;
>   
>   	if (plane->type == DRM_PLANE_TYPE_CURSOR)
>   		return 0;
> @@ -1806,7 +1807,7 @@ dm_plane_init_colorops(struct drm_plane *plane)
>   		if (ret) {
>   			drm_err(plane->dev, "Failed to create color pipeline for plane %d: %d\n",
>   				plane->base.id, ret);
> -			return ret;
> +			goto out;
>   		}
>   		len++;
>   
> @@ -1814,7 +1815,11 @@ dm_plane_init_colorops(struct drm_plane *plane)
>   		drm_plane_create_color_pipeline_property(plane, pipelines, len);
>   	}
>   
> -	return 0;
> +out:
> +	for (i = 0; i < len; i++)
> +		kfree(pipelines[i].name);
> +
> +	return ret;
>   }
>   #endif
>   

