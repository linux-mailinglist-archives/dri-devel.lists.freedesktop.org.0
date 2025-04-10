Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2742A842D6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F037E10E0FD;
	Thu, 10 Apr 2025 12:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4RkYPJLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB4510E0FD;
 Thu, 10 Apr 2025 12:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvkT5FMuLxRhWDn9TUoti15iptNI0a09nXPxTt12bObyUyKcmj/7nIjlxI+uiFF2ZnFc9de3AjpzVlEXY5thqojqmzA7eARw4Sj4YIAHrJu3qrBFdj/HKg/U6C8D0kHsg+fuQWqN628eVM98CAcVW8nxZ8ZO9NJ6wwum35R/WvbnJ4Q3iubjDYj9lSAhnedkn5qrN4fk5x3Zk5ao8sc6RPtFrBLb3r6mmyVsbxrGy9no1VcTBWx3T39Hn2t93qG5/HyCs8oj1XD77PciLdrAOKeIwQkfCscc/9w7rSwshb4xxTdS0he8VjVYZE46Wcszkf/Zu4LvsVlpFg+OxaiklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5EG7T9chO405NL0+lu2Qf9Q7xMu4iq3hypufjj3fQs=;
 b=A542jmDeGoSjoec2tCj3e+eHHy16pDmOeKAv9JfvRdNBZj9h5v5k/OZ2doYtbp86D/58WPcNbQAz+fUzT2nVAbGzU0XJeAyEyhcP7mmg3tmJoFS5uv/+2xp/DagmbxLisHqohyur0u6Rh9s0IyWS/Y5i+4Vpc21STniEO37mmqMZXo6eDfRJFwBcfOha8363MyJex35tQ2XOjXr49tsJM+gNfyp6YJBUHecrpruCHrOYXiHaRXESPcgPDbjFi10BNfjwBsMoB0NSSDfdeb3T7maR4YKgYEhZtOu82e+DM66CrdQDfDeDhsEW1kwuAlIZnafr53indUE5KvWGnUKkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5EG7T9chO405NL0+lu2Qf9Q7xMu4iq3hypufjj3fQs=;
 b=4RkYPJLzgUiOErG0RO49HjqPQWmSfYbhdVq2Vkp5jVA2S37XIXOJrJ4sV/cbsW/bSfmkoxaPg+gJA1gyVPbHBXCa3E94OdMlq5kNP04E8E4ohH6cToAoEUjRYqmZ5xzvcRqSaZjAvHka+31M/wworymtuE1roPCsVsjJpnfpbZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 12:18:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 12:18:56 +0000
