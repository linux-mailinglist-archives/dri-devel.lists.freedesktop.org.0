Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B899AE34A5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 07:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D82E10E152;
	Mon, 23 Jun 2025 05:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0v+UF6J6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B70110E097;
 Mon, 23 Jun 2025 05:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKhOWa/mySsX0YG1p0y3//38BzIJ4g2o7QMrAcZCXyp5B1s8KVsytlZEpxrSsk8vTZFzKYe4For9IFRvAAlF6fDnue7FqvdH09fTjs8XinAbOa5LU/nXOhUNh26HVbGzoSYRz8r7S/ktsoo6VGUq4H7rm6hWNYjxqm786HriyOizzTTxWb8hTES09lyVyWpwN38dhFob4NuBrbFPAa39+tPgjj7q5eVA1dPIZiA+Tmuwc3y3cTeaTO9RmqQzdQgmVN6mlG5n3tkmsI1YVzz5HTniCwOsPkXOOpg4rlg1KvYGIeFqCKLCWScjMznMeRnKsVHNybk7sWxmdDkr0fG8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAkKEvC+3sRzypnLRH1ginq+8gEvca6X5IiGESIR86E=;
 b=BewlPoMPRL0okf/eIAjuTFPulJYw27tC4nkm9QNjZ+tJKVO3yECWdzrf0/tzpatVFfEa4bQziYUh5Ewwh9164xcWbj3GXyBTF9jiAjnQZ0T2n+XqPk1m3YutKtVN0uwlRTD8hx7PWf5yWkTKOfSCxEJsJniHPefLWZnMMHJ/SweN8hizrC3bTB4Z/J1FsWXY7m6EfFimFpoRVxYDL2rNpfXDtuteKxgitUZLn+uaWO3lyPWixmdd5+h4LyvOxgx/HcrMCkxShY6lRe5/bGdu8f1PywTVeL7Xzyn8bP3MufQ8dYjHciCGfYbmf8gmXbWB0wDJ/mJnnWZ3m9Z1EX+Asg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAkKEvC+3sRzypnLRH1ginq+8gEvca6X5IiGESIR86E=;
 b=0v+UF6J6jI+TOBrtbYRgRV8cdWlO1N0bqsbzv+/SetUkq7pHoM+IJzhwJDEbxZO0ZpAXrPg8I2Gj011vvTlzOnNgghM8VYRpDtT6Wk7tWTeqMJtDJTweT+sg6jNPTpciL/pXyBAWhz/iAUDsEQDiG9EKtJaC9beINXD3074ECqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Mon, 23 Jun
 2025 05:15:22 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%5]) with mapi id 15.20.8857.019; Mon, 23 Jun 2025
 05:15:22 +0000
