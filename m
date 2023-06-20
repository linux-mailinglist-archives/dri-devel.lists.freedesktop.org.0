Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39973647D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360D310E27C;
	Tue, 20 Jun 2023 07:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C223C10E279;
 Tue, 20 Jun 2023 07:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNqvMG2D7GNiR1HqwRdKvLeZMbt0e9Te1XOdTdvuZtXLz56+R2+xPCREDTVZHbjx1ZRCokZbCNK6a1MToRsifzdPSi9c7O756vqCqQJEfu0Bjtc3sOgUsW4Nyh+Otug3haNN5yFphLn0L/IjNiSfl/a5mG1WEMRXT51kcxOTz9WS83EIRhQoD8vk3F36II/hwsz3oszXKOf990WGqLKB8p98Ba9NCAfks+FsMv9/4A/wl5yQ2XQ7d3zanvEACUiwiyUZ6bls030SI0QCK9PUKltfBYC0F3KoUQyErXVxw4l8ko8d3/sIoECriffA68Ask4wTzqdXw6tL+lU1h8o72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LskBrk7gxbNTnx04nF3j0XVmxfHWoIlfLTHbgSPGtmQ=;
 b=lx1sBek6PeN6hIRq2eTAQQrPZcLmJ+f9p18SqjyI6KOgiblgnqXKfzQlryMtzHRKiSiJpl3HhNMuFqDrR6O/nXHBkd4R2Wh50k3DhBNlRE0mQpjUN/dFIg4bvHUDu8yehVcNF5JvTYbTGVWm1s2CTHd7ynN8JUQbgO/z3HhV3shUAPMJaIjGL+yjk7s+SmIh6SWpGl5Vvyzhbz8aOOhdOMxwVbvR6AZCiGDftYuzT3GReFDH+8p+5FBbDAo+xXDZV27a12Wt04iZ5K0CIiSu/BkNYRyXgJBlCDdhmrBCKrRlo3TR2CBjRx36dXlMOohCGWOWOTRESjoB6FIGX5SM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LskBrk7gxbNTnx04nF3j0XVmxfHWoIlfLTHbgSPGtmQ=;
 b=VtcgDBkfdaA4ItIIMrrnBaLbaygOfZzkekD2TVt3Y+jFezSIK+62eDLzfW4nHIGxEdtMgGG3e4eUcXFB6vPPEkPgdJ7O0NQCAn80sAXWYcxBwJ3jdtFTN1JzVOXMAuRFHqIfRXiaSiuEY4BZXAmbSTvtvmazF0mkc/edJHPOh4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 07:28:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 07:28:31 +0000
