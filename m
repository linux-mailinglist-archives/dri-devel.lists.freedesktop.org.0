Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6080DF88
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 00:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8080D10E528;
	Mon, 11 Dec 2023 23:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39AC10E528;
 Mon, 11 Dec 2023 23:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi+Wdn28TjaFghJlhhdtS3ynReEXyeABC6QZNViUDLbEPRfu3VXkeCbXVgLHVtWeiqOqT77HPfJZ3bhtTkaDCJSZskNeFprAlMGf2rPF+Y2x04YONlwGc4ghtnGoqwLrGJhT7ZHkV/OA1I00hT8gJE5YD7UoGoWZR2zpvc6FE4cAK39JRc++K3eT7RnTtxapSLOwU2+LA3kQa3OlruAWkCNWCPRevgjzBDEO3wSgsTlMkp+q3TMjnTW7rHLCjuamoDeQ1WFvZ6Tk4pEmDnMJGAQcfvG0MRbtv59wwzO2uA/wC8sM82d7AdNzCLUOyjDmbWgJ+ApkzkpzJI0f4Lo+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xTmuxAGAbd4Ur939R/3KC1ZiWBkjYe+yHdCP1f2H0k=;
 b=HzlTkcwI0SwEZEzVWthdg+/da5KBIKsTTL82tyKblFSOlpO1OkN7NDB3fYI+DmB1MHL92ABgxZvuQwoFm4uXGm6Yu53JTxDR4vL1CTLfVBgKKdeYvzkI4YUXfRzx51LYy81iTrn3usmvGlmEbQP/OR2/+eyDoJKTKDDhqpoOG1BgbQVp5uMvKYdT4zgml4JOUzMytx48sHhXYG5YcmCmdrFmY5Vl73KBTuogKTkyVQ8cjp/v6Ry70K8smdRs1zrU1G0cW/WUn4uZPTR6qfsvA4PB4tcVtXISFe4EJVY9Qk2ZvtRZEGtiWuyN4oY46OI0/A2lw4TMS45NCBF7hWTQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xTmuxAGAbd4Ur939R/3KC1ZiWBkjYe+yHdCP1f2H0k=;
 b=RAxCa9H+s6XO/NQ2vUIv8MOguk8XqG11FN1xLttvnPrSYtZorEfIHkpvOeKoy8c3elE+A33urRVTVEqu0f2tvwExT58K3+OPvF37ko6mVqD4zSfbu1or9rzTN3LINwa1OnKrQb2e8VtIBru78zPEY5BmlKBO2lVPL16bevzW4pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 23:32:18 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 23:32:18 +0000
