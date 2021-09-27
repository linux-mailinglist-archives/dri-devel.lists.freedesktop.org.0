Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A3419127
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 10:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9296189F08;
	Mon, 27 Sep 2021 08:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80089F08
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 08:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJ/fehy5/fAUf3h5IqpUSaGu5ywbfqc+SGIfKOVMRBXihz592w2Fzi8HYRJmXFoGpBOvriNZ/DWLdM4tLnFQoMykNDpgHeEN46vYoa4uITPYtBipdqedOK6Tjx2mOQzCxvbuJ1D5okfzTyQhsFEe99ybIlrz/pgT4/x76euxkRkZHjpwOQKTgICStx+IL+JmmqevCfe05LtDyu4Gx3eltYH4OU3udLLmumDbUUR4TnPSGZgqyeFEkSs6t1HU3KjngwbPhlRtFkzq8/Ne/OjcfzlqVa5S1A55zq1UyqeR5TXLnLJ8T5GJ4YWUhvuDyY+JNWp9A8WWZdOMTmqmodpWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3YWtwaqIaTiUfeXrkLIpkAcQ4o1kpEyuydSzSmr7D9U=;
 b=X+1VZOymG2Blnh1ewk2yd9DZi/qdzG0Qsm5bbmqFsABFnC5yKvzKnihOuf2IY51oXih24W3iJVs0kkPOQ4hlCOMhh9nn8/axV8+54yDcmxyaelzBiwnRai5aeCZMjOyltgs8Yb+POunaT+JVNiRySJQen8Pvkr1JlAhMzPcWwvkDPdBjMou5MtbD8C51UQdd0c4FsLCWPxWf/MGcQQ017m2DAEUjFYrhQGXKsOZ3PdwqgYkeSgbRAQtmjyOszjgfnU7R5uOTQfj0YmYkX5Jz52uRaM4yE4/CNBTLmRLyxtBuqn97o7Z2gyCCrCCGKgE7G/OYfLVtyMEPiex5qhnOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YWtwaqIaTiUfeXrkLIpkAcQ4o1kpEyuydSzSmr7D9U=;
 b=EiJZSLFJwvHaGnf0AqJ0FMhERraFokvjCuJnl5AwQzz9aPTquhcTC7dNyz8GcnlS7JX4AbLNqraHOm9P+i5y0AU7pDBAp3YRZ1nnkJf2Z+TWafxfYgI/U4w+e9X37+s2GisH1Q6DUsvRTGM7CMZvNK10N82qiq9sgH+bb7ILKOo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com (10.174.101.14) by
 MW3PR12MB4570.namprd12.prod.outlook.com (20.181.55.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Mon, 27 Sep 2021 08:53:38 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4544.021; Mon, 27 Sep
 2021 08:53:38 +0000
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
To: Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Rob Clark <robdclark@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-9-robdclark@gmail.com>
 <20210927114201.1f8fdc17@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3a0ef667-a697-50ab-bc2d-07001c6a9889@amd.com>
Date: Mon, 27 Sep 2021 10:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210927114201.1f8fdc17@eldfell>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0048.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::23) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 PR3P189CA0048.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Mon, 27 Sep 2021 08:53:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8a243c9-f3bd-4429-3010-08d981944c0a
X-MS-TrafficTypeDiagnostic: MW3PR12MB4570:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4570594DE87982186AD8733683A79@MW3PR12MB4570.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: am6+5MvT7HLu5c5M3iBANoR+lX6jg02JFs31K1tTj3hgt/sub0j84InNJyTSLBw6ABpMYoR3mwmmIYotFXXfJKT0xPq4MqLJ9SkkbuXHZrG5u6Pzb209744SpgprElWg3H7thOzL887JznohOnhTmCJlu4It7q8lCTKb9OtUUlVG9WQfkIoLR921hGQLs4G4VTXFiNc6sayzNyYnlH2c5UyfkNRAYZ7/s0oSXQrSepI9vG/qjcX3tXULGfA/q1LBdrrTu3UBG0fWwa1vwGox/FMBvDkY5q3aiWy2RLhhAMSy+LltocQstisqQ/ktD2Ugp8qFDq8PJLTe7c+BSVHi5rgnIVZLjBa0PLvKB6gnkTlUX43UklJvoiyJA5GL3trOdbuf9VAifBb/Ic3jE031Lckef9nlPrhG4UKmkEZXnDxHohvqFw98wnn7EArAmPvdm6BwViprkxlHAIVRn7oFj/4o7+9NfpMZP3UIst8mna5vj/qop5eX06cIduhEZbNHjGOrXbSUmyfh5ta/2yLN+Y87TWyTBmhboZx2jwHgFCnQ5Xa3N91KihiLcYm3ej5LEtrxG8WansSHsRfu67mpecFpxTjvkFnZTABHAxHsJxsiJCXuD+FIT0nV0KqMxjFCOZU3s1zVQM4xrniI8C3rq8ZcN7UIVSXRBDHC58KQLeTmkJpthX3yPyauY8wCgG2b65HyrtZn4tOpwJtxDs7O32C7Pe1h3RNowkrsXGCpHyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(66946007)(316002)(31686004)(5660300002)(2616005)(2906002)(7416002)(16576012)(6666004)(956004)(36756003)(66476007)(66556008)(8676002)(38100700002)(4326008)(8936002)(83380400001)(6486002)(86362001)(54906003)(31696002)(110136005)(186003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Gprcbs3w7uxeU1OoTrfIJ9An6jY8ux356Ij4aJRwHUakG+LyKXUaIEcM?=
 =?Windows-1252?Q?UTCR9KYpuIsZrxxKJe0/4VHcj/Li8qR94lS7z96U0mFQpI7RzXOdAAAG?=
 =?Windows-1252?Q?TyGHryWivzra6GzHp/O3VJVaIIyLNQSBq86XRY5ThBuNymPEJlxN9KGL?=
 =?Windows-1252?Q?WujwAcJWAWjZ+yFXXsQ9K/U8YDheKoazlxj5XBZK8rt/dKmnea3EcjHy?=
 =?Windows-1252?Q?UNCvWI39TG/3BlTJ5h8vACeco1y5hXbYbK+IAISmhtAoTismp5Ifi6DO?=
 =?Windows-1252?Q?XMBvZKlk7fRgLtF//bDQOh/eGLTvv2U9REgnZF0Af+pEquswhn8c23sk?=
 =?Windows-1252?Q?m/BoNeZuq3qoNRKf4+FXOKJzBQa2gNWIy8AaVHEwkg3jh2vVC68CEnmk?=
 =?Windows-1252?Q?6OAFn5h6gT8fjoTpzQnCVcusHV1fPQjKhaExTVmWQkZmOq6WbDWzsAdX?=
 =?Windows-1252?Q?i7shT6O5ltJDn1Nactsm3KntHuvO0jmvZpK24Qhs+04ll7Osc0IlDGlG?=
 =?Windows-1252?Q?etoOT6SoVD1LPtdBrdFO2Olc/8i7jmDohoEV1wG3I/sevvIeO6tnFhn9?=
 =?Windows-1252?Q?TOjXZuIYqRH7jPJZs6lnDMd6GrRKKQ3TmQ7QDczxJEua7HJxtb5Po4Iw?=
 =?Windows-1252?Q?MS+1eYMriKzNo9LTj0Jodz7ZJ1AwWUT04uH01HPXgKuu+fmdHK417Wy5?=
 =?Windows-1252?Q?pidKtyuj6x8nmDp+Gqp2Wyat5tQ6IUbQw7vUOW2ARKNfJS4kOluL9xul?=
 =?Windows-1252?Q?cXrfNYJ0TZzVXd9JEclsSBgsR/Biltp0qylRsy52CdW7DbUuz0x7HqK3?=
 =?Windows-1252?Q?nxvvMS7pJqB0L0x83gedwKSlHpheqAF19msIFpF/hZxjKdk3CbJY1pFx?=
 =?Windows-1252?Q?zVFviRyOSsN0S+y7MSGeA/Wy1DVItd9nLItEiXKg4shqlTMZ/z6GgwZx?=
 =?Windows-1252?Q?zdUXp7VNjRzz694Ruk7Sm8DQm6Uq9xvkEgGUTlavHsRCD1iXHE1tj//6?=
 =?Windows-1252?Q?U3892667nX3lFxydGlFL0UEiWRGGes07fgbKdVIuwAFmJo8FuLzzvjrt?=
 =?Windows-1252?Q?ic5kIRJciClC/xBNOca+cxEFl3INbsRL9xV2JHcYngNE52ink48MN8YK?=
 =?Windows-1252?Q?Zy8ppUodC+vx9dZGxJc1K1RkdQD+iwLZS4COhZlQ3d5bp3erjqMsy3Ow?=
 =?Windows-1252?Q?nH5ZZjhHB1S04pdK6eHR83UiZPAdfHhaq6So2MFNzxT4hr8i+UMuOc/Z?=
 =?Windows-1252?Q?BTewhONteTOtdvMLH9zQuh61LtURh0PdY7vhkqBhlAH5KROquLt/6I6m?=
 =?Windows-1252?Q?L5rIWsFkwVqi8g6T/f7fsclSNoofDnlB6pZVOY/yNnuiuxNOukPdru3g?=
 =?Windows-1252?Q?dBCYgyAF9M484gQbgH5//p5b9U9PWDNbb8O829uTU40acga85/c+BxPv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a243c9-f3bd-4429-3010-08d981944c0a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 08:53:38.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abw2pLK/P0O59HMQf0nLwwhSGEd7d8gLjJlTO8BZVihJxrprZx48Ez4jBxco39ea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
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

Am 27.09.21 um 10:42 schrieb Pekka Paalanen:
> On Fri,  3 Sep 2021 11:47:59 -0700
> Rob Clark <robdclark@gmail.com> wrote:
>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> The initial purpose is for igt tests, but this would also be useful for
>> compositors that wait until close to vblank deadline to make decisions
>> about which frame to show.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
>>   include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
>> index 394e6e1e9686..f295772d5169 100644
>> --- a/drivers/dma-buf/sync_file.c
>> +++ b/drivers/dma-buf/sync_file.c
>> @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>>   	return ret;
>>   }
>>   
>> +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
>> +					unsigned long arg)
>> +{
>> +	struct sync_set_deadline ts;
>> +
>> +	if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
>> +		return -EFAULT;
>> +
>> +	if (ts.pad)
>> +		return -EINVAL;
>> +
>> +	dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
>> +
>> +	return 0;
>> +}
>> +
>>   static long sync_file_ioctl(struct file *file, unsigned int cmd,
>>   			    unsigned long arg)
>>   {
>> @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
>>   	case SYNC_IOC_FILE_INFO:
>>   		return sync_file_ioctl_fence_info(sync_file, arg);
>>   
>> +	case SYNC_IOC_SET_DEADLINE:
>> +		return sync_file_ioctl_set_deadline(sync_file, arg);
>> +
>>   	default:
>>   		return -ENOTTY;
>>   	}
>> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
>> index ee2dcfb3d660..f67d4ffe7566 100644
>> --- a/include/uapi/linux/sync_file.h
>> +++ b/include/uapi/linux/sync_file.h
>> @@ -67,6 +67,18 @@ struct sync_file_info {
>>   	__u64	sync_fence_info;
>>   };
>>   
>> +/**
>> + * struct sync_set_deadline - set a deadline on a fence
>> + * @tv_sec:	seconds elapsed since epoch
>> + * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec
>> + * @pad:	must be zero
> Hi Rob,
>
> I think you need to specify which clock this timestamp must be in.
>
> Which epoch? Sounds a bit like CLOCK_REALTIME to me which would not
> make sense.

Most likely CLOCK_MONOTONIC I think since that's what ktime is based on 
as well IIRC.

My recollection might be wrong but I think Daniel documented somewhere 
that an absolut 64bit nanosecond value should be used for timeouts in 
IOCTLs which is sufficient for ~500 years uptime.

So the separation between seconds and nanoseconds might be redundant.

Regards,
Christian.

>
> Also I cannot guess how a compositor should be using this, so
> explaining the expected usage would be really good, with reasons for
> why should userspace bother.
>
>
> Thanks,
> pq
>
>> + */
>> +struct sync_set_deadline {
>> +	__s64	tv_sec;
>> +	__s32	tv_nsec;
>> +	__u32	pad;
>> +};
>> +
>>   #define SYNC_IOC_MAGIC		'>'
>>   
>>   /**
>> @@ -95,4 +107,12 @@ struct sync_file_info {
>>    */
>>   #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
>>   
>> +
>> +/**
>> + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
>> + *
>> + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
>> + */
>> +#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
>> +
>>   #endif /* _UAPI_LINUX_SYNC_H */