Message-ID: <4249d484-51e1-8029-379b-de5cb75ea3c8@amd.com>
Date: Tue, 20 Jun 2023 09:28:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <20230619121234.4a826f53@collabora.com>
 <26c94e6a-9458-7aeb-8e6f-85838bac43ca@amd.com>
 <20230619142923.74c21fca@collabora.com>
 <20230620084704.154b95e2@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230620084704.154b95e2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a344cb6-d407-4a6b-3e2f-08db715ff2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JOFiD3FpHIC5B/ej2BRGhUJtbYUl6pY1oLruxC3irGS7hydAJmO4hgIRSYI/r6OCCyos04YEz36BKYTGx5K8xIyCG6MOPwiIoufGBJ+PZ9VoYVvsQjNMhCBvoIQbZ1NfHsMSk/ZUjcDrmelvjcohuys2nxkecaJH8qaRKIVkia/Sr3JM6A/TEl57ZN1I/ylYt8nwVmBb9OXKTGmc9CPHvVn82l4EHQhgyAcCah4HagUZNkgVu9HoTTb4WLohtpHccbUMJzPMKNslsiqDDeLzeHWczpP8fMuoSQwqqq7j1z1b21vJptapuELVr4SjKfRD+HCCl+bX5xLVU78l0G1hnimfT4tice5XsZk7C1/t0/qmtaf2LLGWpMD0ye7UPnyPAkABctueZhYtwpa8LAXaVqE9xZ2+RADalyLpEAUm4UxC+WVcFAZEV+EzaH0fRtyNrtv3Cl6m2QVEYkhBHXY2HjJiW2uKN7IJZkMU/d9YA0Uth3R9Ka+c4BONU6jQ1lwwd4J/S3uNGWchUv8Zo5l2KvpgV9ERyvTdNfG42ajEJYBClKEmITLkrM+tnXYCXgmV0ffljlgr6gxlDUzyK3ph5dKrJvydSTqFOCtDQmstuz/vxb/HhYV4HB606SRdIFDRTxT6watAE/H0ersRxlzKfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199021)(31696002)(31686004)(66574015)(83380400001)(86362001)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(6916009)(316002)(2616005)(6506007)(6512007)(6666004)(186003)(6486002)(478600001)(54906003)(4326008)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGZsR0VWbTdMRk9QNCswMlF0NVBacExPaExJVktnVXI3K1J2OHlWSE1DWDZH?=
 =?utf-8?B?WDhBdlVpelIwcXJkeng2d0hIQTU4MTk0cW81Z2p0V0w1VFBuZFp3UG9xdkhO?=
 =?utf-8?B?Y3hBbTMxSGZ0SDU1TzY5dnpvQzJ2YTFJR3o4blBzZUxlakxhcmRHSHRQMDNt?=
 =?utf-8?B?WmkwVENuMm5DaW1wOVI1UDVqWW5najVKckVVVC8wUS8vYTBGaC9hUzdRRCs4?=
 =?utf-8?B?UUQ4VHhEMFUvWlQ5MXFtMkRUN3ppZ3piZDVrbzN1MnlRZ3ZHcTNIb2wyS0ZK?=
 =?utf-8?B?T0toWk9rVTFCdW15VjJJc3J5c1Z5TWxhQW9aRGlnV1VTenFYRHgva0VKK3B5?=
 =?utf-8?B?dXRSS0ZzVzRvN2V1VnpnZXdEdTN4SDlobXN4ZW5NaUp0S0FIN0tlaEY5YjAv?=
 =?utf-8?B?YVZxSkkzZmxsb0dRMFErRWZ1dzlxQzU5SnNsNjF1T3NXYm9WM0FqZlY2TE91?=
 =?utf-8?B?M1BReFdtRFcrblM2YlR3UlZNWWN2eVJnT0h4YmNFbnRMb1FGeXJCbms1SmM3?=
 =?utf-8?B?VTFqSVJXdFlGanI1aE5OOEhBSHJUVDArZlM4czA1MWxubFVQM01TUEJvTkk2?=
 =?utf-8?B?Q1NUbjQ0enNXTXF3OHRxNVRnanZNZi9NMFkwRTc1WW8vUGkwVXoxWjhJVml4?=
 =?utf-8?B?YjJWekNyYkptRUpJVU1iSTdJQmJOUGRKMDhKLy9XdXZTWVFkSUZaVE5zNTRu?=
 =?utf-8?B?MnJqNW1QZ1prZlhmWVkvbnBjUmZDRERlOXdOdDFGTzlZZFF5ZEpINTJSNnoy?=
 =?utf-8?B?UmtkNTd2dTlhTDVlSVBBMnNZZjlYMHBOamltczJabTJ0b0ZHaXR2VUtDa2dr?=
 =?utf-8?B?VHFESFpWZCtFbUU3bjJPcllreENCSnlhS3lKL0FycDhqbnBCcitoN3RPVTdm?=
 =?utf-8?B?NXBjTkxuVzdaNmhUdlV2cklxcXlQWkN3UXNsOTUzYXdUcEhGaTZta0FMWUhX?=
 =?utf-8?B?VTVCdmxERjlNU2pZUGh5MVB0M2lMV3E3ZURNUU9BQzVMbnh2b1Y3RnJHWkx5?=
 =?utf-8?B?VGZqTmhWTStDS0QyaVZkZ0J1dytaWUgvaVo5ZFhyREp4ZHN6QmxiMlRabCs1?=
 =?utf-8?B?SS9NRkdoWkJJNzlKNXNrSnpoaDFrSTJvekljRE4wTDcyazY5QkNDSzdzdVg2?=
 =?utf-8?B?ejFneUdxSmtpYzYzQy9jZmZJbzBQN21jVkx4U3A5cmZJMVhxM0FUNVVMcHpO?=
 =?utf-8?B?eitLUXh3NmZicGxmT0syWUY0VlF3cFNHd1RmZk83dlhRcjhBdHRXMk8xZzhJ?=
 =?utf-8?B?dHJRT2t5NC9FdXZiYXhXZUtRckdsSWwvSUk5SXpCVVA2R05qd0YyL2lZRUJo?=
 =?utf-8?B?c2ZhQkJBQWtBbkYveU5SOVU4UmxVTWJzMFVLTjFnYkdRaGVoN3J2RUNBQlhJ?=
 =?utf-8?B?WmFjSTZ2WDdoRlVCTkhwYVhsRWc3WjVOTllIRjRVdWNkUlNNRHluakErMitj?=
 =?utf-8?B?aWlHV1FCVXVkeHhxQ1lFRUdPclRESlphMWFpSnpoZkJRZENBNWZPTXJVeHZF?=
 =?utf-8?B?L0xlNFJVTVB6SG42QXQ4bjlUd2ZRTU4zQlg4T0s4cEFpMTFxcVpoVUlvTEFi?=
 =?utf-8?B?V3pDTWFzcERNbUpQUDJNRGNKN2s0RC90ci83Ykw1UWdqa0hORlVMQXZNbFJP?=
 =?utf-8?B?bGhMWENVRXl1N0x0OWd2bUloTTUvUDJwY05rS1NoRE1FSWczQW1tdlpWR0Nj?=
 =?utf-8?B?bzhZeGI0Y1l4VGZUUEJGZ2RaNWJWRkNIODRMdFd6K1F4WUlFVVFKUFA0YUxj?=
 =?utf-8?B?b1l5cUZEUGhHTE1FMDN0dzViLzMxQ2djOE1kdTY2NmNMQlJnemt4SHVyRTZz?=
 =?utf-8?B?SHRPZzVHVFc0V1MrMXh3MGMybk5odCtGU0poS2h2c3NhVzJreWZXa29kcDJN?=
 =?utf-8?B?K3VqMzdSMTN5OEhhSEYyWFBTT3JLaS80Ump0R2Z6aVNmKzMyaVdqcGQzeFRY?=
 =?utf-8?B?Tk9ZUzNUbWJQNDNNOUpYK2tqQVJQeGtRQzhHcFlaOVNXSHlnK01XNlgrd3NJ?=
 =?utf-8?B?bUZ1KzdBOG1UZyt1MVF3emp6TDZCN20rY0dQOVJvR0xnQllKM3J4RmZXbWN4?=
 =?utf-8?B?cGhkYjdtYzgrYmMzOXhuWTNIT2t1c1lHL0hLRDdiYUFFT3M3QndTVEI5RXJi?=
 =?utf-8?B?TFZBcEVMT3ZRWWZxVmdXLzNJZkhXaWtCSjBLNFlYbHBobnZoV00wTTl6Nkh0?=
 =?utf-8?Q?cdHbLwX6UfEJ1Wt5lkEeOM3bpRtWoclkd8JmJJjZhCcJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a344cb6-d407-4a6b-3e2f-08db715ff2b2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 07:28:31.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBXGktizyRvUJxTdOSv1iRu1fgCmuythNo/QlFYJLsr47saVdL12BKvUyfsXzmqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, felix.kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.06.23 um 08:47 schrieb Boris Brezillon:
> On Mon, 19 Jun 2023 14:29:23 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
>> On Mon, 19 Jun 2023 12:44:06 +0200
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> Am 19.06.23 um 12:12 schrieb Boris Brezillon:
>>>> [SNIP]
>>>> Note that the drm_exec_until_all_locked() helper I introduced is taking
>>>> an expression, so in theory, you don't have to define a separate
>>>> function.
>>>>
>>>> 	drm_exec_until_all_locked(&exec, {
>>>> 		/* inlined-code */
>>>> 		int ret;
>>>>
>>>> 		ret = blabla()
>>>> 		if (ret)
>>>> 			goto error;
>>>>
>>>> 		...
>>>>
>>>> error:
>>>> 		/* return value. */
>>>> 		ret;
>>>> 	});
>>>>
>>>> This being said, as soon as you have several failure paths,
>>>> it makes things a lot easier/controllable if you make it a function,
>>>> and I honestly don't think the readability would suffer from having a
>>>> function defined just above the user. My main concern with the original
>>>> approach was the risk of calling continue/break_if_contended() in the
>>>> wrong place, and also the fact you can't really externalize things to
>>>> a function if you're looking for a cleaner split. At least with
>>>> drm_exec_until_all_locked() you can do both.
>>> Yeah, but that means that you can't use return inside your code block
>>> and instead has to define an error label for handling "normal"
>>> contention which is what I'm trying to avoid here.
>> Sorry, didn't pay attention to this particular concern. Indeed, if you
>> want to return inside the expression, that's a problem.
> Sorry, that's wrong again. Had trouble focusing yesterday...
>
> So, returning directly from the expression block should be perfectly
> fine. The only problem is breaking out of the retry loop early and
> propagating the error, but that's no more or less problematic than it
> was before. We just need the drm_exec_retry_on_contention() helper you
> suggested, and a drm_exec_stop() that would go to some local
> __drm_exec_stop label.
>
> 	int ret = 0;
>
> 	ret = drm_exec_until_all_locked(exec, ({
> 		...
> 		ret = drm_exec_prepare_obj(exec, objA, 1);
> 		drm_exec_retry_on_contention(exec);
> 		if (ret)
> 			drm_exec_stop(exec, ret);
> 		...
>
> 		ret = drm_exec_prepare_obj(exec, objB, 1);
> 		drm_exec_retry_on_contention(exec);
> 		if (ret)
> 			drm_exec_stop(exec, ret);
>
> 		0;
> 	}));
>
> Which is pretty close to the syntax you defined initially, except for
> the '0;' oddity at the end, which is ugly, I admit.

Yeah and it looks like giving code blocks as macro argument is usually 
also not a good idea.

How about this:

#define drm_exec_until_all_locked(exec)                         \
         for (void *__drm_exec_retry_ptr; ({                     \
                 __label__ __drm_exec_retry;                     \
__drm_exec_retry:                                               \
                 __drm_exec_retry_ptr = &&__drm_exec_retry;      \
                 drm_exec_cleanup(exec);                         \
         });)

#define drm_exec_retry_on_contention(exec)              \
         if (unlikely(drm_exec_is_contended(exec)))      \
                 goto *__drm_exec_retry_ptr


The problem is that you can't declare a label so that it dominates the 
body of the loop.

But what you can do is to declare a void* which dominates the loop, then 
assign the address of a label to it and when you need it use goto*.

The goto* syntax is a gcc extension, but BPF is already using that in 
the upstream kernel.

It's quite a hack and I need to extend my testing a bit, but as far as I 
can see this actually works.

Regards,
Christian.
