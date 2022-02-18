Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12D44BB58D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B8C10EDC5;
	Fri, 18 Feb 2022 09:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2743F10EE7C;
 Fri, 18 Feb 2022 09:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSrkOjTHSyZ188nBlAnwEf0iUNqnmpIsJWOl+oD3fg7yxXdPPT+vRgDm5Gjvfy3UisX28jHphWlSamASYQKWrbkkkJLkjEU2NL3Y36wXntEvocYxYQBQWaX4DuFum1syK7MPOQH4Qjb36zdG7f/07+K9oUpBTx5iLVo38Kgjgt0gJVBw5Kd4WE2tfQX8XZu5gbRaZxGv4rwqpaBnk0W1ai0tqF77K9WiBnuw/SCatB33ayCgqScHyFfRjaPz8CaLr9/wZpcdhNXJbUtuQTwr1qz6Yyahwl6g+VjM20vu/2Y7o5y9g1QBXWR0n3TsXdh/T64qUUnMdXDwfMhBwe6LEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7W1VkQDR++Lk9Zhzc2wcB0KJX+8Ij4yvt6Il/3scQw=;
 b=UrMTNcsy92k7Rous25dDNc+3LB6KaoxELupr2xA0bOrVhTLLR0jePoeXwdGL1h8AGzUGAmZUrNB4pvbx+lmLCsiHHyvEs9fppoG6infRwT4cSevXmQD5bcqIqacWFUrF9IuKs+c8J0oAg+E0DqdSM2kkC8migurnskrAKqseDUruy848urDFLm0idlHJbVb14SZXvNd1ODqWC3kZPTSjj5YBwam95wVdeOo/8B8W9WUry/CTwTPixggH8c/PgHY3/9KqG5j6h0GBwe4XqzRYWs4ynKsY1xlDm9mQddRYMzSeWYWSxLhq84s/lWSlhg3nhWoQ5ZEli6nRiuHIOmZi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7W1VkQDR++Lk9Zhzc2wcB0KJX+8Ij4yvt6Il/3scQw=;
 b=Eey/0AZbTZX1ib8lz52n03ud4v/ziAAFQL1UAqywTzRFvf8ev8lVCzIHdWrxTPEPIs323spSUVo7Lte+soVnr0gCSJsee8YV4OHGfuQSS7ej8F8qmjN/EtC4pH9ZjuUUQmee6JMlKg8EFN3igi2bTc0hTQ4bSEKh9+ndlIJF2Ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Fri, 18 Feb
 2022 09:27:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.022; Fri, 18 Feb 2022
 09:27:19 +0000
