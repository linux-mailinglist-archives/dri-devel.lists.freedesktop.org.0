Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42B72C5BE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 15:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAB610E23C;
	Mon, 12 Jun 2023 13:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DFA10E23C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 13:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSOGLaIT1W07/QXcfByUgnGyr8dC7b4WHH+MVqNCSq3sP2EHjGI0Ix9QWiudycYHUeRhvopf+3qzM7seIqxM2Kk/3vWisBaG1GKSj7v51xzW1+jRjyF90+NF8Cg0ouHbIij3Eg6JEgu3hPNymUzZq2o3Wuns3H6gsJDpP04ojDaKuGftmjS+1B7CJSVa7ctGZvk3Ez7bkCof3Jk/k8YwybOYqpnxzfI9r5i7zuVZXTswjQsJV0S0UKd+sn2rd9eecb9hle+m1D1Pe6YaKSA/gyg5xpaY3Bpto7eFL6Vevw5/EpAr1rXFVFze5Eu4Gc6x33zZ3p801jVncQDiq1Jl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5mge1eShA5IQnwzWxQFDZ+08BVbyNHBjCPhmUwEXEk=;
 b=ByNIZbpZD0J43IGmhWvUBcF2YkjOUv9mukt+eXQaobAKjbNz/QIbMy+3xhFup3Vsi8N8jBHixK+8gsb2lt2llKdNfkeqHbVF46PQVEVeMnHSOpzS4R3dMNqfn44zcU5ZERBBhSppVOqnueHrPPUYth1PkrJDvD3f4XI8PISsIMO5D3Ci+HILP4dblYNjvXaKnbjuEVDLaBIrB0X46egdS6sPlZ/iIYipjmwRp+s5J0yNF+fz4BUwtqwMsMsAZa8J3vsHcVSzCsJuxa/z1BC2x274rjXTAkxqdSasozmFoiVlnj12gaC52512rJwL1mpkmg7S+gIiYmTf7jrltD4tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5mge1eShA5IQnwzWxQFDZ+08BVbyNHBjCPhmUwEXEk=;
 b=nSet+gvIGpLERmYxjQdEB6obqd0uSNgobY1wcCvpA3ZmG/3cZJ+Y4oSvAUbUMs1SJxF13FId6Jn6VIiUZcIUL20Cl8W+AEFW2mLYlQAMtJaNiLgpUPFUJoeqpaOLSD2Oou10XyuBa+zUOzvSmUV85XA5bQzSaR8H+ZpKDKPUYT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 13:22:05 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Mon, 12 Jun 2023
 13:22:05 +0000