Message-ID: <cf4717bd-6c1d-4f3a-a0ab-ceb2170c47f2@amd.com>
Date: Thu, 10 Apr 2025 14:18:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/nouveau: Fix & improve nouveau_fence_done()
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <1cbb915240e5e09447ac8d04b5d2dc4165926de7.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1cbb915240e5e09447ac8d04b5d2dc4165926de7.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2e7ea5-625e-4a87-6805-08dd7829ddd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3ArbTh1dzBPcEtmcmhmVzgvRUI5cGtiazVsK0tobDFTSThWb2hRcGZvYm1M?=
 =?utf-8?B?VmdkODFyaG1XMkh5UXo0MXU3QzFCTW1yUnRJR09EaTM3WjlNbUZka3hHeXJN?=
 =?utf-8?B?RURoVFlhcndHRTVURi90TlNKQitURUVPZFBoT1FaMVJCc0FMK3BnemZVaTQw?=
 =?utf-8?B?cHFwdERRVW1LZVkrYzk2YUxld1lDVEQvSHEyOEUzUVVxa3N2VHZzbHVNNS9B?=
 =?utf-8?B?VksxWG8wTUFpeUVtajhGR2tVdnJkeDdxNzFXTGQ2bWtwcFl1UnZXYjRVL2V2?=
 =?utf-8?B?aU02eDBGY2wvQko5eXdncFdNRWN3UnVhN3lXdzFqdnlkUHZhOWE2U0hJblpw?=
 =?utf-8?B?UVczV2haWEo4NkNWQ2w2Qm5wUmZYK1gyYy8zZDdRdHZEMmZRbXVGL2RkT0sy?=
 =?utf-8?B?VjIvaDlTdllDOFptUWp5aUlTTW1udHVjdHB4akRBWExSNVJsTWRUZmhYeVph?=
 =?utf-8?B?SVpqLzIzMVVFeFdaeUZSSEQxYjB4K1l1ejJZTjFyMzQ4dk9zU2ZvMkVmTkEv?=
 =?utf-8?B?SEpmK05ESTdQWVdhby9tY2JydmFRVjNKdzI5U3JaV0ZPTjdqNG1MZjNNVEFT?=
 =?utf-8?B?VzR6MGUreFNBYVhWaWFmc1doTVI1dmJtUEwyU1FkV1pFM05zU01KRlJLdjg2?=
 =?utf-8?B?ZHRoL1VFMzZFemVTdTFzNG44S0pTVHcydE8yc1liYS9QSzBQUGc3d1VBVnZS?=
 =?utf-8?B?R2h5WXNxdHd6SHRBWVFtdmp4a3c1d2l2K1JXb3p5U213dVU1MzVZcjh6MUJk?=
 =?utf-8?B?TFpjTFBPOFhKR25RQVRkcXV4MnQwMVJKUkl2Z3l1MEY2YXZPUXFmTENuZEU5?=
 =?utf-8?B?TE9mUWk1Q0h4bFBucEdmVHBsWTlNeUFTK1VqYXVJeFpsdGZvK2xBSnRJOWdV?=
 =?utf-8?B?R25GYXpsTE9IWGc2ZmpSWDVTZnAyb3crc0lmM1NjbnV3WTF4b2FmWDF0eE9x?=
 =?utf-8?B?U2o1Ui9rZFZQREpaMURkNE95R2tCaDdFb3ZTTHFROGdKd2FnZXJsKy9kQjlN?=
 =?utf-8?B?ZTFrbE56Um02bHZmbUJtajdDaEZ4SER3aHd4WEJBOEg0dmpxbitoSm1XV3J4?=
 =?utf-8?B?NldHQUN6L0x3S1FnWmdqSFlFZGR4SVN2MDUrdUNFclhTS2xqemJDZ2VXVXFJ?=
 =?utf-8?B?MXVhTHR0TUxiVzFEMngwVXI2aWhTcHBxTGptNWd4TFhqRjlwNTQvaENNZU93?=
 =?utf-8?B?QktqcEg0V1AwYjQzUmNNL2VvQnJuMWVIM01tbWg0ZkROU2ZQSlppYWtDV0w2?=
 =?utf-8?B?UTg2NktqQThzR3FWMmJncHpwMzkyUjM4bDhVaTVtdDNpMjF0UnRvYlZtRVh3?=
 =?utf-8?B?RVJRbUVYTjNTNURiUG43aUNFRTBlamZMVlBJdVhCUS9xMVNZUW1DS2lLalNa?=
 =?utf-8?B?YlA1TVJYK3NWU0NHMFZNRTJwbWZ2NkFqSnJ0ZGh3c0Rjam0yTGNYS09EeDZk?=
 =?utf-8?B?dXdUQWlScmplODByQzlZWTdUQURhVGFzeDhWSC9oYUgxQkVNLzk3MlM5Z0J0?=
 =?utf-8?B?TjV2K0oxaHBMVjNRS0trV0R3SktmS0x3SHNiRHhuMTh6YklYOEZyaDRyL1Fj?=
 =?utf-8?B?ZDQ1TlJ0Y0dtS3d0VXIvbzg3SDRkMjZNY05lU0gxY2hvSUExb1pFN2txMHNK?=
 =?utf-8?B?eGluSWdZbXlUM0tYaEUrdThYWnZoQ3ROWlkxUFQrOHp5MzRlWURvUTJqZE9V?=
 =?utf-8?B?VllqbE9tR2VBaVJQbEVwU3JkcUNSNERMRjNIVWhXaEU2REl2dmhFdjc1djZ2?=
 =?utf-8?B?WTZudFphQWRwNEpJb1BiNTB3QU5jM1BidEs4SlBSSUtmVGZaL2x2SW1wQmlN?=
 =?utf-8?B?SGEzTGdYMHZYU1hldjBrK3VodHRMcFRNeU8reXlKZWhzQUJ0RVoyRFJRZ0F2?=
 =?utf-8?Q?g/egPJBAm/DMM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWRkU2hnSlA2UHJiNnpaVm1WSFZ5VE9peUg5ditaem96QlB4L2JsVVpHQ0NR?=
 =?utf-8?B?SWNsejNTYVpQa0lqRFJzeUs2TkcxWGpJbUVZU09rSGNUYURCclFrYUdjTXpS?=
 =?utf-8?B?cEJhT3FzVmw1MmkrRWExN0tZcEhZbFBiYndIcDN5Y2tFR0VhcFgzK2duNmpW?=
 =?utf-8?B?ajZ3YmhxMXoyMExrLzIrSmQ0WE91bGkydUc5MThwQ2hIeW1WVlNNWUVsb0lr?=
 =?utf-8?B?TG9FbUNuV0FYTFpCWjVOeENFWWYyWTBoSjk2QlBoR1ZLR2tBd1luRG9lcWlN?=
 =?utf-8?B?OXZiMXVSVnAzaThqQ1VHd3c4Sjc2Yzhyamt6Z3dXcWdkbW50T1YwaHFVNmtt?=
 =?utf-8?B?endxckVDM3FCbFdCRVlvd3VHbzFxV1V4dnA0YTBwSEZVUksxdEh1R1p6MmJu?=
 =?utf-8?B?YWl3dFpJUEJyN0RRRG9wYlpGNWo5OFNhcWxQb1h2YkFuZUxhN1FpaU1RVUdW?=
 =?utf-8?B?d2srUWhYS1VSZDdHUXBDa1dJMkhlSFhiYVRsb2tzWG8rNWw4Q2RSTVVGMUg1?=
 =?utf-8?B?Wjl2bHBUR1AvTzF4WGN2OGtiYVZuNlIxYzlGOEJsTGRQY2hYdGJVTDJRT0Rk?=
 =?utf-8?B?VVlzbUVDWFVJRTRKM29mU0RwU0NmNU9OOGdzWVVLaWNIMDk3clc2ck1VdUli?=
 =?utf-8?B?YytMVjJ1WnRFZGVrRThFc1hDc01sb2s4MWFjTmxRTmcyLzdKQTFkWU5hTjlt?=
 =?utf-8?B?MXViZGhaQzJtMExHNlFaZ2lZYnFEbGRvcFdKRUN1Z2RXV3V4dHlaUmRyNkh3?=
 =?utf-8?B?OFJ0aC82RWgrVDhieEVTV3NoWElWVnJPaWZxSUlkeE5uVkd5TEgvZjQybjJz?=
 =?utf-8?B?NThldEQ2cks1T21MdGJMUVUxc1JqZGR0U1k4ODlDWnFkRDhEaFQ4cHJTUEtp?=
 =?utf-8?B?NXVxeVdjdnZhbVdmTTRQdXgxM2VEdnd0MmcvcG5CdDJKSnMwc0E2Q2FucHRD?=
 =?utf-8?B?c1htOEVsZS9SVHRyR213cFZNR3NvSUxDYWdONjkyaWs2azJZb01TblVHZW94?=
 =?utf-8?B?bTR3YkVHcmVmNVR5ZlFLUDNqTTJxM2l2Vk13OSs4SHNEam5UVFR6bzN1MXZX?=
 =?utf-8?B?Rlk4T1dySHVJOXZGRmJzcWcwNzBFek9NVjRtemNFUy9QZjdobVM1MHQzdjFi?=
 =?utf-8?B?S2F2N2E1cW50b3lJcmhra1BSUUpxTE1NenNMY2RJOUJaNEJMc1pIN0tSTFJu?=
 =?utf-8?B?Z09QaHQrMkR3VHZUZG1sQWVjVFZleVZGbzQvUVdOKzFLaE9CS3BlVGVtdjB0?=
 =?utf-8?B?Zk9wbUlvaDcrdnhXM2Jxb1h6Tk9HYUZtMzlLcnhhNXZhRjRRMmc4VlhWVG93?=
 =?utf-8?B?aGNxa0FCVnRKMWRYNi8wVWkwZ2JSRnpJRnlnUlpDR1ZFLzVRZUp5TzBqRWxO?=
 =?utf-8?B?TWNHMjgwQ3hKdnNKZFd4a1ZYQ29DanBEaHE5NlV2VlV0OVRQWmpjWlFlUVZh?=
 =?utf-8?B?c2N2eC9ud0w2RTQ3c09XVHNicG1KdGE1Q3huUnJDNkMrSGJCL1hueXRmWXYv?=
 =?utf-8?B?YTAwYUwyTzUyWUxGZ1BGU0pQUUpxSHNFd3U0ajBtZ1JpeWdUdktIdUNDSy9V?=
 =?utf-8?B?V2ZValVudjBuMml5OUd2TGRadUVpKzlCT3FwLzJKa2kwbEl3c0JLejJqcFJZ?=
 =?utf-8?B?Um1JZGRnMVhJSU5RVjUxODlqOXcxeWRyeTJuc2pHMTMzZk4zWFdnTW9LRXdZ?=
 =?utf-8?B?TDVJZnIwYjhnamlhWXpFYXFJR2M3OUYwSzB3cVdGVFUzcnRETGsyY1FreTFx?=
 =?utf-8?B?N3UreEVyVUIvdzZLeHlRbWphc1l4VVdsK3RGQmFTQTI5bG5GU2Z2MHZwWEk3?=
 =?utf-8?B?QjVqaGxseXJkVkg3M1lUV25abHdiOHpvWm9CT0RUT0ZndjUzWWJzaTVpTFNo?=
 =?utf-8?B?bCtSQzFlMTJxUmUrOWhQZ1QyaytBMC9nTURPVjlmeTBMRTJlaTh5cjBvRXZD?=
 =?utf-8?B?cHB4MldZbUtlaWwvM29rYzRlZEEyL1FmTTBWQjB3M2pET0Z2K3YzMFNiaGdY?=
 =?utf-8?B?czlrT3BLWHNtZ0tEREwrNjRIMndpemZoZ2Z4U2syMlVHVThLajd1b0dBNjdV?=
 =?utf-8?B?d2NIV0REWFVYNlVQNXhmbnVZVDBqN1FXOU1kNHFvc1ZKMnZkM085aXZiM2Qw?=
 =?utf-8?Q?QetKpB5WpoUokX744Y52cT3i6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2e7ea5-625e-4a87-6805-08dd7829ddd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:18:56.8608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYvzdIk9N7INBtdzCe4QgB0XSwr9PJ06H1TypXUiUZGT7R2fN2V9dp6LvzFKjIc8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571
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