Message-ID: <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
Date: Mon, 11 Dec 2023 18:32:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0376.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::7) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: edf17d4c-7363-4a03-e404-08dbfaa16a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4seDDC12xHO7HkDrIESN+gbbBWZ8A0K18J6QR0RXzd3F5cDzfw7ZlyGbPiEuelvSoMVIgcofMytBjRlKKH6UtInig3vTaYV3dzLfRmnVeq/wYboXRTOw0kOFjWNu/PGqd9qtgMNxqudOhLpo/yt56Rfzqb1zJKCYrAsh6UT8XeS5g8kGbzoYsgRpE2H91IH0V/5Ajitsb6OaG8B4S+D5UXp9B0LdmKKnO0pJbwshQQfTCm8N3gzEOgfoO69LoGthxVatPKzAliG0l9imc+KSv9OZy210zi79c/v7sCSniMr+c02fGCfu3+LASthke95p+iMOqXwtWTzi3sIFBbTmjuVKghdEhDTdi09cu+tSTMmHkmaJIsLJ/s6XxZVIfvF5MV0CrNKqqHuKDr/kGp0G58LPAAYq0Sw2LAyye2vHCbkUrmnFZeXpwl3w9YYdRRfur8M/YWhOX02RyPB8wRtL3ZMWXafnIyxOiuQWGe5wMHoSqSLsUGPAWJBdxzqI8t6GGtYLALDPFZR0ZR/6v7fygJvK8+JsR89wK1m1s7+USzjHwGzYj1TR5mSjULfnSuy2xvy8uqp8uW9hlo5tCtgIEGe/LsaGVOeit936jgwgIIDlR+yU5M9Ieh4w1IUFuJqEM5Qwv28qqhlLIueHo+uew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(5660300002)(2906002)(4001150100001)(6512007)(53546011)(6506007)(2616005)(31686004)(36916002)(36756003)(478600001)(6486002)(38100700002)(83380400001)(66574015)(8936002)(26005)(4326008)(66476007)(86362001)(66556008)(316002)(110136005)(6636002)(66946007)(31696002)(8676002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVBMY0tTWm5oS2xkNURNMVp5ZWszL2tGWWFUVFFuSVVZUDlVUkQzdHBTdVdL?=
 =?utf-8?B?SThWMjQ4QlV6SmZIWksrTzFUcE5jSjg3MVYxSWtzRGIxNEZkc01QM1g3cHdI?=
 =?utf-8?B?dWpnSGkzVFk4TkJPeFlxQnFuRkJkcUpQRGJHZWVKc21remhVV24yeHgvdkdN?=
 =?utf-8?B?aEY0UGZUWi9wL0lyTjl2V2IrdVhxNGxFTm1NaktQUVpzWGV4blJVbG1rM3h0?=
 =?utf-8?B?Y29wcndBTm94NW5mb2Z6VDd3TlNzbExrZGZveUgweXdxQ3FuVk4vd2hjYzZZ?=
 =?utf-8?B?VVNqOFlDWmIyaVBIdkdqWjhTN0l0RjcxZWF0eStQbkFqcU9pQmtlcDZPa1ph?=
 =?utf-8?B?cUY2ZVlkWStpb2JGOVJYQ2NpYkdJeFRUWE95elJHVlJWTGM2eHNzVS9WOGc5?=
 =?utf-8?B?Q3VGMEZEVHZJRjRUUHhGd0JGK08yUUxlK25xSmJnaUVrRW1RdmZ6N0hhNmVT?=
 =?utf-8?B?T1Q4eWE4WGNtcm55eGM5NEhkRjUrTzQ5L2NGaDdUYUFyazY0U3dHQ0dtQmow?=
 =?utf-8?B?Vm9EekpWb0U4YWpKNmhWdVpVSjhWbDZRUTlQeU5NT1dVMUNZdW1UTDVaOThN?=
 =?utf-8?B?eGlsZkhLSXpPeGp2ZW1XM3E0MjNIejgza3dEMWk3Y1RzWCtRVjQvbVFqdGFK?=
 =?utf-8?B?NE5SaXYxeVRmRzZSUGVqU0hKZ2s3RXRNclBXdXRHcXd2N2RCZ1ZTb2craStI?=
 =?utf-8?B?N3ZzeVRKekxwZm1nekNrRGVJdHdZWnJ3ZlFRSWRzSklEUktNeW1TN0hvK1NP?=
 =?utf-8?B?RjdwNTIyT1AwWjl6eE9wOGs0TXcyL200L2x5RUZ4emJSbU1iTy9mSG9NTWZB?=
 =?utf-8?B?RGI5Yzh6cnRaNWJCOVBMWDhrc2w3b2ZRcTdVa3pIVVVWcmplaXRJa3JTQ0tj?=
 =?utf-8?B?T2Jka0FKM0ZJNW9rRFYwUFI3WWJaTlBZVU9xWWhzNlVoeU8zbVJnQ2VnNjhM?=
 =?utf-8?B?M3NhU1JoQTZyeG5haU1GT3pNWHNQSGJSdW9WcEV2U0haTFRXNTQ4aVlDa05i?=
 =?utf-8?B?VDY5SlhndEo4QTNZUDcyb0hKaERQaWZOclI3aWtNbC9UWmVmblFqNTRyaDNa?=
 =?utf-8?B?YlFwVlUzVUhyL3hIMjA0YnozV3MrOWRuQXBvV2pPNU1BSFFpRUhTTHNsQUgr?=
 =?utf-8?B?eStFbGtjaTZ0ZnJURkdEVUFta1lSSDN2aGdPMkpYRHhkTDhrVmw2Q05zaGV4?=
 =?utf-8?B?b3UyTFFRbDAxR3JsRWl3RHFnNG44dC9WV0RUWXBSR09wVE5YVURyUk91UUUy?=
 =?utf-8?B?QVdTZ0RFYURZSXVNNUhHd1N2eEZnU3hJWlc4ZC92MENCa2N1VmVYOVJMM1Rn?=
 =?utf-8?B?cDZ4bUhjZFhzSDlBVVVYS0RJRjJoUWxxRG9hdWF6S09SNmlFT2FYbGF1Mkhl?=
 =?utf-8?B?Q0UvMnVLbzExbjJuRWZXamh0aE1wQllDWDc4TFl4YU9Sc2RlYVJTOHZpWFVi?=
 =?utf-8?B?QWliSjc3UG5VdVZ5VVpuK2dWYlFqaWMwRTZXZmFuOWVETEk1eFIyOEVOM0w2?=
 =?utf-8?B?RDdyYW0zcythWkdiZVlrQ1czUEZHRld0NXU5Y1ArZnE1cnZEcUNWZFU2VG9Y?=
 =?utf-8?B?L0RMRnFxSVFDbldncWhFaHdqZ2V0WFVqKzdHVzY1T1NraklXeG9IWlRycnV6?=
 =?utf-8?B?T3ZDMmxFSEN0ckx4MmIrSkFNMVBCVStycGVvVTRvdFU3OFRuVGtVV1RMYnMz?=
 =?utf-8?B?VmVKNStnK29UcUlTL1pNQzgrY2t1QzQwa1owQjh3cFd5TTROQVk3RTBLZWZ3?=
 =?utf-8?B?aHZtalQvY0FZcjAzTWlmOXdPMHdsQmpLMGRGSkFsL3l3L3NhcksvR3lZdGJT?=
 =?utf-8?B?Z2J2VDlyTkFBdzYrOTJtL3lDOHJ4MEJiOGM5bmwra2pXZm1YUEdMM1lWbEpX?=
 =?utf-8?B?YnZTQWc1S01VQ3NRUzJQVnI4Y1B5WGdTZEpncWtkYVE3TjZvOG1pbW12Zmxu?=
 =?utf-8?B?ci9WOGZFU2V3SVFUTGxtb3lNcjZHRE1RdlYxRkUvSTlsaXF3UXVxakN6MDhH?=
 =?utf-8?B?YVVnbjB1UytoRm5yWFJtNmNuUW9LbDFsblRvTWE4ZnpoVHNuSU9IUTc1TkRN?=
 =?utf-8?B?engySlVCb0Y5MTZPNzd2N0NuaFU3dVlxOGR1a0Q1M0FNVlhvMDlmakpNYlAr?=
 =?utf-8?Q?5z1qskLgIqr1jo/dkRiuX4qsL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf17d4c-7363-4a03-e404-08dbfaa16a29
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 23:32:18.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTDqipjeVozAV8dPNsjx7/uyeJNGV4n8+3Dq9D0fkadzfNCcYGha7Ps4zx6HnG3hp/VeOiq59KxYKcjj+2lhkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-12-11 04:50, Christian König wrote:
> Am 08.12.23 um 20:53 schrieb Alex Deucher:
>> [SNIP]
>>> You also need a functionality which resets all cleared blocks to
>>> uncleared after suspend/resume.
>>>
>>> No idea how to do this, maybe Alex knows of hand.
>> Since the buffers are cleared on creation, is there actually anything to do?
>
> Well exactly that's the problem, the buffers are no longer always 
> cleared on creation with this patch.
>
> Instead we clear on free, track which areas are cleared and clear only 
> the ones which aren't cleared yet on creation.

The code I added for clearing-on-free a long time ago, does not clear to 
0, but to a non-0 poison value. That was meant to make it easier to 
catch applications incorrectly relying on 0-initialized memory. Is that 
being changed? I didn't see it in this patch series.

Regards,
   Felix


>
> So some cases need special handling. E.g. when the engine is not 
> initialized yet or suspend/resume.
>
> In theory after a suspend/resume cycle the VRAM is cleared to zeros, 
> but in practice that's not always true.
>
> Christian.
>
>> Alex
