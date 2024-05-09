Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7235C8C1550
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 21:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E237810F0A4;
	Thu,  9 May 2024 19:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GuhhmrFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386A210F090;
 Thu,  9 May 2024 19:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEBzsmYEwNjUj5OjTwwV8TW7btDxIB8BlJXWbJAO+0DACzCwG3q9/wtFDS/sZddS8ob2e9D5u+0FCWdjZhK5tnJgbt2X58/1ETuAJFKeeiLi65qtErN+k6/hR8iH2U2hbvTwuU1O7wOP3kSwH8fuY9BjRayKUw7PumWe5N5vQl9oIE9OlQX1cvmZBPiGuWoOXqAzDR6eyqGxJRVyxBw+OPWzwqcpd0RkgL9SImXUHoJylMRArr8rf3+l60qDDf2sIJ+0G6kUEUcxo8BYhsllvv4DDNVc4+aqG4OSQpf0AIEFP4rX+lNQzbIfZPZRLYGp3RS7qOZMCsh+w2UeNK5PtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psNiJ734FFTXd4gcZuUyNX5S6Eq+mdQVvsQVHWQqTeA=;
 b=VayHAimNoInXv0LlEq9gKZ1rpQc5/3mnfwupM5vdY6ZjEFG3pUBa1P8j5cLlq7kX8IEleXHOTQqAGFvo+zD4Et6lwOx5dC9V4KEHWp+uqtWqzzvZF40m7xGDIsqPM4MVbE1i20T50wsp+/dIogS04m9BctdxUGdTFq9i9xnbCKFkpcNm302v6k7pqV+0hcoIxNzZXKg3bFEmfok9c0dl1nTLyqnNKocH1Ne8Ppu8jg/X8VcjTe7v6AD8vO2J5VGZG1k8+Knrpg0Ia09+3lh4drlq5V56t5kFA9F8P4DxC9fFzUa4CabXZDk0K4KaW63GnvS5XU3ADC8imxcwEbwcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psNiJ734FFTXd4gcZuUyNX5S6Eq+mdQVvsQVHWQqTeA=;
 b=GuhhmrFr4u/qq63cV/o0kDBgrqM70bJRpwPZK2Xcq42ycYwyFjy9S8u65PM7Ew09wvjg7ybYc/lrovBsrEUrkgXne/FNcHIDiE5Ol83pG2LaOt/k4jTC7WJn/Eik6vTjr0jKhPvt2b2Fc5b2pWAOsNb2Tc+4sKroI1ipMZlWPMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 19:18:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 19:18:05 +0000
