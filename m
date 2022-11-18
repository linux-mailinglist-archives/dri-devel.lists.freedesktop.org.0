Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6E62EF36
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 09:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3206510E0F0;
	Fri, 18 Nov 2022 08:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED0A10E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 08:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cK7PXZlicRgjWJR4rbGKcxfqWg+Y69OEVxz+RuJZny6ESqoIVHo4/RG6RaSLiKe6umlaux5ntECHKtgyPeawWl10DTs7I1YXslTBz3NiyL6MFlW2wXlUu8WnOwldeqPuX4nb9pSWnlYMU2tQxyjY6VUAh5a1ejYL0TEmJ3wEx6WqB7dylVwEClTo8lg9roYi8xR9OFOGU3iltC4FsFj0GEeC8Bzrq6OZnZXjmd4u3Eu0/rUcIEqWUFcvNAbqnS/ZCZnO1yJOVwXCiCu/iiJ4nVcPFzzHC49cot0y3AdpNcIHKkJLv8bKmZvmankjUpyk4ssEddj4L37hrz5QKdRYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtjpXjN83GRYbUl0BP6kmHXLXdPhl/VXBHL/ecwpPu4=;
 b=aOvpRNxZX13XYLFnJ2bMtzsPWs5aJBHvpd/U4ZO38ARGx4100UvyL/8Ebqyz+bb+9uk2Yc6iiUA2JzJaHBo6YwjOPlDx7tUMpaMGxdq41R0MmLC8mk8Qwl5xbYuD1pLXitPGQDwLqLXu48Hte30Ca8xGDON+uK9Q7pAcj+IEXhSMCqCQR9Z/Y4qJhZh3n8dhJCtHuwgoaIAiYA8GcBx+Y+44gEQVVYN94qqgZhUyrnFvZ5A6kY7LuAJeeiiikNP52FYWo2jhBWwuxt01rjM3OIBEXX31Vsl6ovpMAAh1AMxD+ORrL740zcu8rV8/jyzToGIzhBA/h4M+ePOr8kW1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtjpXjN83GRYbUl0BP6kmHXLXdPhl/VXBHL/ecwpPu4=;
 b=jSqMnuw+/GpzU1xuNiQUkWCoyZcfB4qtuNKA5E9qJt+uNhUa2irShFjCrrCZ9Rj+y4dv1AMPPH/uPw1VF/6vch7YxOoyPV/4Qd8zWqI+fq8k7UoWLx2B0RSUCaOQhuic6SqDyG2iQLJFxgYBy4+1KvyVKDc012y82Epc0cOdZDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 08:27:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Fri, 18 Nov 2022
 08:27:54 +0000
