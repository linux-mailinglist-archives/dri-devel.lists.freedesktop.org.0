Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF73F44A7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 07:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C1589CB2;
	Mon, 23 Aug 2021 05:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768CC89CB2;
 Mon, 23 Aug 2021 05:37:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7/GcSRibe16pi7sJyzBQ0TZomtywQTtnaaKF859XV6RKOPs3gUnuVcUH9b06XeFUKhFJkV8kSBuptwpSL4g2QZX4OJtVMaSkZhXvL6XY+ayhQHJt93D22fsTZhWxj6QgHssZlvy0wXzT8344qYnoBidqd30ghYZog1RgpDBKGxsQ25ILTPMwhR0k5TYv+BvN+MQcc0FdchAo5igMC0k/wXhH4+EfDOPuaEoNx7Mdv1P8YFWZ/i1eLR9KP7BDT33LZ/D5uWuz+Rwqbr9P4xTjyXCpOqv8UkksWAqHva0AZnfqRSZck+wECyKcmBJmZXrZ1vJpA2JTqIq0iPMDn//Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuPMBCDSqx3IHfmf1S7di5CTDqH4zgWL8D0qCWS5CtU=;
 b=bZ7XcSz/grWss1ww80duZgNuZSgvxinq8ZWRg3ZyfT8vZXtCmn5LU9iBQ9uOD7gP7Eoxgl28+yAzUFKlxuexSLLmxp8bRaXtDKkQZUaSxRuAHFdpZSrYgLm1+F3DobZP1DwAydRrHnU8FjgiNNPpgbh6iVVYNjaOM2ufOrx0zI2UgOdNv0K5PZqKre0KqytNY1abWIh348WOLEVxmgwQZNeATB6fqQGruBdioizimA4ZAUtlsZDOl1M0p1jn0ff+uDS52KuBMaVpuhqV90jLXllruNEb8xGvcn4g3Mh+14mqnjEf1zyl2jbDLxgTR2ZCKPcsrF1KS3sQLGwXxYFwqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuPMBCDSqx3IHfmf1S7di5CTDqH4zgWL8D0qCWS5CtU=;
 b=vWIaid3DEv91Sihgx1QY+TKOQa/SsxG2j4TaEZy21qYTMaCQuOeF+Vb850phq4ew+pVTKb34ne6q6A9HnvqyIJBIdgp0P7Z6tYvG5tW97a8F3S/bvPCGwhik68Ap7UXxb2ObUS7MhuW4FMgir2Whpj7fKvqWMwrQo9ITRyu92To=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5318.namprd12.prod.outlook.com (2603:10b6:208:31d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 05:37:17 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.024; Mon, 23 Aug 2021
 05:37:17 +0000
Subject: Re: [PATCH] drm/amd/pm: And destination bounds checking to struct copy
To: Kees Cook <keescook@chromium.org>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Jiawei Gu <Jiawei.Gu@amd.com>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <luben.tuikov@amd.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Dennis Li <Dennis.Li@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David M Nieto <David.Nieto@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Lee Jones <lee.jones@linaro.org>, John Clements <John.Clements@amd.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210819201441.3545027-1-keescook@chromium.org>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <5662d231-d95e-9177-3b45-099b131405fd@amd.com>
Date: Mon, 23 Aug 2021 11:06:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210819201441.3545027-1-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::15) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN2PR01CA0100.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:27::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 05:37:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07b0ebc1-6dad-4509-9d32-08d965f8119f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB531896D84630B8F94DA138EC97C49@BL1PR12MB5318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hI0YKi3UlxIade1+UGUI4VJSUI7ULdPF7C/5fNB93RvsQvt+dl5Uf7qMlEI3BQFDECCPPQ3Syi1F+lRjh21IkQkVJUtksTRflTKrl2u3j5EzYBeu+MAK7DseZ6NsVbytyvBAq56HEeim9XGlob7dRlLKZppGvHh6YiJQNoA7Aonl+WmJKp9/dJ16oWh5i1iQ9u2ZsbP1gfOWhj3lPLy/786T/imMVfkp2T7zqC44xBWF7Nzm0dY9XBwnv0i3R8++5z6YXvmwYu8G4zJL0o5koYBSRxPxwS22JCf5OeU10DMaeZSETZmOq3nqiCCGV5v0pAQiICdO4n9jtQUtkWRM6nXESQrbhrRELMVkg9SDYRsvDwrD+7gftixU/EuLwk2DuQ6CGQMauorlXkkEa/k11Ax8kUdar2VpcIvQeAw19axm0Yjec0b4DJPDWZ3PSSznOj3yYH8MO9IgPPxf4mAgr9aWrseXJlngW8bAYtMDSWZqia28aR3FaRLb1IS0HDVugx7fGL1NT3Pq5d2a+66Z6Pkm8DQ6z3vSdNYUU5Bu81RkKFb5u0sc9Mhh0CbOgrEhTLfBKaBU0K4aruXq5U/5N1rOJkDSOV7ZcY1eIDvVdqtDLmIXuwhQ0TTd6ZaVR5DF4UqygkqvBu8LPQlKWf2nLhjt/vziUULjaHEo5Kuptv0QdUGaIykAOVIYPB49dzMAKqV1uRytK4Wo2PUY89oC/ueBkEG9lrjP/n3ZLf9Emdof20MfNb9CPhosZp6weMble5P1bQSSRqcBSbQHlrgQgOlnq7ONzO/09L5Cv8Lt6MBlib5t72w+hJ78mcsWUfAVm9ZR9lNTiRgXikwePYar9kCHuxb1vJB+owQ6Cr7zXwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6916009)(966005)(36756003)(26005)(53546011)(6486002)(83380400001)(186003)(6666004)(316002)(66574015)(45080400002)(86362001)(956004)(16576012)(31686004)(2616005)(38100700002)(2906002)(8676002)(508600001)(66476007)(66556008)(4326008)(66946007)(5660300002)(54906003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNTNEhnbm9Hamp4MXAvK1FHUkhMTndLQ01LMFh6dVpSekdUa3ZEcVdqS3o1?=
 =?utf-8?B?TFZFaWFZZFAyZ1NBWnZOTzNjYXFGd0IwR0J0dWFFWVNabERrZUxBU1pzZHFr?=
 =?utf-8?B?V3I5SUVQcWphMWswR1oxMjZSWDlmTDdKY1BCMzZnTS8rNGRudmQ0eWcrOWNT?=
 =?utf-8?B?Y0laL0dRTDdtaENCM3ZkcktISlo3WW5Dbm5hMGxQMVprRmdWL1hha3hnTTJi?=
 =?utf-8?B?ZnRuQkxSd0tGajVhZTdnWE1lSUpGT3R2UGorVG80MTFDZWFnbURRUEJ6QU9M?=
 =?utf-8?B?TitNNzdLNks4ZkhFNXpwOUEwbkNOY1d0R2gxdTcrUjhhMzRpY2JxaTRJY0VK?=
 =?utf-8?B?S1hxOEZ1NWdCOEE5R0hPTXVreXJodHFTY1dUamZ1L2ZkdmloR215dk0wQ0xI?=
 =?utf-8?B?MnBrUHViVUVDbUlsUVBTVkNnNFQyLzRmYXFmaHUzSUNZblRJZjBWc21zTk5G?=
 =?utf-8?B?RFU2djgxaE5LZXZSZEdWbFh4N3pTRUZITlBlTC9Rcks5bVBRZGlIeHJuMWZR?=
 =?utf-8?B?Yjl3VitsQ3VCN2FaeWJNU1JhbERRekozRzhnV2h0dFlqeEptNFpYRjN0RW9i?=
 =?utf-8?B?M3RvSjlVTE9qKytHaFduR1VUZ285OTdjZDc3bXY0amJ4QW00ZDVjTERYbFU4?=
 =?utf-8?B?dU05QWFMaXA1QTBlVExMakIwNkE4NW9xUitkUXdnWUg1MDkrY3hJTHE1VG1Q?=
 =?utf-8?B?YnR6Y2xuSDdkODJjUXhYZHpFRVZVd08vWDNiVy9maytYVVk3SnV5RGpYQnl6?=
 =?utf-8?B?UmJnNHYwOTdGM0s2UUxtMXhnUkxDTmpEazY2Wk9mZU1vL3ZvWVFCU1czRE1B?=
 =?utf-8?B?YWhzYStBaVdUaXF1K3BxVWRJZFB4eDlKM3NLaHdJUUZwTG0rUDNlNkdRNWFB?=
 =?utf-8?B?U0hrM2FhcGoxNHNzS3RnOVFzWnlHaWJZdGxLaVNxTk9BMFpKVnJJTUxvelhH?=
 =?utf-8?B?K0ovcDRSKzZKT0ZvNTVaUk5XM3JubW9NNWp6VWZCaFVoSDFhSmYveTE3aUQy?=
 =?utf-8?B?VTZxTzNaNXMxKzcxeDZUb1ZZT253UHY4WkJ6Y1pRMWhYSWVnWHVhcWsybS8w?=
 =?utf-8?B?ZmRLekhXemZKUTNURjhUUXpSaVVRWTFUUWQrd3RxMTh6UTFJcXdmWTc2U3U4?=
 =?utf-8?B?WjZteSthSUcxWTI0azFiOER3bjRwUjhET2dIbXlDZi9oYjFJbHl1blpLSGk4?=
 =?utf-8?B?MExuV04xN0syblV5Qkp2dGtxUnJXd0IvUzJJRUVNV2FzR3NpbFkvOTkxdytI?=
 =?utf-8?B?R1JtTEdqTk9vYW5mN0RrQkZzQ0o3UXhLVVVRZTFvaWZuZkRIenNNNzh2Tk05?=
 =?utf-8?B?Y2l2MlY2MG9NR2cwWUFhaE5heTZUa0xQZlBrSWwzUXR3QU5nN01iV0VJYXdF?=
 =?utf-8?B?enBTaGh4bGpSL3RCT0FtN2pVZk5IY25oaGxOcnVrNjFGK1FzMHAvQ1JpZ210?=
 =?utf-8?B?NGZaem1YNE9GSkttK2RoRytRQ2F1TWdpVFNaVWMvWEtiTmsyd3Z1N0VKUmxm?=
 =?utf-8?B?dGZqSnZPRnRzaElGT3Q1RWQyRlFvSjVHUURUWDY5VTJJYjNtbXhjcC92aDEw?=
 =?utf-8?B?c3FURzdGWURISEZHanhsYzhnUWhGOUdlemxIRm14Y2RhdDJqUXYxU21hZHlJ?=
 =?utf-8?B?TWlTdzV4ZDVEclEyd2FJVzBOMmNqNnFpYXVQeUxNeDZSTGxUK2hxeHZIb0ZC?=
 =?utf-8?B?MmJ3aTFMSkgxdjdmRXFVR0h2akRRZ20xY09KTFQ5dlFlbmk1bXM3V0lvSmVJ?=
 =?utf-8?Q?C5GC5V2cvpvEj3w0EJ0F2PSxl2LSnxQ1pMJydb6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b0ebc1-6dad-4509-9d32-08d965f8119f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 05:37:17.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPFNlDrUOeFRRk1/Kvl4vIVRXjVW8r0xloX7c/9CcFRLl+ZwhzWNWLn/x5DS2+Zs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5318
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

Thanks Kees!

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

On 8/20/2021 1:44 AM, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> The "Board Parameters" members of the structs:
> 	struct atom_smc_dpm_info_v4_5
> 	struct atom_smc_dpm_info_v4_6
> 	struct atom_smc_dpm_info_v4_7
> 	struct atom_smc_dpm_info_v4_10
> are written to the corresponding members of the corresponding PPTable_t
> variables, but they lack destination size bounds checking, which means
> the compiler cannot verify at compile time that this is an intended and
> safe memcpy().
> 
> Since the header files are effectively immutable[1] and a struct_group()
> cannot be used, nor a common struct referenced by both sides of the
> memcpy() arguments, add a new helper, memcpy_trailing(), to perform the
> bounds checking at compile time. Replace the open-coded memcpy()s with
> memcpy_trailing() which includes enough context for the bounds checking.
> 
> "objdump -d" shows no object code changes.
> 
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2Fe56aad3c-a06f-da07-f491-a894a570d78f%40amd.com&amp;data=04%7C01%7Clijo.lazar%40amd.com%7Cb0567a0252604c8c84cd08d9634dfe39%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637650008892964983%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=UikQRh9WCwr8H29bBqZu3iLJt095Es9mIG5mVwPJpC0%3D&amp;reserved=0
> 
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Feifei Xu <Feifei.Xu@amd.com>
> Cc: Likun Gao <Likun.Gao@amd.com>
> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2FCADnq5_Npb8uYvd%2BR4UHgf-w8-cQj3JoODjviJR_Y9w9wqJ71mQ%40mail.gmail.com&amp;data=04%7C01%7Clijo.lazar%40amd.com%7Cb0567a0252604c8c84cd08d9634dfe39%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637650008892964983%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LVHdf9C1jx6eIB2BQ%2Bm5q4o5KcRzBWJi7PhNviKzKGM%3D&amp;reserved=0
> ---
> Alex, I dropped your prior Acked-by, since the implementation is very
> different. If you're still happy with it, I can add it back. :)
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 25 +++++++++++++++++++
>   .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  6 ++---
>   .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  8 +++---
>   .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.c    |  5 ++--
>   4 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 96e895d6be35..4605934a4fb7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1446,4 +1446,29 @@ static inline int amdgpu_in_reset(struct amdgpu_device *adev)
>   {
>   	return atomic_read(&adev->in_gpu_reset);
>   }
> +
> +/**
> + * memcpy_trailing - Copy the end of one structure into the middle of another
> + *
> + * @dst: Pointer to destination struct
> + * @first_dst_member: The member name in @dst where the overwrite begins
> + * @last_dst_member: The member name in @dst where the overwrite ends after
> + * @src: Pointer to the source struct
> + * @first_src_member: The member name in @src where the copy begins
> + *
> + */
> +#define memcpy_trailing(dst, first_dst_member, last_dst_member,		   \
> +		        src, first_src_member)				   \
> +({									   \
> +	size_t __src_offset = offsetof(typeof(*(src)), first_src_member);  \
> +	size_t __src_size = sizeof(*(src)) - __src_offset;		   \
> +	size_t __dst_offset = offsetof(typeof(*(dst)), first_dst_member);  \
> +	size_t __dst_size = offsetofend(typeof(*(dst)), last_dst_member) - \
> +			    __dst_offset;				   \
> +	BUILD_BUG_ON(__src_size != __dst_size);				   \
> +	__builtin_memcpy((u8 *)(dst) + __dst_offset,			   \
> +			 (u8 *)(src) + __src_offset,			   \
> +			 __dst_size);					   \
> +})
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 8ab58781ae13..1918e6232319 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -465,10 +465,8 @@ static int arcturus_append_powerplay_table(struct smu_context *smu)
>   
>   	if ((smc_dpm_table->table_header.format_revision == 4) &&
>   	    (smc_dpm_table->table_header.content_revision == 6))
> -		memcpy(&smc_pptable->MaxVoltageStepGfx,
> -		       &smc_dpm_table->maxvoltagestepgfx,
> -		       sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_6, maxvoltagestepgfx));
> -
> +		memcpy_trailing(smc_pptable, MaxVoltageStepGfx, BoardReserved,
> +				smc_dpm_table, maxvoltagestepgfx);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 2e5d3669652b..b738042e064d 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -431,16 +431,16 @@ static int navi10_append_powerplay_table(struct smu_context *smu)
>   
>   	switch (smc_dpm_table->table_header.content_revision) {
>   	case 5: /* nv10 and nv14 */
> -		memcpy(smc_pptable->I2cControllers, smc_dpm_table->I2cControllers,
> -			sizeof(*smc_dpm_table) - sizeof(smc_dpm_table->table_header));
> +		memcpy_trailing(smc_pptable, I2cControllers, BoardReserved,
> +				smc_dpm_table, I2cControllers);
>   		break;
>   	case 7: /* nv12 */
>   		ret = amdgpu_atombios_get_data_table(adev, index, NULL, NULL, NULL,
>   					      (uint8_t **)&smc_dpm_table_v4_7);
>   		if (ret)
>   			return ret;
> -		memcpy(smc_pptable->I2cControllers, smc_dpm_table_v4_7->I2cControllers,
> -			sizeof(*smc_dpm_table_v4_7) - sizeof(smc_dpm_table_v4_7->table_header));
> +		memcpy_trailing(smc_pptable, I2cControllers, BoardReserved,
> +				smc_dpm_table_v4_7, I2cControllers);
>   		break;
>   	default:
>   		dev_err(smu->adev->dev, "smc_dpm_info with unsupported content revision %d!\n",
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index c8eefacfdd37..a6fd7ee314a9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -409,9 +409,8 @@ static int aldebaran_append_powerplay_table(struct smu_context *smu)
>   
>   	if ((smc_dpm_table->table_header.format_revision == 4) &&
>   	    (smc_dpm_table->table_header.content_revision == 10))
> -		memcpy(&smc_pptable->GfxMaxCurrent,
> -		       &smc_dpm_table->GfxMaxCurrent,
> -		       sizeof(*smc_dpm_table) - offsetof(struct atom_smc_dpm_info_v4_10, GfxMaxCurrent));
> +		memcpy_trailing(smc_pptable, GfxMaxCurrent, reserved,
> +				smc_dpm_table, GfxMaxCurrent);
>   	return 0;
>   }
>   
> 
