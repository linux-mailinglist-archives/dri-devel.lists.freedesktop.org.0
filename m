Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C11BACC26F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 10:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AA910E6C4;
	Tue,  3 Jun 2025 08:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qhsb2cpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB8910E6C4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 08:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoTDT0SrzBS966dqJr99FbhUXdKsS4nS7askrrJAgRrmwqP3Ko4oY46kGycz0qldCftJeDqmL7Nq2EragTiJ/JAljY5gk3GmzalaPOcOtWyflhpAouBwpkKMTOIGT0ZSnWpYiYbPHhl1f3qpcu+qajP4VHDpYak6SToexglbIH6ZYasEsqDkaKVxX2spfDYfVYvjlUiwUE+TnCRGEputbY4OPSVf/kCa4nYZC+MuOYZEPCj+jVQ47ZjdY3dlhjXuAampJ5FPBt779dKrPJEIterYEjnr49q+J57QkmJ0ceQA498aR0FXdTlnhV5b+9lY4Yi9E53N2l7vGo6TCy1OaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVi+8t/sxDfgz8bAnx8/x1CmQMwU567i3FuF3I9QzHI=;
 b=VXvgZTd0iPF/FyM3M4PP8gbsUZcGJOd8I0uS/VAVwedFR37DFcRI4+xDzzj+f2r4gmb47ycJp6m0pnLV+ykQZmsrr6u688I/ULBH0Vb8TXLZxU6Oy0oQZExOxjxB5u+L4i1FPr0TLEH534qNP9dY6tnYib9VtQT6GcXjXqjCqKRaiox1PL70IALXWWYXSohueTXroL3KpdvbkqECWdWyu3No88CLXmOdqfSZDNSJVG4AF2zLAP0yf8bTpabxIh0Mj8OtoXxU62JuWfDo7SmyTfXW+m4nrTJTKepwwg+Dcb44zgHzC9tgrVpN/+YN0HdTWQ0igoNnJMG9zJtR5YWziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVi+8t/sxDfgz8bAnx8/x1CmQMwU567i3FuF3I9QzHI=;
 b=Qhsb2cpvc3gl0vhkwN1PcyY1QhfhOxlyJpErSc5hCtcDzlzhiYJZzjjKwYFdJTqtsJAYFVT1/74gizasOHPEksjMjcB8Kl23Ft4UaNq7NQwmjgEGm+nyzu30ApQ49nEGD/cSrkY0tsDFxjdloalbEVNlJCvxviS1RipYAX2Vvy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.33; Tue, 3 Jun 2025 08:50:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 08:50:17 +0000