Am 10.04.25 um 11:51 schrieb Philipp Stanner:
> On Thu, 2025-04-10 at 11:24 +0200, Philipp Stanner wrote:
>> Contains two patches improving nouveau_fence_done(), and one
>> addressing
>> an actual bug (race):
> Oops, that's the wrong calltrace. Here we go:
>
> [ 85.791794] Call Trace: [ 85.791796] <TASK> [ 85.791797] ? nouveau_fence=
_context_kill (/home/imperator/linux/./include/linux/dma-fence.h:587 (discr=
iminator 9) /home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_fence.c:9=
4 (discriminator 9)) nouveau [ 85.791874] ? __warn.cold (/home/imperator/li=
nux/kernel/panic.c:748) [ 85.791878] ? nouveau_fence_context_kill (/home/im=
perator/linux/./include/linux/dma-fence.h:587 (discriminator 9) /home/imper=
ator/linux/drivers/gpu/drm/nouveau/nouveau_fence.c:94 (discriminator 9)) no=
uveau [ 85.791950] ? report_bug (/home/imperator/linux/lib/bug.c:180 /home/=
imperator/linux/lib/bug.c:219) [ 85.791953] ? handle_bug (/home/imperator/l=
inux/arch/x86/kernel/traps.c:260) [ 85.791956] ? exc_invalid_op (/home/impe=
rator/linux/arch/x86/kernel/traps.c:309 (discriminator 1)) [ 85.791957] ? a=
sm_exc_invalid_op (/home/imperator/linux/./arch/x86/include/asm/idtentry.h:=
621) [ 85.791960] ? nouveau_fence_context_kill (/home/imperator/linux/./inc=
lude/linux/dma-fence.h:587 (discriminator 9) /home/imperator/linux/drivers/=
gpu/drm/nouveau/nouveau_fence.c:94 (discriminator 9)) nouveau [ 85.792028] =
drm_sched_fini.cold (/home/imperator/linux/./include/trace/../../drivers/gp=
u/drm/scheduler/gpu_scheduler_trace.h:72 (discriminator 1)) gpu_sched [ 85.=
792033] ? drm_sched_entity_kill.part.0 (/home/imperator/linux/drivers/gpu/d=
rm/scheduler/sched_entity.c:243 (discriminator 2)) gpu_sched [ 85.792037] n=
ouveau_sched_destroy (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau=
_sched.c:509 /home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_sched.c:=
518) nouveau [ 85.792122] nouveau_abi16_chan_fini.isra.0 (/home/imperator/l=
inux/drivers/gpu/drm/nouveau/nouveau_abi16.c:188) nouveau [ 85.792191] nouv=
eau_abi16_fini (/home/imperator/linux/drivers/gpu/drm/nouveau/nouveau_abi16=
.c:224 (discriminator 3)) nouveau [ 85.792263] nouveau_drm_postclose (/home=
/imperator/linux/drivers/gpu/drm/nouveau/nouveau_drm.c:1240) nouveau [ 85.7=
92349] drm_file_free (/home/imperator/linux/drivers/gpu/drm/drm_file.c:255)=
 [ 85.792353] drm_release (/home/imperator/linux/./arch/x86/include/asm/ato=
mic.h:67 (discriminator 1) /home/imperator/linux/./include/linux/atomic/ato=
mic-arch-fallback.h:2278 (discriminator 1) /home/imperator/linux/./include/=
linux/atomic/atomic-instrumented.h:1384 (discriminator 1) /home/imperator/l=
inux/drivers/gpu/drm/drm_file.c:428 (discriminator 1)) [ 85.792355] __fput =
(/home/imperator/linux/fs/file_table.c:464) [ 85.792357] task_work_run (/ho=
me/imperator/linux/kernel/task_work.c:227) [ 85.792360] do_exit (/home/impe=
rator/linux/kernel/exit.c:939) [ 85.792362] do_group_exit (/home/imperator/=
linux/kernel/exit.c:1069) [ 85.792364] get_signal (/home/imperator/linux/ke=
rnel/signal.c:3036) [ 85.792366] arch_do_signal_or_restart (/home/imperator=
/linux/./arch/x86/include/asm/syscall.h:38 /home/imperator/linux/arch/x86/k=
ernel/signal.c:264 /home/imperator/linux/arch/x86/kernel/signal.c:339) [ 85=
.792369] syscall_exit_to_user_mode (/home/imperator/linux/kernel/entry/comm=
on.c:113 /home/imperator/linux/./include/linux/entry-common.h:329 /home/imp=
erator/linux/kernel/entry/common.c:207 /home/imperator/linux/kernel/entry/c=
ommon.c:218) [ 85.792372] do_syscall_64 (/home/imperator/linux/./arch/x86/i=
nclude/asm/cpufeature.h:172 /home/imperator/linux/arch/x86/entry/common.c:9=
8) [ 85.792373] ? syscall_exit_to_user_mode_prepare (/home/imperator/linux/=
./include/linux/audit.h:357 /home/imperator/linux/kernel/entry/common.c:166=
 /home/imperator/linux/kernel/entry/common.c:200) [ 85.792376] ? syscall_ex=