Message-ID: <4e2fe964-0f97-40e7-9825-84818fa15562@amd.com>
Date: Mon, 23 Jun 2025 10:45:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] debugfs support for pt base for each vm
To: Tvrtko Ursulin <tursulin@ursulin.net>, Sunil Khatri
 <sunil.khatri@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250613071537.701563-1-sunil.khatri@amd.com>
 <2e76cb27-ef90-4da5-a10d-5c1ac20a3d67@ursulin.net>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <2e76cb27-ef90-4da5-a10d-5c1ac20a3d67@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|DM6PR12MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6a9654-38e3-428a-e6c5-08ddb214f43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEpVbWRia0FEb1lNWW0xemloYzdNS21tbmJJWW5jMUFGYVgydWordWQ3WTNS?=
 =?utf-8?B?TW9aeldQRW1VU3VGclBudDMvVHFSZEJDcDdnaHpHUE1xT0RFS21CaEdhSi9u?=
 =?utf-8?B?UVVhUFVGbzhEczNiZllMTTFZV21uTHh0YWhUVGlDbVQ1OHk0WlV4ZzhSbWFn?=
 =?utf-8?B?bVEzenpod3hxMTk4SEo4Q0wwTjZZdW1Xa3NwSXJJL2tYMGJycCs3SmdhbGVn?=
 =?utf-8?B?VXBUbVV5dWV0Y2NLbHIwNTZERVUvV0FNeWFFU2d0TjJEVEcwa1FkcnJOWUNW?=
 =?utf-8?B?U2JHdmwxRTIrdFR4MVZ5WG1KQnFacS9jemp2bFJoRzJNcUlDUGZQa0hjMmp2?=
 =?utf-8?B?Nk90a3ZORUJHaHdGa0hjekhURjE1M2tFRm10My8ybFl5OVcvc2IvMDFqbUZ1?=
 =?utf-8?B?ZThxNlREZ0cxVms1bWl4SFFNMThDUnkwQWsvWXVISlBtTFZTNnVlL3hMNXZC?=
 =?utf-8?B?NFZuU2FxSjZtMnJhbDc1UmJFQVQvRHZ4WVZpMW85eUhZa3M2RzFvSDlicFFp?=
 =?utf-8?B?RkFMMjZRbjhhRnZmT0dqeWx2OFZKcWtEN2gyd09RRnhSZmUxQTdLd0FWMlVj?=
 =?utf-8?B?M3k1Q083Q2kyNEZxVDRYcUZjMGQxbGtSRUtUaElabWdGWG9ub1IwaGVoaGNF?=
 =?utf-8?B?YnNKM1Q2MEhERXI2VUNVMWhINXM0aEdNTm5JTzVPTGo2SnFYQUhBZVIzZGlz?=
 =?utf-8?B?c002NkRqenFBM05PT3YvOFRoNGF0RTNndGFBbjNrUERSN3VmTEsvekZPTUdr?=
 =?utf-8?B?eFM3bHYvT3ZGRGh4dkh2b2tXcytkdDVHRm90MEtpTjhmYy9sTVpGME00eXpv?=
 =?utf-8?B?NGFTOUxPR1BJRWh0STRaM3lBNmo3QVpiK00xOTJ5QmJwNmFjUmtXVXJMVGhG?=
 =?utf-8?B?RkZSTno4L2xhOE8vUUpuZmM4ZnJYbHRMcWhUQlZteTBZQldIL1hPWkxaUWtN?=
 =?utf-8?B?YzRiNUtmN2J2ekxGVkE2aTlSKzVsNFZUcXU5N1E4dXVOUmI1MHk0MExCa25G?=
 =?utf-8?B?VDlHUndCYmt2U3NhK1llSVpHRy8vaXRQcnVXdXU3SlFabHdaNnNyY0E4aDUx?=
 =?utf-8?B?YllHcmtTUVdtaGp0OVVxVGwzNlJZcStHdDFMbjcvWjFKVUJhSU5oZTJ4L3pD?=
 =?utf-8?B?YnNxQkl2T3gwVXBIYXFXNVd3aTZ5VEw0K2ZsZFlnbEgvMHVxeG9HY0krMytq?=
 =?utf-8?B?SVV6ZkduS2FWNmhPS2hZckJGZVhWN2pMUmlxSzhEZ0pwem1iQ1YwUUFLQzhU?=
 =?utf-8?B?UXVWZXk3c1h2dFAwbnYzTU0vMjBLSzhQLzdVK3JMcHc1eXFibFovYTZvZWp4?=
 =?utf-8?B?RnNaSG5nYUJYaStxTWVsTy8wcnFYRGEvclp0dUUrMC8zbzJiTlBSQUNNcjY1?=
 =?utf-8?B?NlFTS24ySFR1RStvei92LytVekk4TlRGNlBpbjNGYTUvRWdNcGVzL0czSHYx?=
 =?utf-8?B?cHpaWFk4YjVVTGVmbnpjbGxPQjBCSWhDc0Y5cjJ1R2orWkdRR0NtUENlRGVp?=
 =?utf-8?B?bjFrNjFjTE5DeDZSSlhZNDM2WWpOYnpNVVBWWmhFOXhxRTRhVGhFTVc0VWI2?=
 =?utf-8?B?VWFHSGVpWFFuRXduVm9xd1hrUzZSRGY4MHRKeFduVm9ILzZLQ2FRVUVkb2dn?=
 =?utf-8?B?WE1lZ1FHOE9oRzE2MnhUdWNWeTI4NDAxbjJQVi9oTGxmWklKMUxuR281by9a?=
 =?utf-8?B?eERobUdZRkRmaXJHU1FyRzJISjJabGNwdEhsZ29SNHlScUgwcU9lVzBwdjc0?=
 =?utf-8?B?N25PVmUzbkJYN01UNEVvb2luUHlVblN5L0g0R0htYmU0aytMSVlxalJ1eFg5?=
 =?utf-8?B?bFh4MWhlNHNLaWhkQjIvUGpnSVg5NG9md2RJcU5NRmdLRGdnSmcyaEp1UkJ4?=
 =?utf-8?B?UjYwNVUzZlRMNzJ5NmwvdUJncVU3a1hTVXFUY3FZbDRnY21Oazl0U0NWc3Zt?=
 =?utf-8?Q?0s0R18iTkH0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXBzUlFoMU5yaVYrUFhjL3ZLcVR0OVJCWmxOWWJVVVJKMnRYUXQyVGVONTNv?=
 =?utf-8?B?c0xIbWpsQWlSY25qYzRvVEp2T3hLMXd6Umcxdm5qUXNDWm1IaUtGVXhoYitz?=
 =?utf-8?B?OFNsbVBVRG9zSWFRWFpTbi91UEJHUTZPVmZNZk5LeXBpa0NvaUYwQ0VsanN6?=
 =?utf-8?B?akkyRkFySU9jSDl1RkRxOGw0S1FRU0o4aTdSWnd4UWMrcVdyZFVMT1NNcEZ3?=
 =?utf-8?B?Nzc2VUlxckt6RkpKWnFleVZKNzNEd296WUlFUEJxVjc2TytYbnZWaGc4b0Q2?=
 =?utf-8?B?VnFaRTBFMmNJY2ZxUU5hanRNQVdqWUVUOVhHT0JYcUEzMEptQVFGSjhqS2FL?=
 =?utf-8?B?dy9lY1pQb3FHUWo2blcvaENlcFl1WjlrMXc0N1NPVVN2Y2Rub0JrLzVoNlJs?=
 =?utf-8?B?MTMxR05iNkgwTHZkRWtyN2YrbXB3ZnI5aElsbDhnZEVhRGg4c3RuTk96KzNF?=
 =?utf-8?B?eXpmTE5rUnNaRjhLU1RITDhmbWZJUGVuQUU2bHRnK056UHA4UkZBdmFtSFcx?=
 =?utf-8?B?ZGljWmtWVzY5c0prd0V1NmJQNmpLZkl5enFnb2hGWkEybFlvVE5uRzVrK0Nx?=
 =?utf-8?B?QVJBeENFdE9lbFlTOTdaNWNBWi85ZDQyRG5iMnJQTzdzeHNsQVM3dmdCMnFP?=
 =?utf-8?B?QkRTNENhK3RLMWdjbjAxc1FaaVRMZ3QwTHpRUVo1Ni9oTTk5TTdZem84ZXlW?=
 =?utf-8?B?YWpQTXV2cEtkNm9jVUFjT0NOd0dmZk1EWWNLMldVdE4xMkhreGZ3Z0huOUxJ?=
 =?utf-8?B?NGJwVk1PU3I0eVhabzg0Qm1BWjVIa2FCeEZrNUJrRTdNN1owbVBzeDN6OS9o?=
 =?utf-8?B?ZEF0MUR1ZHJieXAxeGpFTDFkdnV2VVVya3Zod2h3OTlkQ0ZNYTVJQktpa2Fz?=
 =?utf-8?B?UFgyMmQvdytQbEVtZ0NlTHZ4cVRFSVRhdlVwYnlleFZESjJSSTRsYXB2SkdB?=
 =?utf-8?B?WTVDV01UK2x4cS9pR3I2dGtiWU8wL2hxV2c2SXBKZld3MU9objNRVnZjV0hX?=
 =?utf-8?B?d1J6Umh4djhZTnBnR2k4bFlYeVdnT3ZJWWFJSFc1d0VFQjZPSVVkZ0kwZC90?=
 =?utf-8?B?OEN0K3ZrVWYrdTR0ZFF4OW1nYzNQSWpBOFU3RXUwNTN2N0lScVBvK3IxOVhl?=
 =?utf-8?B?dUdWOTUxVEdNOXkyN2pwZlhHUGdNWGMzK2JxL29HbUJsRjh3WldoNWEza1JT?=
 =?utf-8?B?d1NmalZqazQxejhVLzkyUTlFOUlpTHFRdzFQQklEY1BieHZIbnAweWxWZUVZ?=
 =?utf-8?B?RlpDZS9JcUVKZURBODhhRVJLZENtUHU3TUcrR3VQVERSTlNnOEJTTEc5UXhp?=
 =?utf-8?B?UGtjdERONXJHQlJXQXFFcTBLWlJBbFM3T0E5elNNKzJNVERIRnpDOTFlcjgx?=
 =?utf-8?B?Z3h0TnFjeDRONy8vV0JsQ2VNZGIzVFRpUjdvbSs3NVgraDdKN2Z4eDVIRWdj?=
 =?utf-8?B?cURCdEtucXhRSTg5WHk5Tm9BWHJlZGpidVpqKzd6a3FPMHMwTnBFQURVN25h?=
 =?utf-8?B?RCt0ckt0aUtwZmlKaXdGTTZsOSszQ2pmUVhxbmprUjI4WlJVUzVBQ09KUDBs?=
 =?utf-8?B?ZitkVVlERFRmVXF1VXlIY293dzRKR2JGMkZuT0doQXF3V3gyUzBsNEtoeFNR?=
 =?utf-8?B?Z3BaSlRPOUdHS1VlVFI3R0tyMUdLaDNUV09sZThIcmhWRzFJb2M1ZkZQZ1Jv?=
 =?utf-8?B?bEdHOXg0WSttN1l6QWN5UzRoVVh2SzBrRVV2cTE0eWZtYm5kT3ZnYnpId1oy?=
 =?utf-8?B?cHl6SDZLN1NvYUlwRFZmMTg0dU1Wa0cvUGxXL0hTa1czS1grTDQrU0g5MStp?=
 =?utf-8?B?cnRFb1E0eS9tdGJIRnF0K04wczcwVTBJRVV1RUxnZXI1RHQrTEE4M2Ryakpj?=
 =?utf-8?B?RzdDWHFJeUhqOXk0bS9uOFljeHlhTlZ3QXJLTmZSZEU3ZE9iTHJGc1VBaVhs?=
 =?utf-8?B?NHVpUjIzaDZJd1R5T2w5VkpuVUhxVXordURqdVVvSXlXcHNOR2twVHRMZUgz?=
 =?utf-8?B?ZGIyd1FMWGFLUnRZVUI0U0ZnRi9zVmFpNjdyYm9vNS8zQyttMlBEZ0RHbzc2?=
 =?utf-8?B?M0k2cEM4MDFPd1JteVVUeUFRd3dHbnBjR3VHaGM2YzRUbzdNTGNBR0tlbnZz?=
 =?utf-8?Q?jg1aLJqDLz2GYQo1/Tab3rxHJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6a9654-38e3-428a-e6c5-08ddb214f43f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 05:15:22.7735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Jn987Ex6Rvw2zhQqFTJYYk/7WEb4eM8xjYIhHKGnIx2kcRTjK6aFvCXjBZcTBS3voW9V3EeqBZr6WfoDy3nkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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