Message-ID: <9f641220-9774-4072-9161-31cc0a411525@amd.com>
Date: Tue, 3 Jun 2025 10:50:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ttm/pool: allow debugfs dumps for numa pools.
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20250602204013.1104258-1-airlied@gmail.com>
 <92e31f45-1f8c-4081-8865-a2aee7a2935e@amd.com>
 <CAMwc25oAjBwnpE4CfAPu4SvUia8QRVe0Q3dN-msXVXeEw1UDtA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25oAjBwnpE4CfAPu4SvUia8QRVe0Q3dN-msXVXeEw1UDtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: ed567314-c68f-4607-5c61-08dda27ba9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEVTaWNrWmNSRVp6VTFiVTU5ZjhRYWsvWW5BelRIU25mN2p6UGZhUHRqUDVT?=
 =?utf-8?B?bTB2MjRpeXpJV2VidDlZK0FuaFVwSWxnZTRhZXRsTXhoRXdUYnh4RGs2dmU0?=
 =?utf-8?B?VHVXT3F1ZFBCRjBrMVhJcnpCbWRTS0lOekRUZXFkbHgwdGE4eGVTRTZHN1l1?=
 =?utf-8?B?R3F3M0pMQjQ0clN3NktSZVR4TldUZVFucjVXcjRJQ3ZQcmk5S2N2N3NNNFdY?=
 =?utf-8?B?UVNDTDJOckZWWDNlaHdLMGl4UVB4RVdFeXNhNk1JclhFQlU5cUc0SzdKWUIy?=
 =?utf-8?B?bFd5cjE5WU1WLzVEQnQyUXpnYmVzQ1ZVTTdYUFlQWm9wM1AzWDRvbitFTStx?=
 =?utf-8?B?V2huUWhJQ2N1WWcvYXRjKzJPVXdPKzIrZ1ZCS2pYZWp5YWNrZ2E4S2hYeEp6?=
 =?utf-8?B?QUtIOTl0dDB3Z1A3NE9sSkZONTR6U0xpUTVJUlJNVytuNHA5RXdVelRZUjBR?=
 =?utf-8?B?OTVzREVMZ0hIVktHSlljM3Jxekthd2xKUWdQamdVa2NEN2lHZmxHYXBjam1E?=
 =?utf-8?B?MHFpNXcrUEUrVUpxNVJuY2x4UFlpeENteVR4WTd4MWh1UkNTRCsxOFBKbFlU?=
 =?utf-8?B?TXEvckdET01ZbkpqN0xXcm9TT3hzVzNmbmhlWEh4TmtBNmVaejRseEdCYlRi?=
 =?utf-8?B?ZnZiZkF1T1IxVWlnNGtiSytwcks4NHZwdU1yV1NNMVZKV2RCZXBYL1QyQm1Y?=
 =?utf-8?B?eHNXQmlBTFN1M2l0eCtJZ3A4Mko0MzVZVnM2RGMvM2IwakxaaHpSakFPbEFY?=
 =?utf-8?B?UG1iTjZ4b0lQSHNOTWJ4MXN0aEx6d3ZXMTdRcFQwTGUwb0Jxa1BCcHF3YWVN?=
 =?utf-8?B?YkxXRjZ2SUdNMHlRcTEwZDk5UXFuMGpOYWpJdU5JZkdVekZ6VHkyOXZhQTJz?=
 =?utf-8?B?OEpsUEJFOXdqVi81OWIvYWxpODZYdzVTaDMyWE9nZ3VuWVVJbmRnYld1WGI2?=
 =?utf-8?B?ZlRQdlVQUXJ3ZFdWT2FrdU9tbjh0blA0bUtXcVMxQm90UDFEUkFnS21RSURU?=
 =?utf-8?B?VkdSNnV1bGZqZE1QaklYNkVLQThRTVNXYjVHd2s2Zit1Q1FGR2FXenZjS2ty?=
 =?utf-8?B?a0R3WTRQT2ZKcmhMVFUvR1NWek1nd001Y09ERzZ5eW1HYWtRN3hmR0FXdm1U?=
 =?utf-8?B?SkJkSnkzbHYzSU92NSsxOUhKZktNZVo4SnZ6cEJFelBsU3JTVEt6QU9vSkJi?=
 =?utf-8?B?cjBnVW53WTExenhLcHVVVU45YngvSXRYUUxQcXE2Y2hrSmJsKzVMaG82TU5x?=
 =?utf-8?B?SWNJVmVINThBNWxKWXJLMXVwY2REL0FNZnVqZmdvWFRTSStjeU5YQXZUNTNW?=
 =?utf-8?B?aDNZK0xDNWxWQmw2SjFrRFEwQ3I0eUd6SWdpZW5CNWVGQlhJRUQ5Z0E3elJ5?=
 =?utf-8?B?eFIrS3MrMWZiMlhISXJRVjd3aVdXNGRqU2tLRCtSMnZpSUhjblBvTnlpWC9x?=
 =?utf-8?B?eHFEQ1pCYUNWM2pWUDNqZFdKRGhJYmlJeHQ1Rm54OG9UUW9jUjhCUGFYcnp4?=
 =?utf-8?B?THAzQ2pjRVNwVGRQMEhsMmhGSjkzZUdMK056ZmJuUVk0L0xybHZKT0ZTWExV?=
 =?utf-8?B?OTIxbGsxSFpOcHJwcW81Nk4yN3N6M1BEVTM5MlJITkVVcnIwZFVwUHltN296?=
 =?utf-8?B?emJZcndpclJHS2NzVXpMaFdOUWtrZ3JOT1JCRG5VRE9ySy8yODdtWDFzY2pP?=
 =?utf-8?B?N2ZvZGNLWVkwZzdJdFM3dGMybTQ1MUJGYWhwSS9HZ09hRFRHQ3JWTy9WT3Z1?=
 =?utf-8?B?clZ2aXlPNzZVOG5WdE9aM09EaERUSFVOanhEMUZ0WmNmTi8ycXZmR1F0c3pY?=
 =?utf-8?B?bHVVMVFUK3F5Qkl0OW9qQXBJWTVmclZKYnNjMFFvb2p1UDRjL0ZJQlBibEdQ?=
 =?utf-8?B?cXZ5NDd0akk4RlJMOXh2allMVTNtRFdRT0ttYUtGVy9YalR3TERvZzBkcjhD?=
 =?utf-8?Q?UbsQ+jlwdZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJVYk5sRFpJYllrWnhOVDF0amhURVNCcUlBbW1KTGZ0emF4ZUx4OHNuOTRJ?=
 =?utf-8?B?MVgwU29yckN6cTNIM0ZmK29xTDN0UFUrQjMzS1dVVkptZS9iSkFWYlVSYW4w?=
 =?utf-8?B?akFDcWZ2QVpZcmdIR1FRUjRHVzJJVjJJR1ErdTR1YmM4am9HWXdGdzZuVDBU?=
 =?utf-8?B?RWM3OWEzV3MwbW9wYmk3dFg0WEdOVlEwOS8rRkljd3RGeEpYU09FM1NRUk94?=
 =?utf-8?B?TFp5eW5Ic205MkFYb3VSNE9vV2luMVR5ZXU5eUwwanltTC9EZUVhc2JFeTFJ?=
 =?utf-8?B?ZU1XcTduZWhiV3dXVWMrU1ZXZjVGK3hYczdrRDVqNE83MjYxTHN3SFg3alQr?=
 =?utf-8?B?U3dPOEtYcHFwZzFtWUZTZDdtNUhCKzZvbzN0cHpJay90RWJqbVVBNFJVc0cy?=
 =?utf-8?B?dlZWcTErSmVpMGdOTHU5Zi9EcVZUSE93YXh5Tkw0ZWtEMUc0SDZyczFXd1c1?=
 =?utf-8?B?aE5ta2dKWlBJV3BUT2d3dzB4cFVWMEZKSitGMkVKTWNzNzRYVXZMbjVCdnpH?=
 =?utf-8?B?SmgvL3lYMGlWRHQ3WVpDSGt0MHNmeEdveHNZTmx3U0taR1NEc0tTbWFHb2I3?=
 =?utf-8?B?cTZ3UFNSUmRMQjBuSTRTYnJuSWxyUkVITUliR3NKNEJ0amlGZ0c4OExsb2Ir?=
 =?utf-8?B?L3NocGlPazhVNm14RTcrRkFZWmZtbEhPWC9nV0dJMW5YemdmdWJGNEk5RjQ4?=
 =?utf-8?B?L2dibUhIZWRZZkl5aUZRaTJuUldCOHdBMzQzSVRiTHMrZVRqbmJUaURtOW9O?=
 =?utf-8?B?TkppVEJwSExJUy9VRnQ3RUhNMUcvNjZXa0NuSnN6RkZlWlAwREpDZE1DNWhj?=
 =?utf-8?B?RU5xTGZCZmVpWU1iYml5SW0yWTRoYmEwWnV3d2ZlYkZ3ZTc3VU9MUk4wZ1Jo?=
 =?utf-8?B?NTZqWFpMT3NxaTBwNTUyN2hvOGw0bVpBSGlOa3haTDlpS2xGZjV5d1cxbFZH?=
 =?utf-8?B?UW5VTnNwV3gzTzN4ZWxZSTVIbHN4U21NUmMwYTUxOTlYbU5iVEVESnNYUmhT?=
 =?utf-8?B?OXh5cmdJQVVwTEZDM3BvRWE4WWxRVVdZTkljVTNXRDJaa3NIWXdzT05GVmxU?=
 =?utf-8?B?UGhBV1I1dURrbDhtZ2hyaWtXSnlQUjd1Q0VOWE53ZVB5YjR2bVhVb3RBR2Ew?=
 =?utf-8?B?S1BpN0xSY01mZDJkLzJyOW5vZHRaaFNjSzZnUkhabm5EczNMTmZTa0gyQ2h2?=
 =?utf-8?B?dEFMWU0vQ1h3MURIYW5Xc3ppUHZ1MVk0UW5acndNbENDL2paczBiQS8vTkNs?=
 =?utf-8?B?OHlOTlR5MkEwY1VsOHl5VTJ1WDJDd3ptQjFqQnJCaGdITWN6a20zblRSd3cw?=
 =?utf-8?B?L0t0NWlvNEcrMHBoN3UrZmI2TS8xaWRSeGpiRjBRV1JRMzdEMWRQNjAwTHB2?=
 =?utf-8?B?ZHBnbzk5ZmxEeS9JQ1g0UUx4VjZzRkc5dDAwOUJYMFY2d2VQQ2QvRFNaOTVQ?=
 =?utf-8?B?c0pxWXUxd2hDVU5ncXREam1VazM4S1YxN05tdUo2bmczWUhnbktTaXNJQ2RG?=
 =?utf-8?B?VFR6c0V1V01rejlUaUZYWW5Xbi9TREQ3dXJPWVpIRkkvYUljOG15dWdOM3NW?=
 =?utf-8?B?eWdLMHJDcGU3THlMT1pBY3ZpTW5GZTRtV3Z3VUw3SzU3T3FPekZTSUFtL1k2?=
 =?utf-8?B?NGVOQjlOYTdnR0lVTEovM1NkQjNMNzBPK0Zhd0ZFQ2phQlprU29MTnZKT1k3?=
 =?utf-8?B?ZUhMbVBiU25XOEhLNU5ac25XVVF3ZnJtZUVKcC9walExWGl3QUowVUhXeU0z?=
 =?utf-8?B?VUZIUDgxUG9qQTF0aGRHVW9EUzVTakozRUJZdzZ5cWlubndQZkZjOXJCa2Fj?=
 =?utf-8?B?ZVVOVkdwdURQWHhmN3BoWFM2aG5lTVJWWHpiNVByejViKzhHOU9SQktPbG5Y?=
 =?utf-8?B?dlZZSjRudXNpK0FVblZyWk9uZEx4NGQ0V1hJcjFvMzVlTW9ZKy95dEpuL3A4?=
 =?utf-8?B?NGZyNjYzb2NhNDVDNUhoZzBlaHlLNVFhMDdrbVFydklUNUIwN0JDNUpKYlZR?=
 =?utf-8?B?c25DK216SlJKRDdJUUFxNmRnOEZJZmtpb0VPTlQvc2hyOW1HeW5NSkFQaElC?=
 =?utf-8?B?RGJiQUpyQ1FpNlZiTTdtSXV4dSt4UklEQStYazNkTjNrdGlFODB4eFJSZzZH?=
 =?utf-8?Q?vCFwkAEe8BnlnO+lchsjDT+zc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed567314-c68f-4607-5c61-08dda27ba9a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 08:50:16.9062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSOB/u9ndgtm9NwYe/OuA7aQjXZNKWhF7FcBH/TmReZPQHkhSsfsYG7CvvR319pJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6472
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

