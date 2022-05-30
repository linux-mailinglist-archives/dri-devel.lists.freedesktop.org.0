Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913E537450
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EF310ECB3;
	Mon, 30 May 2022 06:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370310ECAD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 06:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGaeygyF2QKfn5SCw3GJduO7QNBjYTXQWsQ/ZeRNN4ai3WI6hw5Ss/YsXqnli154hU6porcEiZf0kkahN4CGeRFFJC+PW385frTaw6xDEhPB3fN5itVgAhOlR9LlIiYzSqpCUBmdmpUa91lXw6Mr4eNTS3a4JV9ZehbmfLCkp5aLFUzmhGVvWuOxWzhuRDupDjXE1IbWAxMED+Tk6eCWmsOI0EBElRRRTKz5PBrv+Azk4ppBrUzZZsXQodgpUax8mZFO9ko6L2Yk8tr6YLRU5cKMStLxi7F/mK0u84kU/3nrobivdnslFRvBPjG6GgmKw0ktcrSCTKh4er/1MM+sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGBTsevFIkhOzkdyOkG0y8a7rdXls7BiOLnHQM0nRMc=;
 b=mhKyIZLs7GqTGyCjBm/m+lQpeOCHE7l9fhIvLQmjGp9XF87otz9EI7Vz52+Z/9UIlVNM/dktoKEV7zSQ1OyDB1MdCdEQ+0WyflBWZT2kk1jzCxVoBeed75l4QYNQugnP38ZrmtcB/W061QV7sIM9QeP4QHkU39BmXdyE1O/D2QcLOHaeBBv4StMUChzquJl30pIorMPoxWvMAiExWqN3J7SD0vL5IQp3n9ChU5FS5veLhpbK9zk9raY40EAp5iq2SKWfMqlAbHLAijmD0slvwAt+1FsJlwa1lFfyuQigTwi5pLoR1/Hp6ygYQZNRChQZQaq2KZlzDvf4akB/wIX2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGBTsevFIkhOzkdyOkG0y8a7rdXls7BiOLnHQM0nRMc=;
 b=Rh5kA35ZkHLZJ5/ugR/jFtoqiA4AviYC+y9R6tEDyvlMrqM+yexP2QBxaAV+Kkvv5d+kIOQY2PfuWIK5pObhINyXu9T4aISfj+m/5n1MMJl6v3F4/UVpCmXEELI6vPPlNWynJvCfjcq6HbUXMzqzgk16NvZohRafiyYjRd85MAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6584.namprd12.prod.outlook.com (2603:10b6:8:d0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.18; Mon, 30 May 2022 06:12:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 06:12:25 +0000
Message-ID: <38da6dcd-b395-f32f-5a47-6a8f2c6a4331@amd.com>
Date: Mon, 30 May 2022 08:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Kalesh Singh
 <kaleshsingh@google.com>, Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@google.com>, John Stultz <jstultz@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Hridya Valsaraju
 <hridya@google.com>, kernel-team@android.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <Yo4/XhWQkACWaPIh@phenom.ffwll.local>
 <CABdmKX2dC0fkFrCedjhzmheYiDVP4PnKBMeGkX3_bgrLjOiYOg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX2dC0fkFrCedjhzmheYiDVP4PnKBMeGkX3_bgrLjOiYOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68962840-7ff8-4ed3-97ff-08da42035dda
X-MS-TrafficTypeDiagnostic: DS0PR12MB6584:EE_
X-Microsoft-Antispam-PRVS: <DS0PR12MB658402D53AFFA448925010D783DD9@DS0PR12MB6584.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iEGwaKQ6DQLMjukixfoxe+mPbUY9FWIvzMhIeHGTzDOZrcvDUYd/sMDCHLX5y2ebIVM9PbOOOO+SyyUFQV7+N4zKyeOjpsw1uHx+6j4ydoMKoD7w1EPoDiPyNJTRBm1zmzCuBceKRQ+gbX2SS0ofwzmtyktJgty1O8lcMwQdVuoM7wz1YHkJB1c17idAW4/KdN83DZ8IlFqVz+5g3g9Xfvk6rBbme9QaXZ3inGcrXEULgonnFlJG9g/Hw56ZAxkXM1D1xibNCKw1C6sEmgX9F2nefJ5AYoSGDGgLIGIoSr7t7Mk66UynIOFirdS2/q7rMgIX+eZ1EcaWasdrlpxlnK26FH3/ZxYks70qQ4m6UctW9TsrFcPRNUTGGxOsU0QD0I6WZUcndY3MU/HvmqgI+qxMSOvYsi1X4ywnyoHBm0FZ8ranYW3yYaY00/2DH79cBdjsIl/qPB8RC0d9tGJhd3OpLsL25HS6LkVUtv7XrBq87tvGXi5XRchGpnh8kivBMcx1KtHo03CRHarGVW7a8UxqniCh5FqARRceP4GDepa6G4oYiNPrAAS2A0M4HBybquHJxyvJ+AK9Z5ikQKY5s7nE2/Gux1Kyx2A4hRNYBz8kOtSPnfOyUk7rFT2rEsvqfLaYImO4fj0AGlsupRsFDg3TlabajgqWmLNONg+CKGHh5UQ6nNzkk/Aa7+Z9cdg0YE62ET9VKsSRF6r8rksppe7u8hG170ViH6Lsl5gEiOgwO4UChj6wOL9r/zI1OANuzVjLzqB6G/Q789vqBQYdY0E2zKkfhrwgeCk++TrrMkl6c9R2v1u83pSJzSaEjhU66QeUqITTcQlgf0kMKPe+4dOAab3wQ0JIytUx8K3yblrHG+mdk3KuztxJnXKaaQ1G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(8676002)(45080400002)(110136005)(26005)(8936002)(53546011)(2906002)(6506007)(508600001)(921005)(38100700002)(6666004)(6512007)(31696002)(86362001)(5660300002)(7416002)(6486002)(66946007)(36756003)(83380400001)(31686004)(2616005)(66556008)(66574015)(186003)(4326008)(316002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REtOclNlYVJPUG8rT1RFMjc4WHJDTVBSQTEyUm5ZaWRmVHhncmdZL0YyNnV4?=
 =?utf-8?B?SjJIdHRzSjZZTFBOTWRlQzF6OEdMZGR0bkM4dmdYVzlneUtVaktpdjVqNWl3?=
 =?utf-8?B?MnBROWRwdi9TUDNwUUdFNFVHQlp5ejVaVTVJK3FIelIvN1Q5UDkvUU02WjhC?=
 =?utf-8?B?aWJHVXA0N2wzaW5IcUZxc3RuNjE1aUl3SEVNV25udFUwQjIvQkUwenc5UzA1?=
 =?utf-8?B?eDF2S2k3allOUDg1ZWhodU1SdVNOeTMzTG9uOHUvTjNrWXl3NjBPd29XVHBN?=
 =?utf-8?B?bnh5djRQV3lKMiszQkdYTS9LZlJKY0R1dFNqbWNpdzNyYlVIU253Q0VoZ05p?=
 =?utf-8?B?SEtmNVduSEdtQjZvbVR1aHovNCtUZVJvRlU3NFdNZmx2b3JsNUQwR0w3Nm9D?=
 =?utf-8?B?TUw1U2hpNDE5N3crT0pNSkQxVW5hVUthSXRPcnMxeXE2SFIxdE1TU0dZU1o5?=
 =?utf-8?B?Ti91R005ckRhUklaTjJNcVMyUXZjbDQ4d0xaQU01Q3VrVFlsc0dYbjBMUUpW?=
 =?utf-8?B?UmxvRzhmR0trZnpBMUYyWDAvb2VuVjJtZ0dINFVRNU8wa3pQR3hPVTZ5RGs4?=
 =?utf-8?B?M2trbUt3a25tZ1ZyeXJXRXE5QjdLbkc2NGYwNGhrMFFtQXBuVldrSHpScFo1?=
 =?utf-8?B?K1JwZEVVYnBKdHB1dGJXV1J6OFkrYnUrVlV6ajJiMkgvL0ZsTGxaQjNza2hl?=
 =?utf-8?B?YXdMNngwNkRPcDJ3OUt4dkpYOG9TYThmRUpQR3YxeDRwaFhtZGdNcWxycENQ?=
 =?utf-8?B?TlhaSzlUV1QwMFJhVnJObjl6NFNrMmg4ZmFzeGxlVmlCU0x4OHBuZ08rdjZN?=
 =?utf-8?B?d3VJTlp0M3loM2k5NC91YlJsYnJBK1o1Q3MwTVorKzI1N3BiQUZkdzliYkJJ?=
 =?utf-8?B?VnA2TTJGRjdobkJ6Q04wM28zOEt3VnFKSjlDa01ueW9BOGJXZHBoWkNkbGlT?=
 =?utf-8?B?SVVVNVR1TVJOWjducW1iMkZ3akowYnhnbW1tVElxTm9VUXlGYkF6MzM1d3JR?=
 =?utf-8?B?THpDWGVYVUtja0pRQkVrdytqalpnRzVFNWJSV29wOXl1UG0xT044d0NRMVV1?=
 =?utf-8?B?K3AwTTB2MEFvVDRWUlFEZkV3eEMrSlhjRy9Rcnp4NDlFK2UwUFhuQjNpWU9t?=
 =?utf-8?B?M1NNdTZmdTRCMlJOSzZSSFkvakJzcGVEWSsvOWxJd2t0VzVoTXM5LzNSQzFB?=
 =?utf-8?B?NysxNTFYWEdtMVJheFN4TkVDekdSNTFIam03dEFqY3U5Z0RsMHJiK3ZEd0p5?=
 =?utf-8?B?WVN4bWxhdWFWNCtJdFhGWlVaS3RHR1pHRjN4ZXFScEl3MG03M1RuSUVGT0ps?=
 =?utf-8?B?Skx1UFNhVCtzSkVIOTd1REVQUG8wRUkwQjlwN0kvTVkza0IyWkVPenBZcXZl?=
 =?utf-8?B?Z2pCOWhSV2lmRGMzZmk3NVlZMDRHMGt1azY0T1I2ZVdyT1kzWng2ZUxVY1JK?=
 =?utf-8?B?SlhHUEJobVZKd09sUUFqd2JNWTFLNHkybTJCZFFxWUlBSkJhQlhRRkgwbzli?=
 =?utf-8?B?eEpCejNkZzhBZzBrSUVuUG9hV25CbzkwNkZha3ZMOHVXdjJBM0lFMlRzdUR2?=
 =?utf-8?B?cGFSVWhaNWt1dmw1ZERCVkF1b1Fqek0xWHB2VDZac1NpMmNreWpmTjBudWVZ?=
 =?utf-8?B?bE5ESlAxbDVnT2xZWlo5dVI0U3dPY2pJaXNJYlcvRElYVWZKNHBwQVZUMDQ4?=
 =?utf-8?B?ZC9UK0dlcXMwRCtmL0JNQXlmWi9ycnhCODQ3cThqK0c4VnZ1TjZrbkZmcnNJ?=
 =?utf-8?B?RlFLYi9iOHlJT002dFhQUmZGeDdvWGxjZUlDUmhKcFQvR2lWYTlsK2VMbWs2?=
 =?utf-8?B?WXRNSFhTWElzOXVuVlB3T1Yvb3B0bkxWSDN0UXRHUjdIcUVrazFlMVdpZjNL?=
 =?utf-8?B?YUtHWVpMQmZlVjV5amRBbjcrSm82a3hrNFRkL0lHdHlBZEFTZ0dIaHlIM2xJ?=
 =?utf-8?B?TUd0cFU4VzN5RzRhK2QzRlVsbEk4ZTlnQXluZGNDZU5zNXk5MkNFZDNwM2Vo?=
 =?utf-8?B?UmZnLzVRc0Q0MFhmOVZrU1Z3NkVPU3Y1Wkw2RGlwMVVQN3BKSEJaK0hPSzF3?=
 =?utf-8?B?RXlvelZtbzVlanVqbFNTK2ZHaHhMQnJRQS95YmI4ZUo5cU8zbER5ZDhoVmpM?=
 =?utf-8?B?Qmo3bncxZXRYYU5iWDkxREZlWW5pVXRpTGVDRFNiU25MdEJpQXhNVGJwanJa?=
 =?utf-8?B?T0NWa0NrdGlTYXZwNmptTER5OThVSk83TGx1MnBISGZVTlVkL3VlditxcDh5?=
 =?utf-8?B?QlAxTDJtUFRVMGlqa3JvVFI4MTZZSUJQMXpGdnlMdmdWTjVtUGhPMnhwZ0t0?=
 =?utf-8?B?bDJqY2ZkUWJPUVFVYThYZ3ZvNjNhSTVSYVlvMFltb3N0QzQyeS9pUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68962840-7ff8-4ed3-97ff-08da42035dda
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 06:12:25.4850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AsKLhmTV1sPaktRbmYExys1+54mFpzTBgRuBRgwQQMoyMygzJ1zZ1764HQ3vk0e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6584
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.22 um 23:05 schrieb T.J. Mercier:
> On Wed, May 25, 2022 at 7:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Tue, May 17, 2022 at 08:13:24AM +0200, Greg Kroah-Hartman wrote:
>>> On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
>>>> On Mon, May 16, 2022 at 12:21 PM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>>> Am 16.05.22 um 20:08 schrieb T.J. Mercier:
>>>>>> On Mon, May 16, 2022 at 10:20 AM Christian König
>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>> Am 16.05.22 um 19:13 schrieb T.J. Mercier:
>>>>>>>> Recently, we noticed an issue where a process went into direct reclaim
>>>>>>>> while holding the kernfs rw semaphore for sysfs in write (exclusive)
>>>>>>>> mode. This caused processes who were doing DMA-BUF exports and releases
>>>>>>>> to go into uninterruptible sleep since they needed to acquire the same
>>>>>>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
>>>>>>>> blocking DMA-BUF export for an indeterminate amount of time while
>>>>>>>> another process is holding the sysfs rw semaphore in exclusive mode,
>>>>>>>> this patch moves the per-buffer sysfs file creation to the default work
>>>>>>>> queue. Note that this can lead to a short-term inaccuracy in the dmabuf
>>>>>>>> sysfs statistics, but this is a tradeoff to prevent the hot path from
>>>>>>>> being blocked. A work_struct is added to dma_buf to achieve this, but as
>>>>>>>> it is unioned with the kobject in the sysfs_entry, dma_buf does not
>>>>>>>> increase in size.
>>>>>>> I'm still not very keen of this approach as it strongly feels like we
>>>>>>> are working around shortcoming somewhere else.
>>>>>>>
>>>>>> My read of the thread for the last version is that we're running into
>>>>>> a situation where sysfs is getting used for something it wasn't
>>>>>> originally intended for, but we're also stuck with this sysfs
>>>>>> functionality for dmabufs.
>>>>>>
>>>>>>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>>>>>>> Originally-by: Hridya Valsaraju <hridya@google.com>
>>>>>>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>> See the originally submitted patch by Hridya Valsaraju here:
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C8f00afd44b9744c45f5708da3e926503%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637891095771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=pubWqUyqhCWpXHhJHsoqarc3GLtB6IFB1rhgfsL4a1M%3D&amp;reserved=0
>>>>>>>>
>>>>>>>> v2 changes:
>>>>>>>> - Defer only sysfs creation instead of creation and teardown per
>>>>>>>> Christian König
>>>>>>>>
>>>>>>>> - Use a work queue instead of a kthread for deferred work per
>>>>>>>> Christian König
>>>>>>>> ---
>>>>>>>>     drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++-------
>>>>>>>>     include/linux/dma-buf.h               | 14 ++++++-
>>>>>>>>     2 files changed, 54 insertions(+), 16 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>> index 2bba0babcb62..67b0a298291c 100644
>>>>>>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>     #include <linux/printk.h>
>>>>>>>>     #include <linux/slab.h>
>>>>>>>>     #include <linux/sysfs.h>
>>>>>>>> +#include <linux/workqueue.h>
>>>>>>>>
>>>>>>>>     #include "dma-buf-sysfs-stats.h"
>>>>>>>>
>>>>>>>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>>>>>>         kset_unregister(dma_buf_stats_kset);
>>>>>>>>     }
>>>>>>>>
>>>>>>>> +static void sysfs_add_workfn(struct work_struct *work)
>>>>>>>> +{
>>>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry =
>>>>>>>> +             container_of(work, struct dma_buf_sysfs_entry, sysfs_add_work);
>>>>>>>> +     struct dma_buf *dmabuf = sysfs_entry->dmabuf;
>>>>>>>> +
>>>>>>>> +     /*
>>>>>>>> +      * A dmabuf is ref-counted via its file member. If this handler holds the only
>>>>>>>> +      * reference to the dmabuf, there is no need for sysfs kobject creation. This is an
>>>>>>>> +      * optimization and a race; when the reference count drops to 1 immediately after
>>>>>>>> +      * this check it is not harmful as the sysfs entry will still get cleaned up in
>>>>>>>> +      * dma_buf_stats_teardown, which won't get called until the final dmabuf reference
>>>>>>>> +      * is released, and that can't happen until the end of this function.
>>>>>>>> +      */
>>>>>>>> +     if (file_count(dmabuf->file) > 1) {
>>>>>>> Please completely drop that. I see absolutely no justification for this
>>>>>>> additional complexity.
>>>>>>>
>>>>>> This case gets hit around 5% of the time in my testing so the else is
>>>>>> not a completely unused branch.
>>>>> Well I can only repeat myself: This means that your userspace is
>>>>> severely broken!
>>>>>
>>>>> DMA-buf are meant to be long living objects
>>>> This patch addresses export *latency* regardless of how long-lived the
>>>> object is. Even a single, long-lived export will benefit from this
>>>> change if it would otherwise be blocked on adding an object to sysfs.
>>>> I think attempting to improve this latency still has merit.
>>> Fixing the latency is nice, but as it's just pushing the needed work off
>>> to another code path, it will take longer overall for the sysfs stuff to
>>> be ready for userspace to see.
>>>
>>> Perhaps we need to step back and understand what this code is supposed
>>> to be doing.  As I recall, it was created because some systems do not
>>> allow debugfs anymore, and they wanted the debugging information that
>>> the dmabuf code was exposing to debugfs on a "normal" system.  Moving
>>> that logic to sysfs made sense, but now I am wondering why we didn't see
>>> these issues in the debugfs code previously?
>>>
>>> Perhaps we should go just one step further and make a misc device node
>>> for dmabug debugging information to be in and just have userspace
>>> poll/read on the device node and we spit the info that used to be in
>>> debugfs out through that?  That way this only affects systems when they
>>> want to read the information and not normal code paths?  Yeah that's a
>>> hack, but this whole thing feels overly complex now.
>> A bit late on this discussion, but just wanted to add my +1 that we should
>> either redesign the uapi, or fix the underlying latency issue in sysfs, or
>> whatever else is deemed the proper fix.
>>
>> Making uapi interfaces async in ways that userspace can't discover is a
>> hack that we really shouldn't consider, at least for upstream. All kinds
>> of hilarious things might start to happen when an object exists, but not
>> consistently in all the places where it should be visible. There's a
>> reason sysfs has all these neat property groups so that absolutely
>> everything is added atomically. Doing stuff later on just because usually
>> no one notices that the illusion falls apart isn't great.
>>
>> Unfortunately I don't have a clear idea here what would be the right
>> solution :-/ One idea perhaps: Should we dynamically enumerate the objects
>> when userspace does a readdir()? That's absolutely not how sysfs works,
>> but procfs works like that and there's discussions going around about
>> moving these optimizations to other kernfs implementations. At least there
>> was a recent lwn article on this:
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F895111%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C8f00afd44b9744c45f5708da3e926503%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637891095771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Q58OZi79vmKMCZLL0pY7NniIW6hmSqyWjlEaZgqzYtM%3D&amp;reserved=0
>>
>> But that would be serious amounts of work I guess.
>> -Daniel
>> --
>> Daniel Vetter"
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C8f00afd44b9744c45f5708da3e926503%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637891095771223650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=pOIl5yszzak4TPqjBYyL0mHjj%2F1nYRfNJbNPQTXBhbA%3D&amp;reserved=0
> Hi Daniel,
>
> My team has been discussing this, and I think we're approaching a
> consensus on a way forward that involves deprecating the existing
> uapi.
>
> I actually proposed a similar (but less elegant) idea to the readdir()
> one. A new "dump_dmabuf_data" sysfs file that a user would write to,
> which would cause a one-time creation of the per-buffer files. These
> could be left around to become stale, or get cleaned up after first
> read. However to me it seems impossible to correctly deal with
> multiple simultaneous users with this technique. We're not currently
> planning to pursue this.
>
> Thanks for the link to the article. That on-demand creation sounds
> like it would allow us to keep the existing structure and files for
> DMA-buf, assuming there is not a similar lock contention issue when
> adding a new node to the virtual tree. :)

I think that this on demand creation is even worse than the existing 
ideas, but if you can get Greg to accept the required sysfs changes than 
that's at least outside of my maintenance domain any more :)

Regards,
Christian.
