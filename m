Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B551564442A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 14:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F9F10E321;
	Tue,  6 Dec 2022 13:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4FC10E148
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 13:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic1jGxG0DZ5L+sb9EONL3HlrOWlXfgArDCtBJ+0p6roqZ7/gAoiL7DyGk0Ujuhl9BhJunEqFfgsS8kmJuuxmnrhIhlxHOniMz2P1sSgqjaFuYVZuX23NfGHdZce0rQ54W7fJK4xfZXl8xo0bLfbnB7XYkDrJOtTtXGjtxUe2W/qK7Zd0AkH8azX8YrDZMB/Vmx822LvmdmqzBeU7VYHYAmVXrVyqkkOvwm/JKU+2pPbLSFkQR7oL3kbmOQh33Y4c3JMgyUKroR6SnK+2rpABfFkfxbWjt321G4zxMkAKAJpJspWQEDMqc4MHicBDLmugDq/X2t7vb8jcW0qne9AegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNiynvLDXzRJufO1AwnfcBacpzKaZVsu5VqVpWDKV+k=;
 b=OLUCrquhgBGOv6KKfpWAea1P5+Yg/iWoOM2XgSb9qmtV+V+lOkZBDENdIWJ+6US3xqUeNuTvZK9FwEsvTuYqggEpbsPNY34yKYl7jfq8Jq1lBBbUh/+7qsdWjW51DM5Oulvpqp7+iBY4mGgzbHR+SPwUg48QSCSOR0mNjpJhXqGQ0a975tpI+FcVuur1EjwKq+LqaxRKXEnWqAvszAznAGE9pvyL4swv7lXf4/qTcU6hVQUc7Ryu5cF8AqfsZmn+/ep+5tqu3LbENWfhXE6HqPjfAYBpCeNhAqZrmhhx1V178j787leDWOPnd+nf0f3xZyxkC/Ep5YCuoeoVeibGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNiynvLDXzRJufO1AwnfcBacpzKaZVsu5VqVpWDKV+k=;
 b=QTmbzPouBZrIGjbadmVKSZJOBgYNDeWpnxRGPsfufmAM1Jzswi8/Muft64beLRmhyHRkQZxL9Bb6eGOnz9p2ddH1bpljuIJ9eesesRBUvKu38A6LpOcPmT8GK/PRTkIidPGK1skhB/Mg2cPGtvhnCWuTtXMyYabpmyuaXMvADU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 13:08:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:08:53 +0000