it_to_user_mode (/home/imperator/linux/./arch/x86/include/asm/paravirt.h:68=
6 /home/imperator/linux/./include/linux/entry-common.h:232 /home/imperator/=
linux/kernel/entry/common.c:206 /home/imperator/linux/kernel/entry/common.c=
:218) [ 85.792377] ? do_syscall_64 (/home/imperator/linux/./arch/x86/includ=
e/asm/cpufeature.h:172 /home/imperator/linux/arch/x86/entry/common.c:98) [ =
85.792378] entry_SYSCALL_64_after_hwframe (/home/imperator/linux/arch/x86/e=
ntry/entry_64.S:130) [ 85.792381] RIP: 0033:0x7ff950b6af70 [ 85.792383] Cod=
e: Unable to access opcode bytes at 0x7ff950b6af46. objdump: '/tmp/tmp.sfPR=
l5k2te.o': No such file Code starting with the faulting instruction =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [ 85.792383] RSP: 002b:000=
07ff93cdfb6f0 EFLAGS: 00000293 ORIG_RAX: 000000000000010f [ 85.792385] RAX:=
 fffffffffffffdfe RBX: 000055d386d61870 RCX: 00007ff950b6af70 [ 85.792386] =
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 00007ff928000b90 [ 85.7923=
87] RBP: 00007ff93cdfb740 R08: 0000000000000008 R09: 0000000000000000 [ 85.=
792388] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000001 [=
 85.792388] R13: 0000000000000000 R14: 0000000000000000 R15: 00007ff951b10b=
