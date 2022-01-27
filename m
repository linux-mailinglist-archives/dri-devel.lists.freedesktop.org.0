Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D749E3E4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 14:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7143010EB88;
	Thu, 27 Jan 2022 13:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2A310EB7E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:53:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajM88M0TzGG3iYGahl+2PW9Y9uY+zepMHcU7bJZULL/lygAlih0BJEx86TmtqGLpqYVB34xS11nyYLA3W4q7a9WQI7t1l4Az3uJgL1OXNo5RKuGYuOSNZuv+pAcANL2WFTEZgliYw5UjosH+htNezARNS1Sl2yTSlOtjnD88r0Tcp2JeY5/EYOLHBlkYwCCfLrnOES9jiBuuG7GqiXQH4Tje4CXhNS03ZYPZdr5Wu7Tt+id1rVYTVjI1w11qhbO6LaUFpkTs0Jf9Hkirpj/AySVxNfpd6c2wiq1r2JVAmWxYPnHVvXV5PnfDPr6s/GLrbqqUo+Pa0zb/n9ODfK9/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moSgNriQUtaJjDQSwpPNYj+xXjnDzVA2R/XQvpxBSXQ=;
 b=gzEnzF/PTeo7Ea/8WDypoK6H29xlnJUhyr8Z54i5h4kY8U86yODdBIMJZY7i6cBa9GohabBkqhkIi2GIR30dsbNQXgjBIbZgAjGTIaZwScKchkc+WUjsjqalqw7cCkQdxCdt0F4UlzrMNU4WnV+ISRwkK95ulmm2yOoz1NVSxuUNVWUBYs5rCWFFmM72AWI9b6z3yEiFiC06KOPSfwrPW/hAl8IvcwZblIFoxS3FYpBvgp3qwzxlyTyp+IGhTVbzCszFym3mFgR6f+Mk2pH7irtD7mBqFl8vBLh/ChqO8WQjVVJFWnJ08ua/d6xJZBbroYgOyOnne4t6thschTtB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moSgNriQUtaJjDQSwpPNYj+xXjnDzVA2R/XQvpxBSXQ=;
 b=qUCfOIzyKPAKY5OyX/8rQteN8XFurzkC6ooAlmK7bkP8mTTzQCYCuDU4Nesu6uy4cJkHsVVVHKBgDDd0SV7i8qzOSoGga98wS00XkZc8T4jZRGAPCXBqlzAbfJgGRCv9JQPtIwzworJAeyiSvPEupEHbwZ90uTpCZMLID8bUQn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 13:53:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 13:53:13 +0000