On 6/3/25 09:52, David Airlie wrote:
> On Tue, Jun 3, 2025 at 5:47 PM Christian König <christian.koenig@amd.com> wrote:
>>
>> On 6/2/25 22:40, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> Currently you can't see per-device numa aware pools properly.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Any follow up patch to wire this up in amdgpu?
> 
> Just seems to work, at least I tested it on a 4 node MI300A system
> this morning and
> 
> /sys/kernel/debug/dri/*/ttm_page_pool seems to reflect the correct pools.

Yeah that should work, but there is also the mode where we allocated the pool in the driver because the MI300 has connections to multiple NUMA nodes.

See amdgpu_ttm_tt_populate().

I will take care of this after that patch here lands.

Regards,
Christian.


> 
> Dave.
> 
>>
>> Regards,
>> Christian.
>>
>>> ---
>>>  drivers/gpu/drm/ttm/ttm_pool.c | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index ccc3b9a13e9e..43b69d061dff 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -1253,7 +1253,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>>  {
>>>       unsigned int i;
>>>
>>> -     if (!pool->use_dma_alloc) {
>>> +     if (!pool->use_dma_alloc && pool->nid == NUMA_NO_NODE) {
>>>               seq_puts(m, "unused\n");
>>>               return 0;
>>>       }
>>> @@ -1262,7 +1262,12 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>>
>>>       spin_lock(&shrinker_lock);
>>>       for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>> -             seq_puts(m, "DMA ");
>>> +             if (!ttm_pool_select_type(pool, i, 0))
>>> +                     continue;
>>> +             if (pool->use_dma_alloc)
>>> +                     seq_puts(m, "DMA ");
>>> +             else
>>> +                     seq_printf(m, "N%d ", pool->nid);
>>>               switch (i) {
>>>               case ttm_cached:
>>>                       seq_puts(m, "\t:");
>>
> 