40 [ 85.792390] </TASK> [ 85.792391] ---[ end trace 0000000000000000 ]---

I think I understand the problem now as well, but that backtrace is complet=
ely mangled in the mail.

It would be nice if you could send that out again.

Thanks,
Christian.

>
> By the way, for reference:
> I did try whether it could be done to have nouveau_fence_signal()
> incorporated into nouveau_fence_update() and nouveau_fence_done().
> This, however, would then cause a race with the list_del() in
> nouveau_fence_no_signaling(), WARNing because of the list poison.
>
> So the "solution" space is:
>  * A cleanup callback on the dma_fence.
>  * Keeping the current race or
>  * replacing it with another race with another function.
>  * Just preventing nouveau_fence_done() from signaling fences other
>    than through nouveau_fence_update/signal
>
> The later seems clearly like the cleanest solution to me. Alternative
> would be a work-intensive rework of all the misdesigns broken in
> nouveau_fence.c
>
>
> P.
>
>> [=C2=A0=C2=A0 39.848463] WARNING: CPU: 21 PID: 1734 at
>> drivers/gpu/drm/nouveau/nouveau_fence.c:509
>> nouveau_fence_no_signaling+0xac/0xd0 [nouveau]
>> [=C2=A0=C2=A0 39.848551] Modules linked in: snd_seq_dummy snd_hrtimer
>> nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
>> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_ine
>> t nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat
>> nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set
>> nf_tables qrtr sunrpc snd_sof_pci_intel_
>> tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic snd_sof_pci
>> snd_sof_xtensa_dsp snd_sof_intel_hda_common snd_soc_hdac_hda
>> snd_sof_intel_hda snd_sof snd_sof_utils snd
>> _soc_acpi_intel_match snd_soc_acpi snd_soc_acpi_intel_sdca_quirks
>> snd_sof_intel_hda_mlink snd_soc_sdca snd_soc_avs snd_ctl_led
>> snd_soc_hda_codec intel_rapl_msr snd_hda_
>> codec_realtek snd_hda_ext_core intel_rapl_common
>> snd_hda_codec_generic snd_soc_core snd_hda_scodec_component
>> intel_uncore_frequency intel_uncore_frequency_common snd_hd
>> a_codec_hdmi intel_ifs snd_compress i10nm_edac skx_edac_common nfit
>> snd_hda_intel snd_intel_dspcfg libnvdimm snd_hda_codec binfmt_misc
>> snd_hwdep snd_hda_core snd_seq sn
>> d_seq_device dell_wmi
>> [=C2=A0=C2=A0 39.848575]=C2=A0 dell_pc x86_pkg_temp_thermal spi_nor plat=
form_profile
>> sparse_keymap intel_powerclamp dax_hmem snd_pcm cxl_acpi coretemp
>> cxl_port iTCO_wdt mtd rapl intel
>> _pmc_bxt pmt_telemetry cxl_core dell_wmi_sysman pmt_class
>> iTCO_vendor_support snd_timer isst_if_mmio vfat intel_cstate
>> dell_smbios dcdbas fat dell_wmi_ddv dell_smm_hwmo
>> n dell_wmi_descriptor firmware_attributes_class wmi_bmof intel_uncore
>> einj pcspkr isst_if_mbox_pci atlantic snd isst_if_common intel_vsec
>> e1000e macsec mei_me i2c_i801=20
>> spi_intel_pci soundcore i2c_smbus spi_intel mei joydev loop nfnetlink
>> zram nouveau drm_ttm_helper ttm polyval_clmulni iaa_crypto gpu_sched
>> polyval_generic rtsx_pci_sdmm
>> c ghash_clmulni_intel i2c_algo_bit mmc_core drm_gpuvm sha512_ssse3
>> nvme drm_exec drm_display_helper sha256_ssse3 idxd sha1_ssse3 cec
>> nvme_core idxd_bus rtsx_pci nvme_au
>> th pinctrl_alderlake ip6_tables ip_tables fuse
>> [=C2=A0=C2=A0 39.848603] CPU: 21 UID: 42 PID: 1734 Comm: gnome-shell Tai=
nted:
>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.14.0-rc4+ #11
>> [=C2=A0=C2=A0 39.848605] Tainted: [W]=3DWARN
>> [=C2=A0=C2=A0 39.848606] Hardware name: Dell Inc. Precision 7960 Tower/0=
1G0M6,
>> BIOS 2.7.0 12/17/2024
>> [=C2=A0=C2=A0 39.848607] RIP: 0010:nouveau_fence_no_signaling+0xac/0xd0
>> [nouveau]
>> [=C2=A0=C2=A0 39.848688] Code: db 74 17 48 8d 7b 38 b8 ff ff ff ff f0 0f=
 c1 43