Message-ID: <ff196b04-e8c5-52d9-852b-9a9cc7eecdd0@amd.com>
Date: Mon, 12 Jun 2023 15:21:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] accel/qaic: Fix dereferencing freed memory
Content-Language: en-US
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Sukrut Bellary <sukrut.bellary@linux.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230610021200.377452-1-sukrut.bellary@linux.com>
 <fc979a4e-c30a-2606-9eec-afbba4fdd774@amd.com>
 <e3a867a8-284b-7250-b1b2-1956f533f6b0@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e3a867a8-284b-7250-b1b2-1956f533f6b0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|CH3PR12MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 699f6d86-3e13-44a1-1c69-08db6b48040a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Co8flGdHn8XVC80FRFvZyQpBSzvvtP3YS+sjbsf02YD1JJ05Bfxs2QeoQfPE6c0NNrwiTJSDxzjCvfE2WuAdfVjuprX8MFFLQpcLEjlrK9XKlFB8HKxlVuvUSt6rPerA3ErGyXaDimJS5JtvJm9fJxLNgMX10B9y6mvS6NqBCmbjq4/y9Y5jyCSmF/ckrOaBuPK5xjlfBk3/6Mq/CCN9nLnbunot9PP3Cgyk0UjvaagHnLyMTN/JY7X002gBgVNt6N/Sr2lmEX5KueQK1NBQWDCxOX/hOwC2m1EhZhbrP/fmyaZx2lvIGeRlrg6cN++nPI3EAxdxWsdQ1sbqhiF0gRaV5bmPOyZ5PIhFJWUK1kX9x2J8KkaR5DTIpVj+QnzmYo227vNsrF6C3+9/zfos/ZGN0EFcmcV4DxLgTjbJE1saeomTtumLBOOMPeJfLJII5GMCPpBY8ie46m7hcT93BHlSWXVJ0tXmrtAyy6AwjhcXFhaNr6WmwuM7I4dqiyQtrfcLxVvyjI4kAqOQaoMs034EmqP8xsmNkzSgFEXWVxSzVGnw6wL4xRnbMe4Ewql4/S44KP+Jb1QsFBYnyNRsEDcGHuaVJoALq4H89BGvCjGOqLyT+ki4h1su6UOiNNMKBXgAMchYDPvUzTdort3fjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(6666004)(6486002)(478600001)(66574015)(6512007)(6506007)(53546011)(83380400001)(186003)(36756003)(38100700002)(31696002)(86362001)(2616005)(31686004)(5660300002)(8936002)(8676002)(316002)(41300700001)(2906002)(4326008)(66556008)(66476007)(66946007)(7416002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnQyK1l5Y2FkNG8ycmthZlRoWWtVTCtpelBvb1kvRVZDYlMxQVhNaWYrQ2Mr?=
 =?utf-8?B?UUU0RUNNUjV0ZnRQbVF5dnlLNFhicWhubXo3VGdSaWltWk5GZVM2VzJZd0lu?=
 =?utf-8?B?VVM3cTJobWFpekJxL1hKeEVSNHNsTmZNODhuZGpEeHNCbWpmbkY5dHcvWG13?=
 =?utf-8?B?N1RRVnYyd25QMnZhMFVSUTljWmpzb1BXaENpYmF4dkp3QlRPOWhidkVqbElL?=
 =?utf-8?B?UVhSYkVWNGRSdDJYOTI1dU02eUwxY1phdHJ5dTUzcDZwZ3ovUFIrWkd0bDBp?=
 =?utf-8?B?akk4anlxcFZ1VThiT1RPVjkwLy9qRDdHVWFOVkozY2hBWmhPeHhENUFneXQ1?=
 =?utf-8?B?S1M2eERVUjNWM0QzajRXYWFGa2hVUVJHa0FVUkhKNVN1UldVTlJlS0JxSWlo?=
 =?utf-8?B?UDd2bENmc0RlMFBoMm1TWXdLRFlWZlRJb1FaWnVtNDZlM1ZaRzFuaXQ0ejlj?=
 =?utf-8?B?cnpNSlVTWlJtK2dYNEF6NG1yVFVqaTNLa0lTdU9vOXduQm5VSkpYMHUxMlhw?=
 =?utf-8?B?SHZGZ0RyYTdGS2lQQzV1YWZXejdyd2NHUW5sdkFDbWhFbGovaUN5MTYxMncv?=
 =?utf-8?B?VEM2VnZmRGRIVUZ6U0hhZFVkTUdiYVpnb0tFVitneHRLUWRuL21JMGVrMVo5?=
 =?utf-8?B?WWlOR0dMME5WMWNHR1hsMTVHZmZCQWZZdUJXT2xtMUtDRDFMcG04MSsvWDBB?=
 =?utf-8?B?YS9vVS9XcDgwOW5oUXZOcit4OE9tUjk2Nk5BMDZzRkpyS2pKeVBkWTdzK3BE?=
 =?utf-8?B?alhHTmp2bVdlelU0Q2YxR1hlVi91RERINmluN3N6VXRaYTZIM1o0cmhxYTlK?=
 =?utf-8?B?UHc2aEM5bXBzcmtWY3JuMTBhdFJYbnhzZGVEZG1ad2RhaU5rUk5wdEs0cm93?=
 =?utf-8?B?alNiYWgybDVpbW0xamg4QjZQcWVMa0NlZlJLUnZCbTVuL3Z2aStkNGlxSEtT?=
 =?utf-8?B?YWxjblAwR0FINmMvaEp0ZVdnZXN2QjdtTHl0QkR6eU9KV2tmMGFObXJENkZ4?=
 =?utf-8?B?ZGxIdUFjUXkyeHdHVms3dnZkN29EWWtBdHFKcWNvZFVRL2FiaGJlbkd0RGdp?=
 =?utf-8?B?bW5PZFZVTGxDeWxxWTVnbjZBTnN1SFg2UER6WmtPZVlwNmtTRkpoRTZPUDN6?=
 =?utf-8?B?RURBSS93NXhXNmtvY01renVZbmRiY2xVWnhjZU54RFRUWVYyNGdsQ0syV0Ns?=
 =?utf-8?B?eFByU05Fc3lKN1l5Rmt6TEVJMVB6SlVpRlVxTWJla0NaaG5nd2JWL1B0WThF?=
 =?utf-8?B?VEdxNVg3cUlNRU9kd0l6THk5MHQ5TFRXMkdneldOY01oNnNCcDNoMWJ0RGpI?=
 =?utf-8?B?NmxWOVh3emVMWVNwcXMyMldXWndNRXkra0VVQ1hqb1AvQzgzRW9CMjRhckJG?=
 =?utf-8?B?UFpicUpTL0V0QjhqVjREYSszM1lmWldTa3k1bm04cHpaTVlFK1hHaGtBcWhZ?=
 =?utf-8?B?YUE5dmpXQWhzazNxRnVaTGhSZlNtN0YwNmFMcFJHeit1K1ozbUk4MndRU1FX?=
 =?utf-8?B?Q0xtQmFjVFVick1LU0pKN2JhcklCTGp5U1BIUC91VjVUNWczT2srQlcrRG9N?=
 =?utf-8?B?cVpFenhvTVdFSURNb0ovZ2haZXR5KzdTQ21mYkhCM2JzZjlMVDUyS0kwb2lQ?=
 =?utf-8?B?ai9hdDZQZ3A2aEx2N3ZkM3M4blBqSjJ5cHhsR1BqbEJvbzFteXR6WVFOVTJ6?=
 =?utf-8?B?SzZpME92YVdoaEtyNU9pVkx5NWNsZDNLQ1RETnVaR0VJL1o2UFFWVGRZR2xN?=
 =?utf-8?B?Q0x0Tkw3aWlSckpHV1BXenRqTHA1SUplQldWQktYdHdUOWxvcXg4WE8rMDNp?=
 =?utf-8?B?azM1SmtpL2tyZEkzZ3V1OGh5bEExalNucTBpSHZPbGdmbnZLYUdUR1lWcWtt?=
 =?utf-8?B?MTNGMkhXYzhkSFVNMDgzMmY0RjZEMkE0VW0rbVEreGVoZC90dVFhR3FuMkIy?=
 =?utf-8?B?eHdjNmdTaytHSnJuTU1OdnRNZGNWUTR0U1hFY2ZsSXM4ZytnVmh2V0FTOEU3?=
 =?utf-8?B?UW5wRnN1WklqWjVUbUt2R3JmYkVqVXRtRE8zcTBOOGpISTdWWUlSSjVOL1NN?=
 =?utf-8?B?ZExmS3dtbktuamJGbmgyYjRJQXozeDRBZG84WDNiMG9TOXNJSWxRaWt1c0Qy?=
 =?utf-8?B?bkpIU3F2RFU5S1VtNDBGT1AxdTcxN0FoNy94QzBnMHEzUmRqWHE5OTZWUStD?=
 =?utf-8?Q?rR9fX8K02smsVb4vHn+isorPfCyXzARQ0SyR98iDH8xv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699f6d86-3e13-44a1-1c69-08db6b48040a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 13:22:05.6306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ItTkRIaOYHj/VASe/4SEn7/ZEvT4ssXgpTA8f4f739v9Pa2jrTnzDj7+JDhdSU9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.06.23 um 15:03 schrieb Pranjal Ramajor Asha Kanojiya:
>
>
> On 6/12/2023 4:52 PM, Christian König wrote:
>>
>>
>> Am 10.06.23 um 04:12 schrieb Sukrut Bellary:
>>> smatch warning:
>>>     drivers/accel/qaic/qaic_data.c:620 qaic_free_object() error:
>>>         dereferencing freed memory 'obj->import_attach'
>>>
>>> obj->import_attach is detached and freed using dma_buf_detach().
>>> But used after free to decrease the dmabuf ref count using
>>> dma_buf_put().
>>>
>>> Fixes: ff13be830333 ("accel/qaic: Add datapath")
>>> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
>>> ---
>>>   drivers/accel/qaic/qaic_data.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/accel/qaic/qaic_data.c 
>>> b/drivers/accel/qaic/qaic_data.c
>>> index e42c1f9ffff8..7cba4d680ea8 100644
>>> --- a/drivers/accel/qaic/qaic_data.c
>>> +++ b/drivers/accel/qaic/qaic_data.c
>>> @@ -613,11 +613,13 @@ static int qaic_gem_object_mmap(struct 
>>> drm_gem_object *obj, struct vm_area_struc
>>>   static void qaic_free_object(struct drm_gem_object *obj)
>>>   {
>>>       struct qaic_bo *bo = to_qaic_bo(obj);
>>> +    struct dma_buf *dmabuf;
>>
>> Maybe move that variable into the if.
>>
>>>       if (obj->import_attach) {
>>>           /* DMABUF/PRIME Path */
>>> +        dmabuf = obj->import_attach->dmabuf;
>>>           dma_buf_detach(obj->import_attach->dmabuf, 
>>> obj->import_attach);
>>> -        dma_buf_put(obj->import_attach->dmabuf);
>>> +        dma_buf_put(dmabuf);
>>
>> I strongly assume you are not using the GEM prime helpers for this?
>>
>> Christian.
>
> Driver uses drm_gem_prime_fd_to_handle() helper function but it also 
> registers for ->gem_prime_import() which is internally called by 
> drm_gem_prime_fd_to_handle(). All the operations done in 
> gem_prime_import() are undone here.

Then why don't you use drm_prime_gem_destroy() which is the cleanup 
helper for imports created by ->gem_prime_import() ?

That looks pretty much identical to what you do here manually.

Regards,
Christian.

>
>>
>>>       } else {
>>>           /* Private buffer allocation path */
>>>           qaic_free_sgt(bo->sgt);
>>