Message-ID: <d1449d6f-86fd-95de-491f-69e2b479d08c@amd.com>
Date: Thu, 27 Jan 2022 14:52:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] misc: fastrpc: avoid double fput() on failed usercopy
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Krause <minipli@grsecurity.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20220127130218.809261-1-minipli@grsecurity.net>
 <YfKdDUxj2wpglXQI@kroah.com> <YfKdeQ+rMRR8y97b@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YfKdeQ+rMRR8y97b@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b597bbf-049c-4451-9be5-08d9e19c5c7c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4424:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4424351C6B2F5970AD57AAC283219@MN2PR12MB4424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yXq5p9AKCsOOhEq642s4xbu5+mV2Prfx7lCRmlwPVeJWYpS2VbOob5jv3uz3Tfk5T/0ICbrPlak3MhWUhhcwaPqBTPr3gADd5GAcEB+v26P2MuKrP+koyud1V0OIill+YV+ZBDhLNx2uSvCYttpgSGjhUGmEFDrePiTWbimOct4sFl8GsiFiqTZ+wbYN5aImziJ87Auk/e+t/L6aL0w/KcN8YphA+RBkZ0FnC8a8OgjCcTtz7QXvV7zCjbTinSELNBBQOKruEEi1solmOXi3A/dIdqNt8rQHxl+mcKtX1DxH2gCxkrxvDFTSmVQziLSFlHyLGG0Aw5YB79sl3eAgmwPuMldzz87we6vHDBFpjzow6jqIuuRap5c8qLwwopa5lree4xB9OrmscRxlBhI6HJI8pIHVpuGs6BMLnxJXZKDbCOO1hZj3qAT7t2nFOL0ioPH4+s4dLJ6iUZjmj5SzVCeQDTslzs+x5MO920oRnaN/zzNv+mCP8gg/svjmByqzdPXGbeCadKM4Vd7QH6I3J7RmInFofQ4OEJIBjLrsFgsUPQm1Lng+jGO+23PUHo67XX/wGT88cTfVvt8JxYJn4zOOpWkLJxB8JGbAppR7ZlYsbGvzPOOkhX6jBhaPT3x6rmgafuOv2dIb6mDycOfGm29/Ri4MoazwR2760XsVSeGq6k6SJoEa0YBC2RwZH/6WH43AEySCpil5xRe9NZ/7SWIujfXZKQu5Kyfl7uM5peSQU48ItqeDjlZuokSQoQ9P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(54906003)(6506007)(6666004)(31696002)(110136005)(6486002)(86362001)(83380400001)(2616005)(31686004)(8676002)(36756003)(8936002)(2906002)(316002)(38100700002)(26005)(186003)(6512007)(5660300002)(66946007)(4326008)(66476007)(66556008)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkRSemtINGdCQldVTGo2dGJMSEtFM2hOWG1QMVNzcmRhU2tnclJMRTRiVzUz?=
 =?utf-8?B?a0YvUHlKSGpSaUZXQU1xcmlya2cxbkZ6K0ZwWXNFMGVDczl0OWJDRFpBSW42?=
 =?utf-8?B?SjdCZmhpbHBXRzJaZ1VUOC9vSUpzMUVXMXBIcGJjUERaMzlGbkdydldYOXlS?=
 =?utf-8?B?RUUrc1pmSko4UFQxaiswSFVwbTh2V3M2M3VRWFBaQ1VFVDJsMGNPSlg2VnRC?=
 =?utf-8?B?RThENU1xS2RUUzRLMFpKK0ZNcHZwZjlIMS9QSldiMGc1azliS0l3ZmJXb1lC?=
 =?utf-8?B?SUh5QzFicFhVcVQ2eWJRRC9FMVhGdUxCMHM4c212d2hUdG83TzVSUk5KMWlH?=
 =?utf-8?B?SmNHZE02QVgvMzJ3Q2srWWZUYVFYZldGaEpKMkV2YmxCMGxwcmdtOHJ2RDlr?=
 =?utf-8?B?dXo1am14blh2Y3ZzdTdqaSs3aTVHZm5HOVpib21icWxtZEltNm1QWkd0Vml5?=
 =?utf-8?B?WHNuMlpSeE95eWVETWlxcVJFd0pLeks4V0Q5SWFQNXNGSWd1U3VrbGRQcGtF?=
 =?utf-8?B?OVdrY0VmZU41d2J2a3krYTVGZWs1V3JjN1plMkVCcENpVmVNcFlmYTMxdmZj?=
 =?utf-8?B?eGZTdUNXRE1CVFNVSlMra2tMWUFyalk5cWJnaDFTR0cvYm8rd1h6d21TdzBE?=
 =?utf-8?B?MjlwcWgzMjNXa2ZRSDJ4cXJhaUhvVmp6c3l3eUgyeDVrT2s2SDExSHRGa0sx?=
 =?utf-8?B?eno1YkF0WStkNy8vYitoREdhSWVhdUhwWm83ZDhTNDFrcUhNT2lVNWk0NDhJ?=
 =?utf-8?B?Um43N095amcwek83MWliMGhJa2orR0JIbTVsd1BYaCtmZ1BiTUNNdXloMmdW?=
 =?utf-8?B?eUw5VTZRZUt2QXU2emFxS0lDRmFKZFhCSzFuUE1KTkwraXlOR1NKaFA5K2hT?=
 =?utf-8?B?RTErbjY3cDVZeFl1MVh0dlZNbVZ3SmZPdkYyQVVJZ0dKMDlIdVVOakVBd2Fv?=
 =?utf-8?B?ZnBSb3pIUGw3TXkrS2RYK0RFWWhKU1d1Z3d2c3lRb3F4bU1SK0xZaWc4U2F2?=
 =?utf-8?B?SCtCdFVJQzI2WndqZTRIRGl3alkrWHRZTVlGa2JZYnZrUzhvR2F2Zm1SdGdT?=
 =?utf-8?B?Qnk2YnIzeEVXTTJHK3JGTnVPZEIxN1JVSDIzZTRxYy8rVEtnOVo3VlQ4aDdt?=
 =?utf-8?B?RUxRelpiSWVQRTQ4OUd2M3VRc2pVYmFoeldUaVpPaDNUaHlMRXlMVjA0VTNp?=
 =?utf-8?B?MjFwMHhkenJMQmtobzJBUmtiMWVJTSsvZER5K1g4RkkyK0tOd2xnOFdHTEpt?=
 =?utf-8?B?cGpYZHlOMEh3US9IMG9TRnVWcjNVNE96eEdJd1hiWmpPQVhyS3NNWXYzbmpr?=
 =?utf-8?B?R2YzZXN4QUNjK0l2bUtsbWlwTlZoaGl3VDlUV01JK3ZjVUJna3lIVGRJRjhx?=
 =?utf-8?B?dmtPajlvVEhhVG8xWlcreE8vWC9FSE1LLytYeHhyaVFDZ1hlRjcxWWNLS2RS?=
 =?utf-8?B?QldoNzU3c0Y5c0wxU3NOR0IyZ0FycXN6RDQwVzE0NGsxRTJ2TkN3Y1JXbzl6?=
 =?utf-8?B?UTRPK2ZFQnU2cms3OWw1Ulp0QldIaHhLeFZ2Vk9pUVlTb3d1c0J4elgwQjBk?=
 =?utf-8?B?QjA4WlNaU2NudXJyd1VUVDU3QUt1MkFPYW1JcHVnUEt4UWN1REFBYXkweXJZ?=
 =?utf-8?B?RG9zbkFIMEhNUkRhU0FOUDhBLyswUmdnZnN4RkdxYkFnVWsrMjgweHRMNUxs?=
 =?utf-8?B?WkxYYW9HSFRZK1UzWWJHYXJEb1BOVDNUVm5xQndXMlFrWk5hRDdBMndwd0U0?=
 =?utf-8?B?b0xZL0ZXZ3UrMnUwOEtVVnpBYlFoV2RsMVpVd1VmcS9BTC9ZVkJUYXpuc1Ax?=
 =?utf-8?B?bGZYSlZZUjJJY1JBdzBqR0lkYXhZVW1LcStJODlybjY4S1BzeUdiWklRT0lp?=
 =?utf-8?B?djdialRQb2liYXdxbENqSzBzTDYrNDVrdlB4UzJaRTBtUHNhampVMDNPQmMv?=
 =?utf-8?B?U0hJdmpzeFdwYVVmaGs3Vm02bVZXNW5qNjRRMjJSMzM5NDZBblhlYWFWTHF5?=
 =?utf-8?B?VnI2aXMzUWJIMktVdms1cUtKTUhuMFBScVQ4bzlEZ3RTNjQxYzQ3ZlJMaENF?=
 =?utf-8?B?dmVLYm03V21rbUw5bjdHMkVNWDR1SVV3MFNKZHZSLzNZeHZmYXU1Vm53VnVw?=
 =?utf-8?Q?WCBY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b597bbf-049c-4451-9be5-08d9e19c5c7c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 13:53:13.4641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHqpNJmNBl0lDnjS3Nq45F9AUsSlgpPhXnb0NAzpSkK3sEKoZxtCI3VomxR1hzY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.22 um 14:26 schrieb Greg Kroah-Hartman:
> On Thu, Jan 27, 2022 at 02:24:29PM +0100, Greg Kroah-Hartman wrote:
>> On Thu, Jan 27, 2022 at 02:02:18PM +0100, Mathias Krause wrote:
>>> If the copy back to userland fails for the FASTRPC_IOCTL_ALLOC_DMA_BUFF
>>> ioctl(), we shouldn't assume that 'buf->dmabuf' is still valid. In fact,
>>> dma_buf_fd() called fd_install() before, i.e. "consumed" one reference,
>>> leaving us with none.
>>>
>>> Calling dma_buf_put() will therefore put a reference we no longer own,
>>> leading to a valid file descritor table entry for an already released
>>> 'file' object which is a straight use-after-free.
>>>
>>> Simply avoid calling dma_buf_put() and rely on the process exit code to
>>> do the necessary cleanup, if needed, i.e. if the file descriptor is
>>> still valid.
>>>
>>> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
>>> Signed-off-by: Mathias Krause <minipli@grsecurity.net>
>>> ---
>>>   drivers/misc/fastrpc.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 4ccbf43e6bfa..aa1682b94a23 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -1288,7 +1288,14 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>>   	}
>>>   
>>>   	if (copy_to_user(argp, &bp, sizeof(bp))) {
>>> -		dma_buf_put(buf->dmabuf);
>>> +		/*
>>> +		 * The usercopy failed, but we can't do much about it, as
>>> +		 * dma_buf_fd() already called fd_install() and made the
>>> +		 * file descriptor accessible for the current process. It
>>> +		 * might already be closed and dmabuf no longer valid when
>>> +		 * we reach this point. Therefore "leak" the fd and rely on
>>> +		 * the process exit path to do any required cleanup.
>>> +		 */
>>>   		return -EFAULT;
>>>   	}
>>>   
>> This feels wrong.  How do all other dma buf users handle this?
>>
>> And you forgot to cc: the dmabuf developers, I think get_maintainers.pl
>> should have caught them on this patch.
> Odd, it didn't, not your fault, my apologies.
>
> DMA BUFFER maintainers, what happened to the MAINTAINERS regex that
> caused the above patch to not catch you all?

That worked as expected: \bdma_(?:buf|fence|resv)\b

We are only automatically getting CCed when any of the dma_buf, 
dma_fence or dma_resv structures are mentioned.

We could remove the trailing \b and match the function names as well.

Regards,
Christian.

>
> thanks,
>
> greg k-h