Message-ID: <b2736dcd-c593-e26b-5f52-638b64bc8e2b@amd.com>
Date: Tue, 6 Dec 2022 14:08:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Fix possible UAF in
 dma_buf_export
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 cuigaosheng <cuigaosheng1@huawei.com>, "T.J. Mercier" <tjmercier@google.com>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
 <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
 <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
 <e12784da-b3e3-ddec-0e84-f968d60097c4@quicinc.com>
 <b2d5d904-99f2-7974-a22d-63a6cf864973@huawei.com>
 <689ad89b-0e34-3743-24c9-3f92856720f8@amd.com>
 <a87e407c-f858-28f1-c5ea-ca69b39db53a@huawei.com>
 <3de513b2-8ec3-2ff4-136d-0f56ac07c0ff@gmail.com>
 <866708a4-9f31-b5e5-fbda-10b2a6c948bf@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <866708a4-9f31-b5e5-fbda-10b2a6c948bf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e354154-73b8-47c0-7296-08dad78b0663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85eq0nCuYhSarhdwVDCudmKu2gPCUWbA0/4yTzYGylyT+7ogFEFN99sgXrXLTwWVReSQpYRHWYCWA6LQ74syszyya56+d2kWgzR2YflAtvGpBRZ94b2dEpmypt3PcTUWac/kdtD7d4W6G8ZiBtLSUbWfIJzOmCVpO2oD7aRS71T3x8zQwjnuBiuOSXm88wHeuLoct1xKWB7iqtHM5uaSL/edxluR8VZBSwnqh/+T/UGQyDnnBX7DS7p0xkZAkR8fRvxYjkGRcaBGP96M9RT8MsFVWTrc63uGA+Nc+V8BO0o579W7RGUXqWZTz3PFCenCiqjz60sIO+eqSdv3iLIsmLy3+g4QCPWsTu0XnbdeJzGkYheFU2Cdgx/pC2F0RiV9NIPug90V3wVDzbbihzEZFQVKH0kTeOo09LbkpSrF5RS8ywng+Vjvk0aAVYAGBzGBGReCIU8aHYEzXPOi9EdhMJu0yOL2aJeGuFAW5pRdb5kJFfF4GWGMDz4j2Rtsm0Q3PqELYZKH2gjo5StIRS0byksVP+5KBYKfVKPok7PNnQhzu0ruG4sWrlw0QHWF5UTTDCyr0SgKjEbcElHfwlCBHhYAGdmg90ooQHc4ekgv6t/iYFG11WZbsQcp2lrmcX8UE5zgWbz3IA/xEqQOCbujIb02ixj0oC6W5kfGLiP7ipHp9Du5JQB+CzaEEQOqVy3RTXNwPu4RdnH7fbRmnN4NR4CWmQ8mQd/KorP0s987J+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(36756003)(31686004)(31696002)(4326008)(41300700001)(66556008)(2906002)(66476007)(8936002)(8676002)(66946007)(7416002)(86362001)(83380400001)(38100700002)(6486002)(54906003)(2616005)(316002)(110136005)(5660300002)(6666004)(186003)(53546011)(6506007)(66574015)(478600001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmtHRnd5b1lzdkVobWU0TmVGWjBUWG5JaGZRZ3VseDVUUmJBNkZkdWgwd2p6?=
 =?utf-8?B?ZjVHUzU5NFp2TFFNUDZVV2EwMVBHTmZoU3duYnlBVmpsWTdIdDFmcTkxWUJM?=
 =?utf-8?B?TUk3Ymt2aTk2OURaTXQ1OXZPUjdCRDRRM0crL0lUaDFhSHdCVEJNUnoya29j?=
 =?utf-8?B?emZIVVpidTJSWE1NVVRtVE0zaWxNZ2ExeFUwaFJ3ZlRUNlhvY3pwaUJQNnU1?=
 =?utf-8?B?VEJ4eTVlSDk3dmFUZWJCRXRvWEFCTXVEcUJnUDlTaUVWN2pOekVGdFd4amIy?=
 =?utf-8?B?Q3RxWjZUQ0QyMnNKWVRCd2wrUHVjbEc2QWozTEhmakRESFZNMW9KcWxMeUJK?=
 =?utf-8?B?YU1ocWhxVjNST1pnSGh5aTlVd0w0bEwyNitTNStuL1RJbHFkTnJ6ZU8yUFNa?=
 =?utf-8?B?WFFXei9RcXRHU0JCYjAvVi94R0pjWEVjMVZBbDB3VDZycU94TUdBY1dOWHJN?=
 =?utf-8?B?N2Y3SDl0bHFDRGcyRTNQZnNQQVVTeDE5dTNsMWlCNUFPVk5keEFXKzF5VTMr?=
 =?utf-8?B?MUdCQWNZZWFCMGJkQ2haRnN4Nnh1bnl1SU05aWcwcU9RSFJ1TTR0UjF3U0RM?=
 =?utf-8?B?NnkxWkhxUFE2YXZVOFUrc1pubVl0eUtKNHVPQ1psU3Z1dm8yM2RUaWNDbGFo?=
 =?utf-8?B?blhJcVdvMjdhRDE1YldidFBQb2VldFJvdmlIQjVMZ2ZDeXZvZHFqM0lXRzlj?=
 =?utf-8?B?SUF1ak1XSysxc3pGUEpDd29ybWtTNm9ra1lQM29yeWhZV3F3YUlPTFMvUm1C?=
 =?utf-8?B?UFZVcnN3cndnOGhUQUJXbUdxUWRVNnBSSkt5VTI5YzZZMzE1VjNkNG5uLzd5?=
 =?utf-8?B?L2YrMmZQYjA0bDhXVmhoNW45c1p5dXNSSklqclYzVllmZHJFbTY5UndYcmpU?=
 =?utf-8?B?aFFrV2hreWFRZnB3Z1piSEtaYi81aGVDYnFubnZFc1FvZHRDSU5yRHNCL1hE?=
 =?utf-8?B?empzOFg1OHA1Yzc5YkwyZzdya1gvVnk1RjV6YmZ3RFhNMUc3TW5iZnVEbG5Z?=
 =?utf-8?B?MFFxb2tTdzRZTS9qOXVNeGNRZjB2dVZqa0hEa1EwQlRtNVVqYnRHUFN0dkFz?=
 =?utf-8?B?dGltdk5lMWNZNXB3L1NhQVpBcjJtYndHakZTdy80THZEbnJJY2V3dmhmYjU0?=
 =?utf-8?B?alVJeFR5bS9NN1dScWxXdnJhWlV2andsWlFEODhEQUdlWmpCZXluN3ZrUHpx?=
 =?utf-8?B?UmRkWTdiOXduUGpqNmpqemRjOUZwdkxmd3d6R3haYmJNQTBWNWxPVzBEdksr?=
 =?utf-8?B?VlowbEJHb1luRGpGTXpwbUpVZ2tGSFhIYW9oOW9QUHRSRk9ZREV6aXMzSE9z?=
 =?utf-8?B?aGZiSmd5SEt5OG1URnZEczdablNldzVCbEZ3TWJQODA4MlFHaUR4aUVWMHFn?=
 =?utf-8?B?SE5ybnNmaWNoY1VlSTc0dmk2SlB1TG5UcVF6enJROHFSallpc1JXTDdhM2Zl?=
 =?utf-8?B?VkZNNUtrb3NDN0hXTlM3YjgyanYwYmR6N0loclZCMEZnNkkyaGNMb2w3K1Fu?=
 =?utf-8?B?TTlYb0d1ZkRsa1grVzNJSW4yZnp5OFdubUNnclJrVnpqNjlqNm5MZ0Y5cVV1?=
 =?utf-8?B?Qk81QTdvOHFjMUdHaDBRUDdhUGpFV2hSTFRid0trU0Z1YVdXanExdUtWd0Jp?=
 =?utf-8?B?dG1Kbk1VK2dnZUROSnRMWW5MQnRVT3RVMmhiYjBVbi90VnZFNDloUGVsV1JX?=
 =?utf-8?B?UW9VYXgvMjFraTVITHBtcDBrUVBXNXQwQW1mTmFzUkp6NjRGcXo4eGRvenNw?=
 =?utf-8?B?cTJjMGdkRjFtdVplTnBkbFc3Q1REVk1UOVB3R3QwUE1uRUpxZHBRU2cwM0Nw?=
 =?utf-8?B?WThUZkcyNnlWK2xXUmJZeGZERm52TTlWdk1yK3VlU0EzL3c5QzlKaWRQV3pV?=
 =?utf-8?B?cUtRVUxFc2Mza1YyQjVtMmFCOHpmRy9xeEtaa3JlVDBSemFFamRPY2x6VFhy?=
 =?utf-8?B?Ylp2QVgzWlRtTmUrZVhTbkZrVmtrQTdKTlZ1dVc0UjBHN0xna0dEcUFRWkcy?=
 =?utf-8?B?aVZSNjJUN2RzbWxMNms1VkJ0Zis0S2xsRWNKNXdqd1BLY09DdDJ4SlRoa1dJ?=
 =?utf-8?B?UzVBTUc5b1hqU1BjZVptMUZvR0JtcGFRMFF0VkVnSmlXMUdzLzdCS3FKbnhU?=
 =?utf-8?B?bEJtakpMUGVLV0ZhaWtPTk80a3E5a3hzUU9TS21sQm9YVE5VTmdhUVI2OW5I?=
 =?utf-8?Q?UCqiEvEXSHTSA/u+jwsaiiRDQD48jmFJcoBDeJRG3/dd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e354154-73b8-47c0-7296-08dad78b0663
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:08:53.6765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbwbgwcxcUSPbkMCFsnuH+G1DGyxFMWYXSxCsojlzUNvM/EHpM903PaIOFRejT6L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673
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
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.12.22 um 13:55 schrieb Charan Teja Kalla:
> Thanks Christian/TJ for all your inputs!!
>
> On 11/24/2022 6:25 PM, Christian König wrote:
>>>> I was already wondering why the order is this way.
>>>>
>>>> Why is dma_buf_stats_setup() needing the file in the first place?
>>> dmabuf->file will be used in dma_buf_stats_setup(), the
>>> dma_buf_stats_setup() as follows:
>>>
>>>> 171 int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>> 172 {
>>>> 173         struct dma_buf_sysfs_entry *sysfs_entry;
>>>> 174         int ret;
>>>> 175
>>>> 176         if (!dmabuf || !dmabuf->file)
>>>> 177                 return -EINVAL;
>>>> 178
>>>> 179         if (!dmabuf->exp_name) {
>>>> 180                 pr_err("exporter name must not be empty if stats
>>>> needed\n");
>>>> 181                 return -EINVAL;
>>>> 182         }
>>>> 183
>>>> 184         sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry),
>>>> GFP_KERNEL);
>>>> 185         if (!sysfs_entry)
>>>> 186                 return -ENOMEM;
>>>> 187
>>>> 188         sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>>>> 189         sysfs_entry->dmabuf = dmabuf;
>>>> 190
>>>> 191         dmabuf->sysfs_entry = sysfs_entry;
>>>> 192
>>>> 193         /* create the directory for buffer stats */
>>>> 194         ret = kobject_init_and_add(&sysfs_entry->kobj,
>>>> &dma_buf_ktype, NULL,
>>>> 195                                    "%lu",
>>>> file_inode(dmabuf->file)->i_ino);
>> Ah, so it uses the i_ino of the file for the sysfs unique name.
>>
>> I'm going to take another look how to properly clean this up.
>>
> How about deleting the dmabuf from the db_list directly in the error
> path (which is usually done by the fput()) and then continue with the
> normal fput() here.

No, that's not really clean either.

Give me 10 Minutes, going to come up with something.

Regards,
Christian.

>
> Just compile tested the below code and If the logic make sense for you,
> will send the final tested patch.
> ----------------------><---------------------------------------------
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e6f36c0..10a1727 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -87,19 +87,28 @@ static void dma_buf_release(struct dentry *dentry)
>          kfree(dmabuf);
>   }
>
> -static int dma_buf_file_release(struct inode *inode, struct file *file)
> +static void dma_buf_db_list_remove(struct file *file)
>   {
>          struct dma_buf *dmabuf;
>
> -       if (!is_dma_buf_file(file))
> -               return -EINVAL;
> -
>          dmabuf = file->private_data;
> +       if (!dmabuf)
> +               return;
>
>          mutex_lock(&db_list.lock);
>          list_del(&dmabuf->list_node);
>          mutex_unlock(&db_list.lock);
>
> +       file->private_data = NULL;
> +}
> +
> +static int dma_buf_file_release(struct inode *inode, struct file *file)
> +{
> +       if (!is_dma_buf_file(file))
> +               return -EINVAL;
> +
> +       dma_buf_db_list_remove(file);
> +
>          return 0;
>   }
>
> @@ -688,6 +697,8 @@ struct dma_buf *dma_buf_export(const struct
> dma_buf_export_info *exp_info)
>           * early before calling the release() dma_buf op.
>           */
>          file->f_path.dentry->d_fsdata = NULL;
> +
> +       dma_buf_db_list_remove(file);
>          fput(file);
>   err_dmabuf:
>          kfree(dmabuf);
>
> --------------------><-----------------------------
>
>
>> Thanks for pointing this out,
>> Christian.