Message-ID: <d830bb82-63ea-2de6-6d10-3a401ac0dcf0@amd.com>
Date: Fri, 18 Feb 2022 10:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Content-Language: en-US
To: Qiang Yu <yuq825@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
 <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
 <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
 <6711073b-8771-5750-33f7-b72333b411c6@amd.com>
 <CAKGbVbvR+msXjrsXmDM8QTmsCP03hL5-q5CTJBYu4mm=NQd01A@mail.gmail.com>
 <a11b7073-6597-8e87-b724-33acab32e791@gmail.com>
 <CAKGbVbuJ-QdeoMTg=_O=1x5A5tbqZftsjt8aCCoVkAekci0USA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbuJ-QdeoMTg=_O=1x5A5tbqZftsjt8aCCoVkAekci0USA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0701CA0001.eurprd07.prod.outlook.com
 (2603:10a6:203:51::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50d2fecb-6246-4517-bbb0-08d9f2c0dc42
X-MS-TrafficTypeDiagnostic: DM4PR12MB5818:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB58187CF74C53C505E0D5A51E83379@DM4PR12MB5818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TI/HUILqj2MaQigtcZ0bhtuhqsfXjS8vxzYjCg3cTByVEBlih8L5s+7s3IkIuucZpsUh2rTFLJ5o4ZJSqmteUsPi++qg7VALd+S2yN1WmXTLEKUZxSIyCPO4B5GNBjA8uYyTDJk8VOZaCP6iJKgFiJdeE5XSv5/a+SK1PKy2hut2oKSPMh3Wftvb/GkMB2lDPQcCoqQiPYwZrimj6VQmi2ZJOvygNddcL/WUDbt6yi5D9V0RseCYkjS6i0aG96ORaWylJAeMYrLUwOKpDByUo+Mzp+kZ7EXQdBDZnbUM6hkYC5YG+P9wSM+IP9n23Yc1sYQ2qbkipaMK3rFZIRJNdTNSwGjUiICBXuFpAT6Cb5Yl4GC+/8eEfzJX4+6uiqzmDpwel96Ool2wbqaFXjaoEgtXaod1WVbTsvKopIEEO9QoYFavwyqyNE9oSoPm+OSH8ED7ZWITVZhEQQYQ7AAh9Etvklvh82h9OaDsnTzk9yDBsV3uem4rlaiomgmL+qu/PDg2xmcQxoB9+QJFdLPmbEgvxYjCoH/56CASjSO8cs/jmbicjzWXFKTqSGymzvdAFQgWVWpJ8ZdhFXTIUBRpRtcO7bpa8+E7v2NP1zgz4ffELtSdB58iL0JWXm/a3KOQtaAk2XxwRlkKOL2XLuocV07HW0vKc1Al8fPxAGzf7P2CzV3Xoaz0cNqv3YEI8v8TJzmXq7F+BB9D3g03mAyZVToecJDaXg6z3sU3y1crVWEdZiEmo17MRq+ezO1jq8+Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(8936002)(4326008)(2616005)(2906002)(316002)(83380400001)(186003)(6666004)(26005)(6486002)(110136005)(8676002)(31696002)(508600001)(66946007)(66476007)(6506007)(6512007)(66556008)(7416002)(66574015)(86362001)(5660300002)(30864003)(36756003)(31686004)(54906003)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEZzdWwxa1VnYUJ2YnJzcWt0aFFOQXRwRnpUNGVsQkdscDlpcUxLK1pPdmF5?=
 =?utf-8?B?MysvNGU3SmxsNjFSTnBwN0NmTW12TGk3c2NYeVVwRndWMDBjSEhsUjZMRnRS?=
 =?utf-8?B?S2Q5MERMOTdNVEIvek5WMzFKdUlJNUFvd3NyZ3IxbjJSRkU2TEppWENHOHpT?=
 =?utf-8?B?Qmg1czBrZE40dkRNamlTdHpON1ZCZkdDbFM4WWh5amQ4WWpVdFNKVUdiRnl4?=
 =?utf-8?B?SjJLUzViOC9BeUdyZnpIc2NoMVN3VnhZaDJoV3lrcG0xSXZzQlJIVS9PWDJ2?=
 =?utf-8?B?ZU5yWmNoSHk2VWxvL1VyMWhlYTQ2cUZENUVJa1YvSTYwV3Fhb0FSMkY1R2Z3?=
 =?utf-8?B?TzlESXg3Q2UzbmpuWWU2OWREaDZLUVFnMmxSdzFMamlIcTAzcFF2SnV5RVF2?=
 =?utf-8?B?WFllVUhXeHF0Zmc4bEZEZnU3bDNBWWQxV0syRlJ1SVNCOU1SUDNkTUVjSGwy?=
 =?utf-8?B?cDkzN1VBYmZrcEM4aXZjYmdaZEw2Y3orbVNlTlJlL1VvRmdJYUltVXFXR0RK?=
 =?utf-8?B?ZXp3eU8va0sxK3FiS2tTS3dXc0pqYTR0cUtranBEdUoyTFVCd1B6TWpnMVFI?=
 =?utf-8?B?N3BjWVFJSzlSanh3ZTVwZ3ZLNlZZQVZxRGdsZFU1VzViN3N3QnFEYmM3ZTBP?=
 =?utf-8?B?UVU1eWpKSUpYanowRDNZb2FaaXpHMEZCK2hlS1Y2ZDBTMnVoS3ZWazdZa0hQ?=
 =?utf-8?B?alo5dGdNWEtjUVlFNHBiczVNRnpGMTZCOXEwVi93UDB2ZldLWTgxR2V2Z0xF?=
 =?utf-8?B?V0JEVU9GWllDTnNNK2J0WlZ6K1RKeUIyUTNzMHI5M0JiVXJ5bUZqOFFlUUUw?=
 =?utf-8?B?ZTRCSVczK1VMTEYrcXQrZUloYWpKbkVQRFNmdFZxU05ybFJoRnhOMUxweEFk?=
 =?utf-8?B?bS95T3gxeVJ5M2FGbGpLakZ4Yk1WUUovMmp2YmNLUzgzdlRod0pJdmx0UHlE?=
 =?utf-8?B?VTRYRENoUUNDTzJKenhWa2hZcVF1Uk45S29jVWkxSjZESDhxalpkc0dIRk1H?=
 =?utf-8?B?TzVta3hadUpnZTU5ZEFjVTBjM3IrSmdjRG01ZDFLczUra05OWGt3b2pVTlh4?=
 =?utf-8?B?YisyWVZpaDFCTnRCQTU4OVAwRmhLR2VrZTA2SE9pWUtnYkdCRFliS1J6T2Vq?=
 =?utf-8?B?am1YWjJwRmZlV0dHaVQzeHpmM2hYWDJFMHBUUTVkOG8yY2FyL3cvd3ZWTXVy?=
 =?utf-8?B?Z0k1SUQzU2V4THgyUE9TZXZtOElKYTJlc0ptS2dDQUxYaWJaOXkzcFl0ekZZ?=
 =?utf-8?B?SGpHSkRMck5jNDNBS1hkWDY5M05PaGtTaVo5dUQwa0NoYmgvUm82dlFSVWpX?=
 =?utf-8?B?OEkvRm93eWVWMGVHbkp3WnpZWWcvTU5EWVMrVzJLSitYeGdXbFBXNEtQbUJC?=
 =?utf-8?B?UWlTYktJMmx0Nk5qbWRxaXozOGJwTWdMTm5XcWhDWG9sOGFuc255V2lLVFUx?=
 =?utf-8?B?NWd0OHVidWwyNUFRa2d5QzMrNitrajMwK3UwZXZWd1NQU083dFJub1hwcjR6?=
 =?utf-8?B?YWl2eE1XUlNFYjRWdVkvVnFvQ3lpMUIzS0hBLzBuc0o2VU9vdHh5NlNOMW04?=
 =?utf-8?B?M0xQSnRIVVZHdzhFZ0liQmV2R2d5Z1UyU2Z5Zk1WTUo5RXZPNzRWQmhjUy82?=
 =?utf-8?B?SXpOZ0hVQ2hDdW4zMUorQ3dCeXgzUkNKb2VObEF0WkNwNmZ5Q2hIejk2Tm9w?=
 =?utf-8?B?a0tUU2Q3aUE3OG5ySEFRUlNseUhGWWZHVUZWWHNZSHJTaDhNNXBzN3JvREdL?=
 =?utf-8?B?eW9saXYyTGhtSkJheHZLNzFvL2l1TzlYYTV3RFN0K3E5M3hPeEJ5eHRuOUNV?=
 =?utf-8?B?WTBjWFdweXRFeXM4MnJwY0NEeThFVExWK2VRUndTU3o4L05QdFhtRkpKK2ZR?=
 =?utf-8?B?MnRsRnhFaFE0ZU1yS3NsOGhqK1VyeitraWZvbTZ6dGxHZVB1NXpjTzYvR01N?=
 =?utf-8?B?Ylc0dHdLa3F2VXF1dlFYeUJGdEJaaStLZ3RDSDdYcHlQbHdFOGRoVllhZ0c2?=
 =?utf-8?B?R0hHazhuWFQrbjdPNUhIUmZvQW5Ga3VWZ1oyR2J6bDNCNHBZWE41dlRBNlg0?=
 =?utf-8?B?djY3aTB0VWt4Vjd3ZEVaNHZOWFZIZXRya1MyT1dJU3hSNmpVcDVtYjNpK09o?=
 =?utf-8?Q?ObJM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d2fecb-6246-4517-bbb0-08d9f2c0dc42
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 09:27:19.4514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA7ZZ7eAH6X0O7uUEVIyD2aDjb5dTITE5Z9SMuRk89PtRKbXWgczVmc2Kxx5v2FX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.22 um 09:58 schrieb Qiang Yu:
> On Fri, Feb 18, 2022 at 3:46 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 18.02.22 um 04:08 schrieb Qiang Yu:
>>> On Thu, Feb 17, 2022 at 8:22 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 17.02.22 um 11:58 schrieb Qiang Yu:
>>>>> On Thu, Feb 17, 2022 at 6:39 PM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 17.02.22 um 11:13 schrieb Qiang Yu:
>>>>>>> On Thu, Feb 17, 2022 at 5:46 PM Christian König
>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>> Am 17.02.22 um 10:40 schrieb Qiang Yu:
>>>>>>>>> On Thu, Feb 17, 2022 at 5:15 PM Christian König
>>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
>>>>>>>>>>> Workstation application ANSA/META get this error dmesg:
>>>>>>>>>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
>>>>>>>>>>>
>>>>>>>>>>> This is caused by:
>>>>>>>>>>> 1. create a 256MB buffer in invisible VRAM
>>>>>>>>>>> 2. CPU map the buffer and access it causes vm_fault and try to move
>>>>>>>>>>>          it to visible VRAM
>>>>>>>>>>> 3. force visible VRAM space and traverse all VRAM bos to check if
>>>>>>>>>>>          evicting this bo is valuable
>>>>>>>>>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>>>>>>>>>>>          will set amdgpu_vm->evicting, but latter due to not in visible
>>>>>>>>>>>          VRAM, won't really evict it so not add it to amdgpu_vm->evicted
>>>>>>>>>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>>>>>>>>>>>          ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>>>>>>>>>>>          but fail in amdgpu_vm_bo_update_mapping() (check
>>>>>>>>>>>          amdgpu_vm->evicting) and get this error log
>>>>>>>>>>>
>>>>>>>>>>> This error won't affect functionality as next CS will finish the
>>>>>>>>>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
>>>>>>>>>>> correctly reflact the vm status and clear the error log.
>>>>>>>>>> Well NAK, that is intentional behavior.
>>>>>>>>>>
>>>>>>>>>> The VM page tables where considered for eviction, so setting the flag is
>>>>>>>>>> correct even when the page tables later on are not actually evicted.
>>>>>>>>>>
>>>>>>>>> But this will unnecessarily stop latter user VM ops in ioctl before CS
>>>>>>>>> even when the VM bos are not evicted.
>>>>>>>>> Won't this have any negative effect when could do better?
>>>>>>>> No, this will have a positive effect. See the VM was already considered
>>>>>>>> for eviction because it is idle.
>>>>>>>>
>>>>>>>> Updating it immediately doesn't necessarily make sense, we should wait
>>>>>>>> with that until its next usage.
>>>>>>>>
>>>>>>>> Additional to that this patch doesn't really fix the problem, it just
>>>>>>>> mitigates it.
>>>>>>>>
>>>>>>>> Eviction can fail later on for a couple of reasons and we absolutely
>>>>>>>> need to check the flag instead of the list in amdgpu_vm_ready().
>>>>>>> The flag only for both flag and list? Looks like should be both as
>>>>>>> the list indicate some vm page table need to be updated and could
>>>>>>> delay the user update with the same logic as you described above.
>>>>>> I think checking the flag should be enough. The issue is that the list
>>>>>> was there initially, but to avoid race conditions we added the flag with
>>>>>> separate lock protection later on.
>>>>>>
>>>>> But list and flag does not align always, there are cases like
>>>>> list-empty/flag-set (this problem) and list-non-empty/flag-unset (non-vm bo
>>>>> eviction). If only check flag list-non-empty/flag-unset change behavior.
>>>> Yeah, but I think that the flag unset list-non-empty case would be
>>>> correctly handled if we only test the flag.
>>>>
>>>> In other words we can update the page tables as long as they are not
>>>> partially or fully evicted and that's not the case when non-vm BOs are
>>>> evicted.
>>>>
>>> This sounds like two standard for the same thing, because this problem
>>> does not evict page tables too. But I see your point is:
>>> There's a difference that this problem's case can make sure vm is idle,
>>> and we prefer to delay vm updates when vm is idle.
>>>
>>> If so, why not just stop user vm update by checking vm busy in
>>> amdgpu_gem_va_ioctl() to skip amdgpu_gem_va_update_vm()?
>> That's exactly what amdgpu_gem_va_update_vm() is doing by calling
>> amdgpu_vm_ready(). The problem is that amdgpu_vm_ready() looks at the
>> wrong thing.
>>
> If amdgpu_vm_ready() use evicting flag, it's still not equivalent to check
> vm idle: true -> vm idle, false -> vm may be idle or busy.

Yeah, but why should that be relevant?

The amdgpu_vm_ready() return if we can do page table updates or not. If 
the VM is idle or not is only relevant for eviction.

In other words any CS or page table update makes the VM busy, but that 
only affects if the VM can be evicted or not.

>>> Then we can keep the evicting flag accurate (after solving your
>>> concern for this patch that eviction may fail latter by further delay
>>> the flag update after eviction success).
>> That won't work. See we need to mark the VM as evicted before we
>> actually evict them because otherwise somebody could use the VM in
>> parallel and add another fence to it.
>>
> I see, make this too accurate should cost too much like holding the
> eviction_lock when eviction. But just delay it in
> amdgpu_ttm_bo_eviction_valuable()
> could avoid most false positive case.

Partially correct. Another fundamental problem is that we can't hold the 
eviction lock because that would result in lock inversion and potential 
deadlock.

We could set the flag later on, but as I said before that when we set 
the evicted flag when the VM is already idle is a desired effect.

Regards,
Christian.

>
> Regards,
> Qiang
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>> Qiang
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>> Qiang
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Regards,
>>>>>>> Qiang
>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Qiang
>>>>>>>>>
>>>>>>>>>> What we should rather do is to fix amdgpu_vm_ready() to take a look at
>>>>>>>>>> the flag instead of the linked list.
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
>>>>>>>>>>>        1 file changed, 47 insertions(+), 38 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>>> index 5a32ee66d8c8..88a27911054f 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>>>>>>>>>>>            return flags;
>>>>>>>>>>>        }
>>>>>>>>>>>
>>>>>>>>>>> -/*
>>>>>>>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>>>>>> - * object.
>>>>>>>>>>> - *
>>>>>>>>>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>>>>>> - * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>>>>>> - * used to clean out a memory space.
>>>>>>>>>>> - */
>>>>>>>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>> -                                         const struct ttm_place *place)
>>>>>>>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>> +                                          const struct ttm_place *place)
>>>>>>>>>>>        {
>>>>>>>>>>>            unsigned long num_pages = bo->resource->num_pages;
>>>>>>>>>>>            struct amdgpu_res_cursor cursor;
>>>>>>>>>>> -     struct dma_resv_list *flist;
>>>>>>>>>>> -     struct dma_fence *f;
>>>>>>>>>>> -     int i;
>>>>>>>>>>> -
>>>>>>>>>>> -     /* Swapout? */
>>>>>>>>>>> -     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>>>>>> -             return true;
>>>>>>>>>>> -
>>>>>>>>>>> -     if (bo->type == ttm_bo_type_kernel &&
>>>>>>>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>>>>>>>>>>> -             return false;
>>>>>>>>>>> -
>>>>>>>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>>>>>> -      * If true, then return false as any KFD process needs all its BOs to
>>>>>>>>>>> -      * be resident to run successfully
>>>>>>>>>>> -      */
>>>>>>>>>>> -     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>>>>>> -     if (flist) {
>>>>>>>>>>> -             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>>>>>> -                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>>>>>> -                             dma_resv_held(bo->base.resv));
>>>>>>>>>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>>>>>> -                             return false;
>>>>>>>>>>> -             }
>>>>>>>>>>> -     }
>>>>>>>>>>>
>>>>>>>>>>>            switch (bo->resource->mem_type) {
>>>>>>>>>>>            case AMDGPU_PL_PREEMPT:
>>>>>>>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>>                    return false;
>>>>>>>>>>>
>>>>>>>>>>>            default:
>>>>>>>>>>> -             break;
>>>>>>>>>>> +             return ttm_bo_eviction_valuable(bo, place);
>>>>>>>>>>>            }
>>>>>>>>>>> +}
>>>>>>>>>>>
>>>>>>>>>>> -     return ttm_bo_eviction_valuable(bo, place);
>>>>>>>>>>> +/*
>>>>>>>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>>>>>> + * object.
>>>>>>>>>>> + *
>>>>>>>>>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>>>>>> + * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>>>>>> + * used to clean out a memory space.
>>>>>>>>>>> + */
>>>>>>>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>>>>> +                                         const struct ttm_place *place)
>>>>>>>>>>> +{
>>>>>>>>>>> +     struct dma_resv_list *flist;
>>>>>>>>>>> +     struct dma_fence *f;
>>>>>>>>>>> +     int i;
>>>>>>>>>>> +
>>>>>>>>>>> +     /* Swapout? */
>>>>>>>>>>> +     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>>>>>> +             return true;
>>>>>>>>>>> +
>>>>>>>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>>>>>> +      * If true, then return false as any KFD process needs all its BOs to
>>>>>>>>>>> +      * be resident to run successfully
>>>>>>>>>>> +      */
>>>>>>>>>>> +     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>>>>>> +     if (flist) {
>>>>>>>>>>> +             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>>>>>> +                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>>>>>> +                             dma_resv_held(bo->base.resv));
>>>>>>>>>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>>>>>> +                             return false;
>>>>>>>>>>> +             }
>>>>>>>>>>> +     }
>>>>>>>>>>> +
>>>>>>>>>>> +     /* Check by different mem type. */
>>>>>>>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
>>>>>>>>>>> +             return false;
>>>>>>>>>>> +
>>>>>>>>>>> +     /* VM bo should be checked at last because it will mark VM evicting. */
>>>>>>>>>>> +     if (bo->type == ttm_bo_type_kernel)
>>>>>>>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
>>>>>>>>>>> +
>>>>>>>>>>> +     return true;
>>>>>>>>>>>        }
>>>>>>>>>>>
>>>>>>>>>>>        static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,

