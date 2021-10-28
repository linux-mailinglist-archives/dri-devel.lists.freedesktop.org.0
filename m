Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32943DD0B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 10:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388DC6E823;
	Thu, 28 Oct 2021 08:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B9B6E823;
 Thu, 28 Oct 2021 08:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtDywBoDcKrVRxpawqIW7I8qjRltz3n1hAtMbBZsBikxWOfisSQ1mP0P8/PoPDqe1T9AEu0sakv+6nzgY4QUfQt01y2ic8/3sN0S88umWhJplNvW9fH3qDlLVKh1RG9r2kjkHg51gOw7ry8pVR44t/zprmYX/asQwQQoVx0edFqTtk/ZH5zB24SU+qDlFDlNwdLyxM385pIgJV+SXTmtTfwvxd+RrLHCBvLEukwYMHqLYSpiKvODMCQH9hrKRgXCjJK9kVamZ/0urwmY8igfijpaSURXBmH6q09vK+4PPjdKNwYQlyvBlSLjqG8oBD+cXIIe+qBuyT6XMJzsevtGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpPSt2LFNI0ePMyjYQsYTW6oJRVj0Ado9LwjC/N4geQ=;
 b=QsHhUnjL70xNrL/fotvs3AY7kRBLUgHdbUYN4VG9aWlHcuLEL1Krnp7PN3FZfcGgjztz7KfI4oWTBhff8O7NycomqUDjRo2iwrndci2ExX1LhLfIRAZiGXWmm4T6uX/pdSXrjtA8UkTUMksTWMSBnC9F7MZf/YZ/h5W2yh0HL5scsiK4UFZZ4eqQ+1rqyf1Usn8FMe6oa/EfmZFe69wQ9dQZBy+0h9LvAKQh/rNgF7dL6DI39KB2Zj/8/1tKafKtOvIjEqZbGH4jjrMZConcgBflcR1mOFY4UOz2k5qMQCcaGa2tyJRLYpOoGTpF2Lv69/6Xp+3sbR351NVohkRn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpPSt2LFNI0ePMyjYQsYTW6oJRVj0Ado9LwjC/N4geQ=;
 b=Qtit79VCIlm/DOv97l9+OBtYgmE9vSr23FIJyHqY61PH82779J087RS+Ep7223Q+/SArH7GmLqT78wXHlRDMjQbPIbEPEx+ZUFywU0OV6K/zCVwcTE/sdMXM2EwCcUm/GJaTeV/etO5Qr3uVrGZajJ37N2wM7YdmWLftH4GbfnY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1341.namprd12.prod.outlook.com
 (2603:10b6:300:11::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 08:41:46 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.020; Thu, 28 Oct
 2021 08:41:46 +0000
Subject: Re: [Intel-gfx] [PATCH 02/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-2-maarten.lankhorst@linux.intel.com>
 <022f8ecb-37c0-3d67-563f-012f0a3651df@amd.com>
 <c7c82fa5-6fe5-33e2-e224-c5433020100c@linux.intel.com>
 <007050d3-0207-5226-0cbe-7a3d8679811c@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <810de535-0902-04ef-be13-35c978fd80bc@amd.com>
Date: Thu, 28 Oct 2021 10:41:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <007050d3-0207-5226-0cbe-7a3d8679811c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0101CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::46) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM5PR0101CA0033.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Thu, 28 Oct 2021 08:41:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cdc92db-92a0-44de-0dd6-08d999eec66d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1341:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1341E41AEBFDF975360CA6DF83869@MWHPR12MB1341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9R01zXQ3peLlHsxTEnaoKPkMDFujk10hY+azpGb6VaCOyYmkTr3V2cOYU6dsvilAj7knJpRkjX1I4bOJR5E58eKp+Tdbz0DYESmApJCsOcR2XE+TL+kgjcVJ8AF8W42uoJAnGUkees8Zx8EfaB8kGvcD+xM3x5DArEYDIJ3Sl5wdgHeoeRZvadt5+MJe1KOiyzBdLgtBJnTeIa59w67npbwWPMsNZTrh1AkfxUHCvIP8qgm1bMNTdQ2tIKJa+K47GKms/E9U8U9kR9A+v7JG/Xp5dePc+YZ7HQUUnaANXnJRRKSvXQ87PauWz56j5Z0vIsgx7K3rLPHGYhKTtzBm4cdUQ+Z+6daU2oIxSrJByA0Cmxcr5T25+MyqWIJornoz8KfJmi/yBCgurOZJX3M5ch+rTJlov6EV99rHDUd/R4CxsJu9OwHYr8bvUwYGoWC+FBZ0BmeXg/Wkb+DAwJgyzbdo5l/bGO5cOvP2iNT9ggZfLFxJA0lPUT9teXC5mxAyDsuAk9RyX+vur/Xk6SttIGzp7ZZEGax234WSeSIKaCedIl26QjnnOobHYDSGb9Q32u1RY8wMMGl4owWsVkXa+U4o2XP9lC3GDyTwk06mPedNMofDWvPwkcpFXycSsmZq1BkurqeJa+xSlKS1eBtCWrOLkHhUyvnUpSmbGhjmXK5gpH/X3p9RYCMTjJxQloJL2VDlMVubNKoDGqIbfpks7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(6666004)(53546011)(508600001)(6486002)(186003)(316002)(2906002)(16576012)(110136005)(4326008)(5660300002)(31686004)(956004)(66556008)(66476007)(66574015)(36756003)(66946007)(8676002)(38100700002)(83380400001)(2616005)(86362001)(8936002)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlUrdlJLSWQ4SmltdXlMbDVKNTBEbGhlNHZNUVlITUJrS0NFS28wMmxQekdi?=
 =?utf-8?B?L0VLYkxQU0NOV20wRW5rVVh3L0JtWitBSHNWM3J0MnAyQUh5YUpTZ2wxdXF2?=
 =?utf-8?B?RXJxYUhQZ052MGpROWJuWEtNOUZFZHhZL0h5eWtuOHRiWXdVQjBrWllFUmVm?=
 =?utf-8?B?NUZhRGE2SWJzNUlEQ0xHTVpYV0w5QVM3UEo5bTNuMnl1WWhKZW9RT2FNS0dm?=
 =?utf-8?B?bisvS3MvTE9ZRlJ4SzlKdlFWaVNKTmxpMFhoL2MybVVsR3VReWZPaHBsZ2tl?=
 =?utf-8?B?eHFsU0pKQmZtbkNWTTF0WUF6VUJZNy9CU2doMzdWaWpocXYzUUpkbnlMRHNt?=
 =?utf-8?B?SXhnSm9PTUMzNE50cnZ3bzRrWlJ0Zmc3M3N6SkRKZEZqVzd5WDFKUWR1aDE0?=
 =?utf-8?B?bEo0R2RkNll5cllBWFdwS1lLY0JsZXB4b2xyUjdwa014RVdOcndqTlIwd1Vs?=
 =?utf-8?B?Ym9YNG8zdVV5LzlMSWR2NnRTMkovSXRwOG9KaWxHOVRQNXIzakptYU1OeHR6?=
 =?utf-8?B?Qjk3TUtVcmE3VTE4bHZQdzdrSFFtbTExZ0hTekEzMWlWWGhmWFN5a2dpUzI5?=
 =?utf-8?B?ZGZDcm9HZmJacG42c2x2RUgydGt3NG82K0xvNlI4aFBIRTB0T1FlV0x5V2I5?=
 =?utf-8?B?WUcvMjNvTi8zYmN6NVIvMUJURk5teW9CZnIybk51cU9wVnc2NTdKQy9NUklk?=
 =?utf-8?B?TW9OZ09CSVVXYW9VS0pZTjZwK2V6am8wemljUmtpT0I3Y3ZXS2drVlZLVUM2?=
 =?utf-8?B?NHYyamZ0L1dnWnVIRXJLdSsydnAyem51Z0JOd2VDV1N1WUZyQUpuMktXWG9H?=
 =?utf-8?B?VThSVVowOFdhUXhySHdUWXh4TWJQZWJSdDRvL1ZWUlpzNEVzZkFUM0tRZzVH?=
 =?utf-8?B?TU9DQldHOUZRRVJjc0xtajJ5dWZzR2NNTEY1cGtjWUFFaHBCZmt2eXRDY2ds?=
 =?utf-8?B?OHFrT3lxZXBYR21LZldsTjkwei9JYSt5SXhEcFZuWDJlZ095T0xhWEtaSkIy?=
 =?utf-8?B?TzBsMG16bEUxSnhGVlJsYTdEVWpyb2VOWVNRZG5oWVpHaStGOFp2czl3SlRt?=
 =?utf-8?B?SUlJb3VKWkNGQkEzbTVkWkV0K2NVUW1WMlR4Ri94dzZuQ0N4cExEeEZMb2ly?=
 =?utf-8?B?UGRmcENEd1FtQnRNSTJ6L0NONm1DcW0vOHJsQzNZT0wreUtYUURXYVVLUFpI?=
 =?utf-8?B?dlUwTVk2cXRTK24rUE1PYWw1Z0UrVHA4VzlRSGN4Wm9tcm5kTkpQdnBTYzZV?=
 =?utf-8?B?K0hQNkt1K1c0dENhcERnUDRRdi9ZYzRKSTUzOHNrODJ0K0Z2cm5ReHU3RXBY?=
 =?utf-8?B?bkVseHllTFNhWjVEbnp2RWR6blkwbkhkVGQ2VGpIV3REdi80aEFCMFdPczdE?=
 =?utf-8?B?ZUZnT3ltUnNuSFIzN2FsOEd4ZzNva3I0eTlLdklyUWRIZTZMZ3ZpZ0lDSVky?=
 =?utf-8?B?d0M5aUVWYThNbm5vSG4yZmNUUmFsQWkrd1JhUmluQS8rRjgyK1Q4LytIc2s5?=
 =?utf-8?B?MzRrQnArdEFZOG9LWWZLMGpsa3hYYnY5cVlDVDJKV2M1TldUdkdYYndHSmln?=
 =?utf-8?B?SjJmbGtGdHFKdXRFL01mRGU4YzEzMWRJdGtDL2l1aW0zajF5ZWZ4SVdTdzJ1?=
 =?utf-8?B?ZFF1b0xNZzJLUzRPRE1HYkUxcFFFWEM3bjZUNU9CSktPMW15SGdoaGtnNkx1?=
 =?utf-8?B?L0lEZk8vMjVvOWhwZ0pCME0wS3ZqbzZSLzdjczZiRzhsUWNwSERHbDIybkJC?=
 =?utf-8?B?eE1ubzlvdk9aaG1rMzJLUGtoREpFSkhnaXlhZ2FWb0Q4ZDFpMjJueWVCaURS?=
 =?utf-8?B?RnY5Nm1LTit5UXJkUUdSTTdiSlh5RXJvZXE2bXA5NVV0bi9KQjkyMzkwYlJ5?=
 =?utf-8?B?c25RQWVCYjFoSlFFeUhKTGIyVFNPVHdUV3FDM0ErZVliWDArTHVJNW8zTUR5?=
 =?utf-8?B?TTdCZDNENEFPdWp2YmxwSmpQSklydHM5RTZFOThkMi82UlI0ejdrUENMMDhy?=
 =?utf-8?B?VW1raHR4VWdYNFFITm4vZXRZRUppYXNUakdNT0EwTnpVTXZ0Rk52c3p6WGF2?=
 =?utf-8?B?YmpKZmhGL2VEY3I1ckoyS1FVakxUbU1mQUw0SFV6YXpnUlVuM1I0eWFJdWRx?=
 =?utf-8?Q?QBwk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdc92db-92a0-44de-0dd6-08d999eec66d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 08:41:46.4695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6cHsPoYOv2HKX8PGYsl+dVgJhtPlp5je577RLRC9oVmdZ8j4012GvTnLRWBMQPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1341
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

Am 21.10.21 um 13:13 schrieb Tvrtko Ursulin:
>
> On 21/10/2021 12:06, Maarten Lankhorst wrote:
>> Op 21-10-2021 om 12:38 schreef Christian König:
>>> Am 21.10.21 um 12:35 schrieb Maarten Lankhorst:
>>>> From: Christian König <christian.koenig@amd.com>
>>>>
>>>> Simplifying the code a bit.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> [mlankhorst: Handle timeout = 0 correctly, use new 
>>>> i915_request_wait_timeout.]
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> LGTM, do you want to push it or should I pick it up into drm-misc-next?
>>
>> I think it can be applied to drm-intel-gt-next, after a backmerge. It 
>> needs patch 1 too, which fixes
>>
>> i915_request_wait semantics when used in dma-fence. It exports a 
>> dma-fence compatible i915_request_wait_timeout function, used in this 
>> patch.

What about the other i915 patches? I guess you then want to merge them 
through drm-intel-gt-next as well.

> I don't think my open has been resolved, at least I haven't seen a 
> reply from Daniel on the topic of potential for infinite waits with 
> untrusted clients after this change. +Daniel

Please resolve that internally and let me know the result. I'm fine to 
use any of the possible approaches, I just need to know which one.

Regards,
Christian.

>
> Regards,
>
> Tvrtko