Message-ID: <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
Date: Thu, 9 May 2024 14:18:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Harry Wentland <harry.wentland@amd.com>, Wayne Lin <Wayne.Lin@amd.com>
Cc: lyude@redhat.com, imre.deak@intel.com,
 =?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
 <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
 <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c38677-2067-40ab-66f1-08dc705cc078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTQwY20vVUgrV1dwSCtmYzBWKzZtL3NSTWtzS0R3c2JCWTVSS1d2VWJseGNW?=
 =?utf-8?B?aDhydlZWMkpTRFVtWGFOMVBrR1FwNzhqUWRSRnNGZ0o0NC9wWjliNmh0anlq?=
 =?utf-8?B?RmRsZ0dzcE5yRHlPTnNoQ0NlT3VUZTBBVGVpR0E2UklpNjljVmZ2WEhCS3g2?=
 =?utf-8?B?cEJNTEc1VEZFdFg3c29ab292UzVvZDUrNmdsOWREdEVqcHRlTmxwcDYrMER4?=
 =?utf-8?B?ZTY2bW52NkNZWmd0SGZIck1iSG9lMENMK1R0MzhoRFluU1NXODZ5VXRSU3J5?=
 =?utf-8?B?YVQvWWQybWlQQStGbGpRbHh5enVXQ1lnSWlrQjRYUlpmOFVuVW5JajRaekd0?=
 =?utf-8?B?MzdxVVk4dS9USm1pbGF1WERMS0VwWVdNeWtNMVJST3BGMGw0YTRmSEJmQXFp?=
 =?utf-8?B?YnJZMTZaYWlRL3ZmVC9MdjYwK3dUMS90SnhXWm45dzF1bUt1cGs3V0Z6bVBB?=
 =?utf-8?B?VXdrVkQvL1dHWDEwcVNkeVc4TDZXVzRvVklLMmVRWStOVG5LQWloNmljYUJB?=
 =?utf-8?B?YTlMS3VuYm1JOGFINWxqUFM1UkNMOHFwZGFMcGJhU0d3cGhOYkZiUHFWMlls?=
 =?utf-8?B?UDM1eTlOcFhiSHM4TkkvL0FjTXJLb0NWdW9zcHFMcnJqRXY1NHMyWWR6UE5x?=
 =?utf-8?B?LytIMXQvU3lGTUJ0VmdmTmw2Rm55SHlLVFJ1bW81clNQZWhGdjhUL0MzK2RS?=
 =?utf-8?B?T2V1Y2ExREdDV2hnZEc2R29iOEh4R1k4OE5NbllBNHppUnI4TS9QbFZWc1JO?=
 =?utf-8?B?TVlSSzNwbmV4Q1NhaS9DZjhaaGxHVENkQkMrSEo4QTFIUzZwLzBMcXY1Zmp0?=
 =?utf-8?B?cEFzN25mYlRualJXODhTL3hDT2ZTQWFCMVM1ZlRJUCsyRXVUWjFZSWY1U0t4?=
 =?utf-8?B?dHhjTXdvQWEveWVTQmpRUHBRdW5lZ3pLeW0yUmhKY25nRWdEVFVxUjlsblNr?=
 =?utf-8?B?OUdIODJzOEYyOGcrVC94Z2tGb2hHZ3ZIL3Fmd2tiRmhtQVg1WjdldTloUkRS?=
 =?utf-8?B?MC80WmxvWkRxdVZZTEhZaU5zTmFOL0tPQThCeE94L213YmIxT3lQTnhuSlkv?=
 =?utf-8?B?Z3lTbTNJbzdrRkxHUlBoc1pUVllZalNpa2xxVThzc2RlOFpuZno2TXRwakNY?=
 =?utf-8?B?MEYzL0NlVVIzbUxhQ1lUbWJVNUdpMkxvWVk5ZWRrSDJWSk1UTjRZa01zbTdB?=
 =?utf-8?B?cE5pUm9CMXc3L24zdE9oRWxoaytEM1NSMytXL3BON1pCUnBWVytmRU0yMTVR?=
 =?utf-8?B?bFNZUTN6VllQWU5TRlhUMHdhSkwrSWllWm41Y25KU3NnTEhubnk0eUpnZUtT?=
 =?utf-8?B?TVZqOTY2cEdIcndsZGFEUHgzcFVyck5jWWxER0Y1KzkrVDVsY1JOY3IxQzYy?=
 =?utf-8?B?TWNvakJTUDJ6dWJIZ3h1b3ZxMnFrbTZXMFBFUW53MjlWbzM5YWIwUHJoV3Rq?=
 =?utf-8?B?dkhHMTVMdDB2YktpWVNrRXNVdnZveWtCdHR6cjVDZ3NuS3oyZkJTMCtaTVps?=
 =?utf-8?B?M0JNWVNmNVBYQ0taNVNzaHIyZzNNRVBlMWZiU1J0WDRsT0EveWQ4eHVlakZ4?=
 =?utf-8?B?NUplcjZ6TnNFSVc0RWt5TE1CQVRWN3NsZlRDaXRFTzYyU3VaN1NEdnRRSEhI?=
 =?utf-8?B?YlE3MWtBVldUSm5KTUsvQ1BYeVlmRXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEpWZzJJbXgyVkpaMG8rNjdxd0JuUUt1MUx0OGI2cG1EQnhhUWM5S0tEOE9B?=
 =?utf-8?B?OEloRkF1dkdDVzROYlFHclhITFZ0VW1aazdvV29adzNSWHhYclEyWUFxRXJR?=
 =?utf-8?B?Mm8vU3pPbzhvTHJPTXRUOUNNNU91WlJnQzN5VGJTanQyQ2pzK3dSMHRrZFpO?=
 =?utf-8?B?Q05JS0l4RkkvOWs0dGRyQXRNZmlLYUErdHA5S2hvcXBWMFhxRG5QaUlCRXFR?=
 =?utf-8?B?MURuYkNVc0Z5WFVBT1N6bk1QeXVKbDIzVndxUFZneENVbGd2SHBzU2txa05F?=
 =?utf-8?B?cktYUnBKMS9CbEtDak0zMmtDWnRVamYxc2VnUHJ2RHZQYXh5NStUeXdZWFRo?=
 =?utf-8?B?QlBtZmdDN2lsOXI3OVVvVktYSjZUTjdGVjRqbElMZjh5emlZM3RpeHFYN2dy?=
 =?utf-8?B?TmhaSnBSeCtqOWt2M1ZTYURxcy9OTy9uWFRyU2VnQ0tJbTJRcnVmSlBKU09k?=
 =?utf-8?B?aXVxeDdVWld5SzdNNVVRRFJHRzA0K2V3TlVhUlpySHNrVit2TnpTNEFYanVQ?=
 =?utf-8?B?NG11MTBONlZ5eXo5WVBydUl2TGVCRExkUi9JdW9oUmtIeUpuWS9reVBXeVhq?=
 =?utf-8?B?emx2Vjd5UDh3NDliYTRycGZKZWZjZ21BOVMxc1ZudUl4UFVXLzAxVXl3dkhG?=
 =?utf-8?B?WDhuRkhaWUpCY2gwSnllWm9meTVpR1kxRllsTnMybkpKSm0wSkpJdGdoK1lz?=
 =?utf-8?B?eUhjODdMSXFHdHlVMlU2WkpWM0hxU0JVMy9DaFBkSjBwZ21OR213U0lGSGtH?=
 =?utf-8?B?Zi9BWkxsWWRYUEdtYWVnZzlxSlU1cWRvb1d5S0pFMXZ2aUl0ck5zY0xXOXpw?=
 =?utf-8?B?WWNxbHVjWjhXS28yZHhnTDlwcFhEMDdFZXM3b2hVWGhPZmVUVlpEWjBXY1J2?=
 =?utf-8?B?ZldFbi8vQ0QwWUxoWXdIcVJwN0FjT3FNd3A1SkpBRVhTb2l0QVhKQkY3cWg4?=
 =?utf-8?B?Z0ZFZ3E1WVZuSFNHUUNHb3M1bXVMY1NtRmdrQnZVNVVncUh2ZmV1dWdPNFRV?=
 =?utf-8?B?eFpCekhNWTJ1cHpvMEZMMWNSRlRSaWVNbEF4NUhCK1ZEOGtVbmpHWnphVzk0?=
 =?utf-8?B?U3JHaDYwOE5taStMRWZSVDVZallneUFtd1pabGZpcU5JU2ZFeTh5T3ArcUNK?=
 =?utf-8?B?azBZbXhyNEs0NHVIcnVQaGs1V3JBNEoyN2xyWkRjaTBPazQ2UUdlcFdpZ21q?=
 =?utf-8?B?dkRNcXVlWDJ3OXhtZDc4Nno0T2JNRjY4UFpxenk3Q05OVDNIK0psbE10eXJH?=
 =?utf-8?B?Zk5tRUJ5K05FalBtSXdBWXVmRjBrNUQ5M29IaFRFaTFGTENrbDUyUjlTNXV5?=
 =?utf-8?B?MkJEQnpWOStwcnJvNjYrTm45YXY2alBKMVp4ZjJEVHh3emJzZ0NUYy8yOE1o?=
 =?utf-8?B?VldvRWhsQklhN0ZiZXZaM1I3Yk1TSERnRllycVo3Q1ZVRFBjYUsvQVE1N3VL?=
 =?utf-8?B?SXJQM3lpVVZRMzc4c3FqejdOMlZuOHkxb0ZiVjJiWVJjZkRnemtVUzFlSmtH?=
 =?utf-8?B?V1hLZzVNc3dIMEswS2NRU29ITTY5RlE1RHR0VzY3NEEvR3Q3RWhka1loclN2?=
 =?utf-8?B?NHRKK29EUXlNeTFDTE1aYlE2clJnZFJxYUtwc0UySitsVHpPOTdaSHNZbDIy?=
 =?utf-8?B?aS9TNW5EV2FhdXBoVmpOanpLemhkTXM2TG1lS0hob0tQM2RoM0R3a1I0dlNh?=
 =?utf-8?B?UE83UktCWm1SWFVHcFBUaEI1L3hhcHFOQjFJTkhmdUErUy84czdmZkNxR1Nw?=
 =?utf-8?B?MUcrbllCS0NRM3ZzNnJNekNUYzV5ZU5ONms0V2gyL00yRWVmTWdzZUJNSEpV?=
 =?utf-8?B?SVN1cDJRQU1YcDloMHRrTytXbWw1d3FWNDc0c0VPZ0J3OTY5OWs3WUkzR1l5?=
 =?utf-8?B?ZlIvRjR2NHJXVDcwR2ZQc2MyTEhmK25MUlhyU2EyYlBEZGZjcW9BcGx0blhk?=
 =?utf-8?B?ckVWcEtmTzBnSmduRU1aYzdFWGtqK2JsUGRHS1h0bko0d3JFNzE5N0NNaVgw?=
 =?utf-8?B?TnlRYitqY2hoRk1MamRtQmNVNUFIVDN3dTVMSkRobzVHdDNSY0J6SWxXMmFs?=
 =?utf-8?B?cTM3YkEycjBERWZIa2hZOG5DeUR5dlRPZVArY1VTbGlYa1hvRTNFZEJkK0JE?=
 =?utf-8?Q?mQKzKzeTBKVskN74m9GCMXMk1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c38677-2067-40ab-66f1-08dc705cc078
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:18:05.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtxsVWncCdlKQ6zIkGQL/3VphG5WGGjZn0oiNWWxj/Xa3SqdE16rgVaODJJk5bCGTL9ib0Z8UXz0gLYnE2nCxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
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

