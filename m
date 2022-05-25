Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B7533F06
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3AA10EA3B;
	Wed, 25 May 2022 14:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46B710EA3B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtNRy7ahox/oDJKHWbajiP+Z5lYa67PRPKwgCgsj7nqGx626xdUNF1uw1hbkXFmpQ7uGrw7R0TzytARvA9xoy/NHYo93MfoqCujE1cNpXdPptE9Jy00Xk2vmA/l+7JZ/DLGbo2CKKh4GRVQY9MXvWriNguyUENN6dhsNvuS8FMxleTCZw7Zn7nv2OZW07jUyUIiSQIZS2v2MeD8DXPpGSkSAfSB1cWDGiEMVnGoPG7zDSNACJvM6ndWnVxesTCskd3d3+s0Z3aNafwAmV+pMRgz/SGslSg5LrB4q1YgJEMJZHIPFuF1e6L1yF3bXy+QVOwiRxi3vCB+nh6xmfQkRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1vu+zufTZh4ueh64ZnBtdqn3rv92d4vGXPjRz++ulQ=;
 b=I1QudJy2Sa4W30Q00SPctRNpGRCNHKAC3sGOPL79iHwkFQc1HwdmqBDpIIztn3u9AwZ4Cf4BaE551gT/gqcZZgKudZOfbfxwRkaaHfM8a1ZF0eyYy8XlWb1VKP5m1yLzBVKkj+s8EJgIkOHP1skCJPkmgZqVTR0T1/Gg5ZSCXZGmM+HP1kVsAfsm74tWH19kUkwN4C4acUwaLxYxxx5Hjf7RVyOXdZBczhu6YLsKN97YqjWEyZFwDwCi6weMNKvxSCEfd7zA3iK5i8CTv11sF92Z0jmL3nEBHNCNZKiAH17zEo1MlPonHQENe1wa9p8qkT3Id8pl4ZaGVNjOHkxQTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1vu+zufTZh4ueh64ZnBtdqn3rv92d4vGXPjRz++ulQ=;
 b=Uar4ieIt07eTxv0ssOPYRTO8VGQxeK7Yv58ajPfTmJcTXVDVOecNgkcKahoPNikaopUDVL8z/N4UEA3BQcWIbvPgYVB7dSs2nzy0CxPr5f8GPp5rY3aMmfUYVOrpvy3hYGBITnAaesQlS0Ld7o022Wz76Xx+NRPboLBeGf7vGgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1584.namprd12.prod.outlook.com (2603:10b6:301:a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 14:22:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 14:22:54 +0000
Message-ID: <bae1a848-a089-6207-af07-8606c7bb6519@amd.com>
Date: Wed, 25 May 2022 16:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Tackling the indefinite/user DMA fence problem
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
 <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
 <Yo40X03axFXXN9/d@phenom.ffwll.local>
 <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
 <CAPj87rPW=YW8OnRyByJ_-6k3M9Oo7m7cTg88F8AF4TfudAjAJA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPj87rPW=YW8OnRyByJ_-6k3M9Oo7m7cTg88F8AF4TfudAjAJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0051.eurprd06.prod.outlook.com
 (2603:10a6:206::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cebb48a2-34b6-42b6-c35e-08da3e5a0ef2
X-MS-TrafficTypeDiagnostic: MWHPR12MB1584:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB158421D8EE85256EA0D423F383D69@MWHPR12MB1584.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8rBE3htCpMN/HfzsFIqDSJ6vNpcfuMCtEWlHiadZ9gUj1D9nX1Rbqhtk+WU2+/nOoKH61EzGKWUEv50uBDENr0ArxOVgeO8chrXmux18sYfQLjuvZoIOSo1XPssd0IRNvrRMgWs9pWCtGBTpMUvxvN89RIj3T5AvY+NCGL26T9nYmXUVcdH/3r8IjSw1M7KInvmydbZjRW1IoFqj3oZn7MU5zP+Tg6wtPzqcKrTvhWcLrGvL1TdmG9Q4VS/+pcDXxjA/GcNRVwaT0kcoT6NT4Bi9oOCZrMFZSWJftB/z0DBoSNIKwdjbTDdRa0Yjn9iZEHYYdW4hlsMSlALBmmgQxyDaswbDKpOnWLx9z0O6Mz2enMzdGu86B0w+qT/jg5aJeBAzvEc0Tq0j8mKT7z++lGroeRO1/lcZtOMAdfGm5gvoy4Ur5kentxwMeNvKyXuZihBPKfm4QSxD9gL0V2CEObjgWEzfWVAGrOES09imYx70wQUo+5f6Jx3stdd0aSbTgGoki/mYHyB3PlWJp9B3rZ5BIbaq74QRzlnR0fN5lQU9Ug+npBn8O2gHeEu/PBb+z5i+ruUoBWakLphpKWX9dQuiAB76Izall3se84l9sdxwEW7mskuRlqblnMtzFab+0IzBjYPN+qLVNvMAryvQbKJki1LS2xR9EC3LgASoXwsl7G0u4V8T1GeZ3TOJq8vmfcwfRRQ1R5ntZveONEku0iH9dLtjBKnwnJeRnURgLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(6666004)(110136005)(5660300002)(6512007)(316002)(54906003)(508600001)(8936002)(6486002)(6506007)(31686004)(4326008)(66946007)(66476007)(36756003)(66556008)(2906002)(26005)(8676002)(86362001)(31696002)(38100700002)(2616005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVIOVRobUtMWEs3RHBFOFZ4TkNKWEJyR3JuaWRRTEprai9adGxaZElPOHVG?=
 =?utf-8?B?dVB3YXR5Zm91aWFqYXp1Syt4alJtN1habDR3aTlJMlFvVytUTWlFdUYzKzhV?=
 =?utf-8?B?TkVoUmUxQ3ZOZ0x4cXBaeG9yaFNzbnJEVFBTeTZvYXBFb2R0b3hIZEhsZml1?=
 =?utf-8?B?ZXZyTGpHeDY0cE5JbndEaTZFUTgzNGxQT0t3SXF5WGRXaUtRbmtLZ3ZacE4z?=
 =?utf-8?B?MkZRRkF5Z3VvQnhCTGRVNXYvazVpMEowR3piUmdiMkNweUs1VnBBckh3SUZr?=
 =?utf-8?B?bTZJQWtCZWlIbHBPQ1NxcCtmUll4cEFyQWhZVHcrbmJ5RmFaVVZaZDEwMUpY?=
 =?utf-8?B?YjlPQXF5TGYzOE5DUnNxeDR5YUlMOWVTVEFRUlQzS0NaRWNpOTZETktkQnNS?=
 =?utf-8?B?aVpBRnlWUDNITzY3TUdRRm15dm9UNGJ5M2VDdCsxdVNRTjQwL0V5VlorOFk5?=
 =?utf-8?B?cVFQOWtwZWcxang4Ty9xT0JsZjRVYjJTVms4dVZReGp1WGlaTHdBMU1Mb0gr?=
 =?utf-8?B?OWdqL0FMRFFSNWZQaGZ0ZXBsWFo2WTZBMUJmRWwvQlZiWFdCYXpiMzEzVU9G?=
 =?utf-8?B?ekNqQ3VoUlplVWVYcmRmT3VHQUFmOWpxM09XVUZENGwzNFhjZk13bHNLZFVN?=
 =?utf-8?B?UGR3dTE4OWFQc1BYNUh5MzdwSElxM1o1cENqd2ZQc3BIR0ViS1pSeGFYeW5N?=
 =?utf-8?B?S3RDb0Q0czBpeUxqODdGeFI5cEFHRUFrYi8zSlJjcFFmZkk1clFKckJwSVlG?=
 =?utf-8?B?clRwa0JmTTg5cWhtYlNHcXl6dTRMaXdDN200NzE3WEV3dXlxcUdoZ21LdVYw?=
 =?utf-8?B?UnJORERjS2FWc242YmliSEd5UnIrWGNwaU92VDVFcjJEbitHdmVqanAwbWFt?=
 =?utf-8?B?SmQ1ZHJsMWRGeUlUdjNyZkVXVTVWOXA2RWw1R3ZIc3VzdVhRZUlaRWQrYlBD?=
 =?utf-8?B?YnFUQkNSZ0t3VVpucTBkV09DdkZIMGZ4YWQ2TUdndGFQdEtmakc5dGtSOWE4?=
 =?utf-8?B?V243RFlRRi9pbTdsUUtCLzdFMDE3L0pPSk4rQ1g0SlJZU0FlTUQ3T3hBdFpZ?=
 =?utf-8?B?K2ZuSllFVktERFVEVmZqUkVrcVpWZXJHTDZWMXRRVzQ4OE9uNSswMitVMmRO?=
 =?utf-8?B?UnFab3NzNUJDRlhNZlFTOEFKSEMrb2grK0VEWHdsekhucExEbVhISUl6RjJ6?=
 =?utf-8?B?K3VoU1RWWUQ4YXA4Y1RWUWMxanhSVE9ueG5KN1NtTHJVTWdKQTJ2SG5lRldE?=
 =?utf-8?B?cmJEaTVnMllKRWdWZ0s4R05XQjhVRXBib29rYVNuT1djZ3Y2VDdnS2l0Mk5O?=
 =?utf-8?B?blNxaDNnelRYWFRVSkVWcTV4by9ncUkxK0tZSFJ1SlliN2ZQRjU0cmF5ZHYz?=
 =?utf-8?B?WU5MSXZ4TTBCeTJPOVMxc005MmNmcmh4OHNtd0ZtMjJVR1NXbmN3aldqZnND?=
 =?utf-8?B?cTU0UG5JMnpvUjBKWDFJcEZlZnR6Mm5XenlydEZrQWUzY0xnOFFXaHpISlNS?=
 =?utf-8?B?MHVSUU5tMmY4L2VYWlBINVpTVVgwZENUQWZuYk1HZ2Uzdmhva2dxMGdDNmNh?=
 =?utf-8?B?L2xHcVpyanVXUGw2eHpJUmpFcWl4OWlBeTJUMzVRclo2Rm9Za29HaklsNlFF?=
 =?utf-8?B?SUxZbHlqM21oUXR0dXdUb0YwODlNNVRoUW96OWd3Rjc1dTBaakc5TUpiZlBJ?=
 =?utf-8?B?WlRXdTBkMXNGSUd4TDlrVGFDQ0JYV3hRSDRUQmY1UTVKT0U1cmNQQUxRUW4y?=
 =?utf-8?B?RitXNFNlVmhwamx3V3lNU0RwV3o4YXlFVHlnalA0aHVxVlhWQTdtaC9CeElH?=
 =?utf-8?B?YTdHbmNPS3RFZFBKVnVZeVZDbDlqUzRINDlRNE5jK3BlMFNYZkxrRHFzM2NQ?=
 =?utf-8?B?VElwemFDV01kbEhQcktXSDE3NUI5NXhSenRTdkhFc3ZUdm1RWTU1ZmVKdTRs?=
 =?utf-8?B?VHpQTlNGUzV0VVNBVytZTGNBeU1TcjNwRC9JLzg3MkpIVHQvRXdTS3h1aWJZ?=
 =?utf-8?B?a1ZnOXRLZXFsWGV0YitYTzdodldTd2RFS1RSMDFjaVV6V1JjMk5sVGtBWm0v?=
 =?utf-8?B?dUhKazN3NDJBbzAyNXRJYTJldUZGNkpuTVlUNFFhWjlPVmRBQmlKZEVOZXUw?=
 =?utf-8?B?NmZsNXF3MTMxWEdsOElkN21KRW9sdWlmTFdlRE9XdC9mT28vVXZTRm5relpH?=
 =?utf-8?B?Vi9kMWRmVEg1Y1lxWCtkUHlTUVpIcEYyTDhhc3FlamNJTythM1pLd0NLY1BP?=
 =?utf-8?B?Q2l6MnBzbng3bmcyRXRzdndnZzhHNW1CK1JVdEE0Qy9CamtoOGl4SGw4aDZj?=
 =?utf-8?B?WEJiT21scEZXdm1zTDhOVXRyTjJOcEZJeFNQMXVmazJMYjRteVJ1QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebb48a2-34b6-42b6-c35e-08da3e5a0ef2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 14:22:54.7928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V31udtI0nfKEHlzM68mgUVKEeL+AmJUiXSjm0dMGtZ7/61vaxPQgFZA0KKSyTeq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1584
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
Cc: tvrtko.ursulin@linux.intel.com, daniels@collabora.com, tzimmermann@suse.de,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 gustavo@padovan.org, Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sergemetral@google.com, maad.aldabagh@amd.com,
 alexander.deucher@amd.com, skhawaja@google.com, sumit.semwal@linaro.org,
 jason@jlekstrand.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.22 um 16:15 schrieb Daniel Stone:
> Hi,
>
> On Wed, 25 May 2022 at 15:07, Simon Ser <contact@emersion.fr> wrote:
>> On Wednesday, May 25th, 2022 at 15:51, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> You can add that to the list of reasons why compositors need to stop
>>>> using buffers with unsignaled fences. There's plenty of other reasons
>>>> there already (the big one being that otherwise slow clients can slow
>>>> down the compositor, even if the compositor uses a high priority context
>>>> and the HW supports preemption).
>>>
>>> Yeah that's tbh another reason why I think we shouldn't do umf as a
>>> transparent thing - compositors need to get better anyway, so we might as
>>> well take this as a chance to do this right.
>> As a compositor dev, I agree -- we should definitely be smarter about
>> this. Note, it would help a lot to have a good way to integrate the
>> waits into a poll(2) event loop.
> The same holds for Weston. We're currently working through a bunch of
> internal infrastructure to be able to handle this. Mutter (aka GNOME)
> is also really well-placed to be able to do this.
>
> Having pollable waits would be really useful, but I don't think it's
> essential. In my strawman I'm just waking up at the usual
> just-before-repaint point and checking; if it doesn't make it for this
> frame then we'll wait for the next frame. If someone submits buffers
> which take 4 repaint periods to clear then we'll have 3 'unnecessary'
> wakeups, but given the GPU is already slammed then it's not an
> efficiency problem I don't think. (I don't know if all the other
> compositor people share this view.)

Oh, well you should already have pollable waits, at least on DMA-buf.

If you are saying you want to have that for drm_syncobj timelines as 
well then that's certainly something we could do.

Regards,
Christian.

>
> Cheers,
> Daniel