Message-ID: <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
Date: Fri, 18 Nov 2022 09:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: b78c03bf-9d97-44e5-24ee-08dac93eca31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MrZ3GLPcSGvnYJaxHw2FH44KPVcAXUEo5NGL2y/rydpje32emk+1B/XTcxs5xaqIoMbR/fvUuEH3Wxjf/Hl+EG94pXAGTAtOFzWwzd7VqjlVlZRMSJFTRX7+vtRx2kU/4rU9XmeP7LsqlGAy7Wa2vJSE64YG2m0upFrJm9j9HMIb4bunrY8XOeBzfft0JPz6sD8F8uq/UufFcuT84mIxGMkD97VTG5KvswDowDS97V7b318/12jiuDAYnAgcwmunjHx8LrpXih6eGGGNJBIcC5H9DM0nhpBhM3xR03gyCL33H3sVPQNasnpm+9llGFYk0Ay36tQ2UKBERNOQ/BeG82U9czXzpUYfYDyYdtuQ54t+5XoBfh7u2lMBvrWks/1kYptkJcG/Z7UgJDPGUbgN44r6GNzXc9yCBk53gQEDR+xZiL4EqapYW8mplnEjDLUmApVsCVWYDyutjJ2TVH+vVxy750KBeztsmGSrEERPN7bFSGxlT2dKH8/8oq2/TP0880W0gv7zysKoTZaBH4q9umCH5AK4TnQosz9fTrM22p06WSHhKwDk3FA7EhakW1PKvNmIvEmGjyke2YQQ7KZzSar0L1hYnIqQnw3aX+cGHtAWZxompd4+nJqJWQYqYDKGQAHg2xOI7E85wndHJGxKcEWXB9De6SZFgy7jet9p9gGqUcsG2ROPWxwL0VG7HJHJntUK/wk3XtMqIrci6aUcwGjzT5wVxv5+9uezccc5YgVfdj3K/SRg/7hO4OTZWA5KrgiiOch9GNVJkEPIx2Xbtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(66476007)(31686004)(6666004)(45080400002)(66946007)(6506007)(316002)(54906003)(6512007)(6916009)(66556008)(6486002)(478600001)(4326008)(186003)(2616005)(8676002)(41300700001)(53546011)(8936002)(2906002)(83380400001)(31696002)(38100700002)(36756003)(66574015)(5660300002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGdla2I3NGVVZDljSU1NaHl0MkJNMyt3OUsxdjlDekJkbEhCcXFqR1V5Ny9X?=
 =?utf-8?B?cytSb2R5Mi8xTXdna21NTHhsTndRWGhTVWhTYkxySFFrMW5lWHc4WGVVRGpE?=
 =?utf-8?B?NDJRTUlqWlNGTWMvSmJxRFVyZWlqUk5EWHByV2lySmEySE55c3lzMUc3c1VZ?=
 =?utf-8?B?RHZSMXdwbUFCNlQ5ekpIdGpYWUorcWI1bnJtaEVGR2lSa1o4UWhEKzFsWldG?=
 =?utf-8?B?MWFOSHptSTBkRkdWM3VmZ1NUL1d0SFFmeWN0Tk1PMVd4TURnRE9vcUxwa1M2?=
 =?utf-8?B?RFR4blhocjByVUNkTGgyYURGN1Y1SFJUdThpVUV4M0k3eTVrU1ZJbnZkSUhQ?=
 =?utf-8?B?NlJ3dnlqZU82emZxd1pybE5WMHJNc3ZNdHhNb1UyTXFkdTBubmNOam1CSlZF?=
 =?utf-8?B?SFBkRDg2NWprOFZrZG9hU1o1TURzanF6dDQ2QmxYd1c2bFZOY3RMcGc2VUQy?=
 =?utf-8?B?bm56dFZaeGxrYlNsRDFIbjRabmNxQXdjSi81WmVyV1NUL0plZnNwSzhXZXNu?=
 =?utf-8?B?cXptdTVvVkxyUVhXdGhUQzR1ajVKbEduQTE1aEFGdWtMcE9TeXBhRkEzSkR6?=
 =?utf-8?B?NTUzaVd3K3lNb3dZSTlvblRUR2N3bjNpMkFYVGtvSjdtS0RNVFNoN1FlUmll?=
 =?utf-8?B?U1hCelZPdmVuclRvNEx2bDQvVkVqUmNGU1NLQTVNK2dtNVJVZzNZYzIzREpG?=
 =?utf-8?B?dVMyUUNlc2ZhMzM1Z0VzOGtpaXl1UndtZmJ2ZlhKU0lqNHh4c3NmRHo0M2Rw?=
 =?utf-8?B?UmkvcEJFU2xoWGN1TkZUYStDdnZNL3FxYjdpaEYzR1ErcENNQ3Vxck1DY2Jx?=
 =?utf-8?B?ZmdlVkdqWDE2cHJJZ0YxTGlaakVTem4vN0kzNzNMNC9XT2Fac2dJVHlFWTNG?=
 =?utf-8?B?bkNaWml2ZjFZVFZENDU5SzdyU0M4ZEpwQ0lhNjdHWEFva2pBaTVmano0TTFq?=
 =?utf-8?B?bGdoRzhnaWQ0ZmJ2bjQ0YURvYkZuSEg3VWlBdFJpbkhBK0hlVzlDOCtQa1FQ?=
 =?utf-8?B?czJ2ejVkaU9kOGw2alp6Z1cveHdhZStORE5SQVhXcFZEelJpS2hNTmdoQmQ0?=
 =?utf-8?B?YlA1dzZ6bXdQVXNRYmhLeFpTU2taRjkraFZBQjkya3MyNnY3WHhmNTlRY3lp?=
 =?utf-8?B?SEx5emxIZ3czRWhXY0w2bktwV051ZGNDdGNLUFZBa2lUUFg5VnhzODdjTWEw?=
 =?utf-8?B?dStpTTJ4eUIxTGl3bVBjeUNnUUJJQk5abG9FQ2x1ZHUrYm9JdWRlM2VPYXZW?=
 =?utf-8?B?bGJtUHJKc0ZUU3lqOHlVRmZLUFBVLytmdlArZFRTSG9nRjFpaFYzUjR4OHg5?=
 =?utf-8?B?dUtRbkN6YmlnczIxbzFTWGhYYTJvTFRwL1ViSlFoSGdSYStTckloSVFUa1ly?=
 =?utf-8?B?di9OTGtpVDQ5ZFJhNXB2R0EyMFV0MzAwaTA0eGxDNlNxSDFleEQ3Wmc0dnBv?=
 =?utf-8?B?Z1MzQ3E5OWdMSEJHWXlJREltZElPOVY4Q0xUYzNiaE1rWENpYTI0eGtncCtt?=
 =?utf-8?B?SzYyR0Z6ZU1YZ1BycEZhT0gvdUNSUlNOYWRsSkhmdnpUblhicWhqeUpaODVC?=
 =?utf-8?B?QjB1bWtsYTR0R0RUa1czbmJ5NmlqcWV1UTd3dlRwMnlaSkR4dzNwdHEybVh6?=
 =?utf-8?B?NmdmaEZSNlZSWGdUYVdMVlAzckNYQXFkQ3FUbDZUOWVrM2pPNGJ1ZTRXNXht?=
 =?utf-8?B?SXdVc200T2dEYlg0M2thRnM4VWZIdVBhVXpBOEVWcnNZV2xHdDFNWHRzd1ls?=
 =?utf-8?B?N0FEaEdrSU1QakpyRVprcGlHemxockxHYkF3Zk03UWZmQURZb3lTdWpVaytL?=
 =?utf-8?B?dVFReVdQSlV5M1VFTGNpUGE3UWRRaEM3SVU4djRJNFlaTzdoRXpKSEJMMW80?=
 =?utf-8?B?TmRrQ1ZXckVpY1NnQUhTSUxQWlZnbExkR252Tk1DNVEzcFVOVnNVYkxwcnlS?=
 =?utf-8?B?N1hmcG1CRHRnMCsyNHliQitWZnIvcDlSekVqVi9xeDcxMTF0YWp2cUsvYWxR?=
 =?utf-8?B?SS9JWXFPZjN0VVB6L3BBOXdvVWZzQkN2TUNndnh1RGc3MXRVYTBBcDVSQUs0?=
 =?utf-8?B?aGtTQnJVVUt6clY0cnlrVk9YbVN3elJNNFBaWjBSdis1YmxLZ0pydVpXd2VS?=
 =?utf-8?B?WlBzZzdyUnA1cTEzZnlNaU9ER2JNaUVYaUs2Sk5VeGkwUStUMW1CN0gybjVJ?=
 =?utf-8?Q?FLWG6JTjWlk3PKA3xj/nU/HnU4urPG53RGdQ1AvquvFM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78c03bf-9d97-44e5-24ee-08dac93eca31
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 08:27:54.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiBY22Zu5z0NGO4ozWZkgFWxnPIrgb1zzf9lc6lLy/izc3/Elzjo1eX+yp0m08oG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.11.22 um 03:36 schrieb T.J. Mercier:
> On Thu, Nov 17, 2022 at 2:16 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:
>>> Sometime back Dan also reported the same issue[1] where I do mentioned
>>> that fput()-->dma_buf_file_release() will remove it from the list.
>>>
>>> But it seems that I failed to notice fput() here calls the
>>> dma_buf_file_release() asynchronously i.e. dmabuf that is accessed in
>>> the close path is already freed. Am I wrong here?
>>>
>>> Should we have the __fput_sync(file) here instead of just fput(file)
>>> which can solve this problem?
>>>
>>> [1]https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C7d87a302d300479ecfa608dac90dc9f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638043358319479671%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=erPl1hGdfLbfCxK3J3xiIR9boJbgj6hPUnCBvZFobog%3D&amp;reserved=0
>> That doesn't look like the right solution to me either.
>>
>> Essentially we have two separate tear down methods for the dma_buf
>> object here:
>>
>> 1. It's not completely initialized and we can call kfree()+module_put()
>> to clean up.
>>       There is actually a dma_resv_fini() here. That should probably be
>> fixed.
>>
>> 2. The dma_buf object is fully initialized, but creating the sysfs stats
>> file failed.
>>       In this case we should *not* clean it up like we currently do, but
>> rather call fput().
>>
>> So the right thing to do is a) fix the missing dma_resv_fini() call and
>> b) drop the setting d_fsdata=NULL hack and properly return after the fput().
>>
> This looks right to me if by properly return you mean return
> ERR_PTR(ret); at the end of err_sysfs after the fput. (letting
> dma_buf_file_release and dma_buf_release do the full cleanup)