On 5/9/2024 07:43, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 18.04.24 21:43, Harry Wentland wrote:
>> On 2024-03-07 01:29, Wayne Lin wrote:
>>> [Why]
>>> Commit:
>>> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
>>> accidently overwrite the commit
>>> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2")
>>> which cause regression.
>>>
>>> [How]
>>> Recover the original NULL fix and remove the unnecessary input parameter 'state' for
>>> drm_dp_add_payload_part2().
>>>
>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
>>> Reported-by: Leon Weiß <leon.weiss@ruhr-uni-bochum.de>
>>> Link: https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.camel@ruhr-uni-bochum.de/
>>> Cc: lyude@redhat.com
>>> Cc: imre.deak@intel.com
>>> Cc: stable@vger.kernel.org
>>> Cc: regressions@lists.linux.dev
>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
>>
>> I haven't been deep in MST code in a while but this all looks
>> pretty straightforward and good.
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 
> Hmmm, that was three weeks ago, but it seems since then nothing happened
> to fix the linked regression through this or some other patch. Is there
> a reason? The build failure report from the CI maybe?

It touches files outside of amd but only has an ack from AMD.  I think 
we /probably/ want an ack from i915 and nouveau to take it through.

> 
> Wayne Lin, do you know what's up?
> 
> Ciao, Thorsten
> 
>>> ---
>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>>>   drivers/gpu/drm/display/drm_dp_mst_topology.c             | 4 +---
>>>   drivers/gpu/drm/i915/display/intel_dp_mst.c               | 2 +-
>>>   drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 2 +-
>>>   include/drm/display/drm_dp_mst_helper.h                   | 1 -
>>>   5 files changed, 4 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> index c27063305a13..2c36f3d00ca2 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>> @@ -363,7 +363,7 @@ void dm_helpers_dp_mst_send_payload_allocation(
>>>   	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
>>>   	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
>>>   
>>> -	ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
>>> +	ret = drm_dp_add_payload_part2(mst_mgr, new_payload);
>>>   
>>>   	if (ret) {
>>>   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> index 03d528209426..95fd18f24e94 100644
>>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> @@ -3421,7 +3421,6 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
>>>   /**
>>>    * drm_dp_add_payload_part2() - Execute payload update part 2
>>>    * @mgr: Manager to use.
>>> - * @state: The global atomic state
>>>    * @payload: The payload to update
>>>    *
>>>    * If @payload was successfully assigned a starting time slot by drm_dp_add_payload_part1(), this
>>> @@ -3430,14 +3429,13 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
>>>    * Returns: 0 on success, negative error code on failure.
>>>    */
>>>   int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>>> -			     struct drm_atomic_state *state,
>>>   			     struct drm_dp_mst_atomic_payload *payload)
>>>   {
>>>   	int ret = 0;
>>>   
>>>   	/* Skip failed payloads */
>>>   	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
>>> -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>>> +		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>>>   			    payload->port->connector->name);
>>>   		return -EIO;
>>>   	}
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>> index 53aec023ce92..2fba66aec038 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>> @@ -1160,7 +1160,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>>>   	if (first_mst_stream)
>>>   		intel_ddi_wait_for_fec_status(encoder, pipe_config, true);
>>>   
>>> -	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
>>> +	drm_dp_add_payload_part2(&intel_dp->mst_mgr,
>>>   				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
>>>   
>>>   	if (DISPLAY_VER(dev_priv) >= 12)
>>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>>> index 0c3d88ad0b0e..88728a0b2c25 100644
>>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>>> @@ -915,7 +915,7 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
>>>   		msto->disabled = false;
>>>   		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
>>>   	} else if (msto->enabled) {
>>> -		drm_dp_add_payload_part2(mgr, state, new_payload);
>>> +		drm_dp_add_payload_part2(mgr, new_payload);
>>>   		msto->enabled = false;
>>>   	}
>>>   }
>>> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
>>> index 9b19d8bd520a..6c9145abc7e2 100644
>>> --- a/include/drm/display/drm_dp_mst_helper.h
>>> +++ b/include/drm/display/drm_dp_mst_helper.h
>>> @@ -851,7 +851,6 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>>>   			     struct drm_dp_mst_topology_state *mst_state,
>>>   			     struct drm_dp_mst_atomic_payload *payload);
>>>   int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>>> -			     struct drm_atomic_state *state,
>>>   			     struct drm_dp_mst_atomic_payload *payload);
>>>   void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>>>   				 struct drm_dp_mst_topology_state *mst_state,
>>
>>
>>
> 