>> 38 83 f8 01 74 29 85 c0 7e 17 31 c0 5b 5d c3 cc cc cc cc e8 76 b2 c5
>> f0 eb 96 <0f> 0b e9 67 ff ff f
>> f be 03 00 00 00 e8 83 76 33 f1 31 c0 eb dd e8
>> [=C2=A0=C2=A0 39.848690] RSP: 0018:ff1cc1ffc5c039f0 EFLAGS: 00010046
>> [=C2=A0=C2=A0 39.848691] RAX: 0000000000000001 RBX: ff175a3b504da980 RCX=
:
>> ff175a3b4801e008
>> [=C2=A0=C2=A0 39.848692] RDX: ff175a3b43e7bad0 RSI: ffffffffc09d3fda RDI=
:
>> ff175a3b504da980
>> [=C2=A0=C2=A0 39.848693] RBP: ff175a3b504da9c0 R08: ffffffffc09e39df R09=
:
>> 0000000000000001
>> [=C2=A0=C2=A0 39.848694] R10: 0000000000000001 R11: 0000000000000000 R12=
:
>> ff175a3b6d97de00
>> [=C2=A0=C2=A0 39.848695] R13: 0000000000000246 R14: ff1cc1ffc5c03c60 R15=
:
>> 0000000000000001
>> [=C2=A0=C2=A0 39.848696] FS:=C2=A0 00007fc5477846c0(0000) GS:ff175a5a502=
80000(0000)
>> knlGS:0000000000000000
>> [=C2=A0=C2=A0 39.848698] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 000000008=
0050033
>> [=C2=A0=C2=A0 39.848699] CR2: 000055cb7613d1a8 CR3: 000000012e5ce004 CR4=
:
>> 0000000000f71ef0
>> [=C2=A0=C2=A0 39.848700] DR0: 0000000000000000 DR1: 0000000000000000 DR2=
:
>> 0000000000000000
>> [=C2=A0=C2=A0 39.848701] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7=
:
>> 0000000000000400
>> [=C2=A0=C2=A0 39.848702] PKRU: 55555554
>> [=C2=A0=C2=A0 39.848703] Call Trace:
>> [=C2=A0=C2=A0 39.848704]=C2=A0 <TASK>
>> [=C2=A0=C2=A0 39.848705]=C2=A0 ? nouveau_fence_no_signaling+0xac/0xd0 [n=
ouveau]
>> [=C2=A0=C2=A0 39.848782]=C2=A0 ? __warn.cold+0x93/0xfa
>> [=C2=A0=C2=A0 39.848785]=C2=A0 ? nouveau_fence_no_signaling+0xac/0xd0 [n=
ouveau]
>> [=C2=A0=C2=A0 39.848861]=C2=A0 ? report_bug+0xff/0x140
>> [=C2=A0=C2=A0 39.848863]=C2=A0 ? handle_bug+0x58/0x90
>> [=C2=A0=C2=A0 39.848865]=C2=A0 ? exc_invalid_op+0x17/0x70
>> [=C2=A0=C2=A0 39.848866]=C2=A0 ? asm_exc_invalid_op+0x1a/0x20
>> [=C2=A0=C2=A0 39.848870]=C2=A0 ? nouveau_fence_no_signaling+0xac/0xd0 [n=
ouveau]
>> [=C2=A0=C2=A0 39.848943]=C2=A0 nouveau_fence_enable_signaling+0x32/0x80 =
[nouveau]
>> [=C2=A0=C2=A0 39.849016]=C2=A0 ? __pfx_nouveau_fence_cleanup_cb+0x10/0x1=
0 [nouveau]
>> [=C2=A0=C2=A0 39.849088]=C2=A0 __dma_fence_enable_signaling+0x33/0xc0
>> [=C2=A0=C2=A0 39.849090]=C2=A0 dma_fence_add_callback+0x4b/0xd0
>> [=C2=A0=C2=A0 39.849093]=C2=A0 nouveau_fence_emit+0xa3/0x260 [nouveau]
>> [=C2=A0=C2=A0 39.849166]=C2=A0 nouveau_fence_new+0x7d/0xf0 [nouveau]
>> [=C2=A0=C2=A0 39.849242]=C2=A0 nouveau_gem_ioctl_pushbuf+0xe8f/0x1300 [n=
ouveau]
>> [=C2=A0=C2=A0 39.849338]=C2=A0 ? __pfx_nouveau_gem_ioctl_pushbuf+0x10/0x=
10 [nouveau]
>> [=C2=A0=C2=A0 39.849431]=C2=A0 drm_ioctl_kernel+0xad/0x100
>> [=C2=A0=C2=A0 39.849433]=C2=A0 drm_ioctl+0x288/0x550
>> [=C2=A0=C2=A0 39.849435]=C2=A0 ? __pfx_nouveau_gem_ioctl_pushbuf+0x10/0x=
10 [nouveau]
>> [=C2=A0=C2=A0 39.849526]=C2=A0 nouveau_drm_ioctl+0x57/0xb0 [nouveau]
>> [=C2=A0=C2=A0 39.849620]=C2=A0 __x64_sys_ioctl+0x94/0xc0
>> [=C2=A0=C2=A0 39.849621]=C2=A0 do_syscall_64+0x82/0x160
>> [=C2=A0=C2=A0 39.849623]=C2=A0 ? drm_ioctl+0x2b7/0x550
>> [=C2=A0=C2=A0 39.849625]=C2=A0 ? __pfx_nouveau_gem_ioctl_pushbuf+0x10/0x=
10 [nouveau]
>> [=C2=A0=C2=A0 39.849719]=C2=A0 ? ktime_get_mono_fast_ns+0x38/0xd0
>> [=C2=A0=C2=A0 39.849721]=C2=A0 ? __pm_runtime_suspend+0x69/0xc0
>> [=C2=A0=C2=A0 39.849724]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x15e=
/0x1a0
>> [=C2=A0=C2=A0 39.849726]=C2=A0 ? syscall_exit_to_user_mode+0x10/0x200
>> [=C2=A0=C2=A0 39.849729]=C2=A0 ? do_syscall_64+0x8e/0x160
>> [=C2=A0=C2=A0 39.849730]=C2=A0 ? exc_page_fault+0x7e/0x1a0
>> [=C2=A0=C2=A0 39.849733]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [=C2=A0=C2=A0 39.849735] RIP: 0033:0x7fc5576fe0ad
>> [=C2=A0=C2=A0 39.849736] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d=
 45 10
>> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
>> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28
>> 00 00 00
>> [=C2=A0=C2=A0 39.849737] RSP: 002b:00007ffc002688a0 EFLAGS: 00000246 ORI=
G_RAX:
>> 0000000000000010
>> [=C2=A0=C2=A0 39.849739] RAX: ffffffffffffffda RBX: 000055cb74e316c0 RCX=
:
>> 00007fc5576fe0ad
>> [=C2=A0=C2=A0 39.849740] RDX: 00007ffc00268960 RSI: 00000000c0406481 RDI=
:
>> 000000000000000e
>> [=C2=A0=C2=A0 39.849741] RBP: 00007ffc002688f0 R08: 0000000000000000 R09=
:
>> 000055cb74e35560
>> [=C2=A0=C2=A0 39.849742] R10: 0000000000000014 R11: 0000000000000246 R12=
:
>> 00007ffc00268960
>> [=C2=A0=C2=A0 39.849744] R13: 00000000c0406481 R14: 000000000000000e R15=
:
>> 000055cb74e3cd10
>> [=C2=A0=C2=A0 39.849746]=C2=A0 </TASK>
>> [=C2=A0=C2=A0 39.849746] ---[ end trace 0000000000000000 ]---
>> [=C2=A0=C2=A0 39.849776] ------------[ cut here ]------------
>>
>>
>> This is the first WARN_ON() in dma_fence_set_error(), called by
>> nouveau_fence_context_kill().
>>
>> It's rare, but it is a bug, or rather: the archetype of a race, since
>> (as Christian pointed out) nouveau_fence_update() later at some point
>> will remove the signaled fence (by signaling it again).
>>
>>
>> P.
>>
>>
>> Philipp Stanner (3):
>> =C2=A0 drm/nouveau: Prevent signaled fences in pending list
>> =C2=A0 drm/nouveau: Remove surplus if-branch
>> =C2=A0 drm/nouveau: Add helper to check base fence
>>
>> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 32 ++++++++++++++-------=
--
>> --
>> =C2=A01 file changed, 18 insertions(+), 14 deletions(-)
>>