Yes, exactly that's the idea.

The only alternatives I can see would be to either move allocating the 
file and so completing the dma_buf initialization last again or just 
ignore errors from sysfs.

> If we still want to avoid calling dmabuf->ops->release(dmabuf) in
> dma_buf_release like the comment says I guess we could use sysfs_entry
> and ERR_PTR to flag that, otherwise it looks like we'd need a bit
> somewhere.

No, this should be dropped as far as I can see. The sysfs cleanup code 
looks like it can handle not initialized kobj pointers.

Regards,
Christian.

>
>   >
>> Regards,
>> Christian.
>>
>>> Thanks,
>>> Charan
>>> On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
>>>> Smatch report warning as follows:
>>>>
>>>> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
>>>>     '&dmabuf->list_node' not removed from list
>>>>
>>>> If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
>>>> and dmabuf will be freed, but dmabuf->list_node will not be removed
>>>> from db_list.head, then list traversal may cause UAF.
>>>>
>>>> Fix by removeing it from db_list.head before free().
>>>>
>>>> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf is in valid list")
>>>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>>>> ---
>>>>    drivers/dma-buf/dma-buf.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>> index b809513b03fe..6848f50226d5 100644
>>>> --- a/drivers/dma-buf/dma-buf.c
>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>>       return dmabuf;
>>>>
>>>>    err_sysfs:
>>>> +    mutex_lock(&db_list.lock);
>>>> +    list_del(&dmabuf->list_node);
>>>> +    mutex_unlock(&db_list.lock);
>>>>       /*
>>>>        * Set file->f_path.dentry->d_fsdata to NULL so that when
>>>>        * dma_buf_release() gets invoked by dentry_ops, it exits