On 6/20/2025 6:10 PM, Tvrtko Ursulin wrote:
>
> On 13/06/2025 08:15, Sunil Khatri wrote:
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/clients
>>               command  tgid dev master a   uid magic name client-id
>>        systemd-logind  1056   0   y    y     0 0 <unset>     5
>>              Xwayland  1733 128   n    n   120 0 <unset>     8
>>       mutter-x11-fram  2048 128   n    n   120 0 <unset>     9
>>              ibus-x11  2071 128   n    n   120 0 <unset>    10
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client
>> client-1/  client-10/ client-2/  client-5/  client-8/ client-9/  clients
>
> How about making clients a directory? Ie. in your example:

This has been updated. Could you please review the V4 patchset and may 
be soon there will be a v5. There are some changes already so request to 
please have a look on v4/v5.

Regards
Sunil Khatri

>
> # ls -1 /sys/kernel/debug/dri/0/clients/
> 1
> 5
> 8
> 9
> 10
>
> # cat /sys/kernel/debug/dri/0/clients/1/pt_base
> 81febf3000
>
> Regards,
>
> Tvrtko
>
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
>> client-1/  client-10/
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
>> client-1/  client-10/
>> root@amd-X570-AORUS-ELITE:~# cat 
>> /sys/kernel/debug/dri/0/client-1/pt_base
>> 81febf3000
>> root@amd-X570-AORUS-ELITE:~# cat 
>> /sys/kernel/debug/dri/0/client-5/pt_base
>> 81febe9000
>> root@amd-X570-AORUS-ELITE:~# cat 
>> /sys/kernel/debug/dri/0/client-8/pt_base
>> 81febdc000
>> root@amd-X570-AORUS-ELITE:~# cat 
>> /sys/kernel/debug/dri/0/client-9/pt_base
>> 81febb2000
>> root@amd-X570-AORUS-ELITE:~# cat 
>> /sys/kernel/debug/dri/0/client-10/pt_base
>> 81febaf000
>>
>>
>> Sunil Khatri (2):
>>    drm: add debugfs support per client-id
>>    amdgpu: add debugfs file for pt-base per client-id
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 14 +++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +++-
>>   drivers/gpu/drm/drm_file.c              | 13 +++++++++++++
>>   include/drm/drm_file.h                  |  7 +++++++
>>   5 files changed, 37 insertions(+), 3 deletions(-)
>>
>
