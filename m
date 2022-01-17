Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA22491094
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 20:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAD810FA09;
	Mon, 17 Jan 2022 19:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AD410FA04;
 Mon, 17 Jan 2022 19:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnAALVjDKYOgeE98bFaGCCCl4dC9jKxP1rTsvu6kFVxvszmOY9OHAnjFb0MCp3HOIWQrQPfLlbBNYNnE+owiFMUY0RIQB04BQyoMbFO+Wsrp9BLYznCGnUxEvcR26+DrhHktafl0g/26eBl9qxB4+ACoaX7Q+nRDQQMm1GxAi0UHSL6SIO8bA2YepzSizjGW+PlRTiv/h8TBrA6uJdUXHe8AiD0WOqjVmPMpdiiEGaZo7ARol1JQESGdMxgdXkn2YCtIm5XXnDvYrEHeceTr3MFvKeF8Q97+R8udJnM+W0TP2Yui8HnUjQ4qnX5iO1Qvhzrpd+xpSp03MKc3FUBiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8LWF4k//sw7qJENSvRxbm/LWybxmndnOJhyxX5EVSU=;
 b=bEmeET4ESVgqe4wl9powV4s/mMSIe3ifVE/MDVFiVhEnDM2CR2wTfi8QJODQ7NyB0CUOMyvIaUAkSBxwNUGLIRzE1sEvfalIgIzaxfnCm2Qz0lnuqfyqZ/m/TnZ+LaDDnfV8k6z9CMXfWlxaz8045Cws1TUNBAJXeQfCVOlht2w2Rn3JiK+E7eojRWIcTge6CPZ+/qLbEuAFXrO2GjY+wnMddfZ7oDx9m5ce2l+zeZwV7TjVrKMAcIxTDjfaUAP3bWa/DtymKr0O5SN8pWea3EcQb34Y7IsAG/6W6Ws8z91JAZRrZ8qnHwa78+Q2yq1xpPf8FDdc9pIewu5O+aW+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8LWF4k//sw7qJENSvRxbm/LWybxmndnOJhyxX5EVSU=;
 b=q/Vyp4Sdqv0s/kdjdX4n66fTA5fEdBcsz4LEcxiYGM3SU2+4fl3Bk+G+siJymwWDoGqhlksxGCz8n1T9K/LXsBLifCaaBKQoSyBuTIxb1RDUQLp9AY4LTxm1U62JY7T4t1z10X2Vdkry5d2uHqFT5G3HwIMT8LXu+q2uKIS/LXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by PH0PR12MB5436.namprd12.prod.outlook.com (2603:10b6:510:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 19:14:33 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 19:14:33 +0000
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
Message-ID: <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
Date: Mon, 17 Jan 2022 14:14:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
Content-Type: multipart/alternative;
 boundary="------------442FD2BA9C086CB055B1BE8A"
Content-Language: en-US
X-ClientProxiedBy: MN2PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:208:a8::39) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b694b56-5ea4-4e61-e978-08d9d9ed9828
X-MS-TrafficTypeDiagnostic: PH0PR12MB5436:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB54362D6820EFF41F9FA89E70EA579@PH0PR12MB5436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSaWBEKr6F+xBPIN4smRyubIPpRqrRLCy6Rqi2ypcLVCY863APSZeKcJFa5cZzDEfAhtBxbPY7ZAdf4LMYEAsH7GJ+OwW9W9SRZ4VL+aIR20pBdXRBxT956ecoV2DvMyCvpWC1OGM8bzDoOhjsALojHmh/UKqNZUk27NUAHWQSbb6yPKI2EfG94ZXNa48q1oNUEWFa7VjKJreDBye8bl3Yoc6NJHtg43Kom/DIQznFYUkoU6/BRrErXIG06FTLv7zLVOCMAhhnxHbwD4xktPjvu4CfBYEU4uHkKNOycxqCdehdxNLpJJ4MuGW7DmXPulQqmIJ/IxaSALpW5KyPKZCoZqpiHVsN/EQWG4Pmp7uH7j+vjf20P/aDqgXE3B+H7XS0bvaG7RdHbt5BFkEAznekmir0B33nwoLw5bQTMchsZJLFcWu/qjlsCyslHgi2JyN+EgoNg0OrFVGNpqPy5BlOMGPLo+t3asktUPd/FZUjw0eJoaor4OvF0hMHt4mIXETtvqcfqYw13XEPdVBcWEpwEn5xt1xJZYm517+rB7bXU7xcYeVPEYIueA4j/QbKr82/lgNmPjm4QGheDHZToEKK+U0C6J5X6ysA5qhuEoT1F6QWnAKQrsn7XRnqvEK+WH8cYNSYchvpatc07W5/RS1vwuyEuncNZ0or7xR+j0xvMYvx7fHUiRXm1HgBUN69FPuMDOTVXTJ4Ka1z2omYmVgSuUbGcAAbmJYaUGx/lmJyeufNj68nWVX/iNXmaNBDki
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(31686004)(186003)(33964004)(110136005)(2616005)(86362001)(53546011)(8676002)(8936002)(2906002)(36756003)(6506007)(316002)(6486002)(66556008)(66476007)(6512007)(44832011)(4326008)(31696002)(450100002)(508600001)(83380400001)(66946007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09SUUljUThOVUVNUXVKbHJRSTFibysxcEVXaVduOExYam9GZFR6RVd1S2g0?=
 =?utf-8?B?U0tOSDhCMGJYckpuYUxnSGt1RzdJd29SS2srell1QnZpQzA2NzFpMmp3NDd0?=
 =?utf-8?B?VUsvZFFZNmNxcy9NN1pUUHpSMEtZZkxTclhEaS8ydmU4QW1SL21kWllBOS83?=
 =?utf-8?B?MVhpRVlFM2JzMWNyeU5wZ1p2ZWErWXlCSWJrUGl3MDZ2Unpza3J6Q1RzdzEz?=
 =?utf-8?B?SUF5cmJVbGJhbFpjclNLMTZ5UVk0S3F3RkxJUnZ5aVpWNHd0NWFsaWlLZUl2?=
 =?utf-8?B?Sk9jNVFFVjRkNFdHb1YraGViaEtxZlhhbWVBTDN4NXRrY2V3SnZGMHhiZVI0?=
 =?utf-8?B?MlkrQXRiSStwLzE4UDhJS0l2VVl3ZnJEVDVwMWRPbDBYc29QRTdSZHoycUV1?=
 =?utf-8?B?QlVYb3djTkVjekxxb21rYjNJa0xMUzhuZmpIeXlFeC84ZUJ1NUJoWUEzTWxM?=
 =?utf-8?B?T01UUEZidGlZTGZ1WjB0blZFSm5qMFdwaXlqUjZiWnNGKzIvSXhjM3BkSWt0?=
 =?utf-8?B?MTArVkFCY0hvUFkzdStSdFpmK0RiejcrN3JpYWVyaXRqMmtoRm9FQjBmck5F?=
 =?utf-8?B?WDJ5RFM3dE1LTWU5bk9RTk8rYjRFNEU2MDFkUEdZWkZNTHZ4Z2M3NVFzNWVz?=
 =?utf-8?B?YThFVFgyOVZXQjdjM3A3bEJ6UHpYT0tZeTZ1WHc3emNiVkxRbFVMME85eW5z?=
 =?utf-8?B?ZjJVWXFtN3NQeUpCWVJwbk52NlZvYnRSSlBNUmN0MVZ3SXUvKzMyMWN2OU5s?=
 =?utf-8?B?U3k0RFlLN0RwLzdoYklaNWtsbURYTVduQlYxSTR1UjlCeUliTmhkL05mcUQ4?=
 =?utf-8?B?dHhDUS80UlhBNGN5ZHVwZjd0VG1mQXJvSFFkemNMZWNaejAwTFkyVnFsSlc1?=
 =?utf-8?B?WmJkdHo3eXN3ZDJYWEt6U2pDTTRoMWpLNDBESmlQOUx5azB5VFN2QTIrM1g1?=
 =?utf-8?B?YURmb29adm8rVGNVSllJWVUwVWdpK242YlA0K056V3haMklmWlplNlFsSEZ6?=
 =?utf-8?B?R2lENVl3YWMyQjk3TU9tYnpNckJPQk9YSElXb0dQTFRBM0x3ZHRLV1NFT1Bl?=
 =?utf-8?B?NWY3YkV3bjFpYWRIMHFCd241YW96Z3d5bTkwR1E4ZkdrWFl3dnVxbFVPbnFU?=
 =?utf-8?B?Yk56ZFhqU0FlYXFmS0Izb1lnZ0g4dmdRZHg1eGNrTG1mQWNyT0VBZEVUMURN?=
 =?utf-8?B?MWYxLzhnZUlGNTVOZUdkeWJKcU96TWNiL0NjTVp1cEF4QUlOalltRXpzNHE3?=
 =?utf-8?B?TWUxS20rbmR4TkRiVWJOdW1GaFpuWWpiUFhIWlp0blh5QWx0NVZjT1hDVldP?=
 =?utf-8?B?RDlLRHJIM3dybUFvSC9FMHIyZ1I2VW94NG1Bei9NMVhNTmlCKytJaGdSbmdO?=
 =?utf-8?B?eXJ0VUxTVVA2TVdEMy81UkZHbXgwRlVVN3I5bStVbHNmN005Z3dnSi84ZWNV?=
 =?utf-8?B?NTh2dEdKc3FxWVFRc1QzWUFFS2dOcW5uWXh4bjBZNG5OMXNMb05mZTR2aTVw?=
 =?utf-8?B?RjBlSTV5aGJiTTZPTHVOKzFsR0JIWlloYjRoZmh1OXRqZExtaGZWT3VXdnRv?=
 =?utf-8?B?bklBVVdmdm4vODYvVnM1YmNjQ1htREtvcHdUYVo3ZTJjbnJEOG5ub3ZkZnk2?=
 =?utf-8?B?c1Nlbm5mWGVZRTYxVWpTd1ltQ1JLenQ2S2grTTNoRnhZaXZJd1huKzVhMFpI?=
 =?utf-8?B?amY0cHVlUjFRMnFrdFBYT284OGlJcU5mTDVDZGhPdlg0eDBtcjRZQXIwMnJY?=
 =?utf-8?B?UUJsZmZjWCs0Y2l5VkVBMW9UeG56YitWRFgraVZiT0ZRVlJZSS9WbzRBbmZZ?=
 =?utf-8?B?ckZubk45L05OOGZaYkU0VkdpOUkxTUhxRlppWnFwZkFlRmhac2ZYY1FvTHgv?=
 =?utf-8?B?d2liVDhFMGp6YktFSFZMM2YvTkR6SFU1aFltY1RtMkpTcXkrMHVEUklUUjZU?=
 =?utf-8?B?dUFOdHc2WUxoU1F3cTk1STdMdU1CR21nQjA0bVRtQmg1eHRzVXN2am9YWTJu?=
 =?utf-8?B?RHYzd0lJTDJUT1U1eUZJVlF4aGtOWm1oNTJLdU1NTjBDUGppMFlmYjlWMDN6?=
 =?utf-8?B?R2puT1JycDErWVV6Q29UUVNTc09lZVJFaGZuVk5JUmZFNytaZzRZWTFrZ3c0?=
 =?utf-8?B?QVkwQU4vaXk1RVgxbGdEN0JWeUxjYTlTQXhaZmxCcnVtUkpueVMzTmF3MnZS?=
 =?utf-8?B?bW9xdE9yWFpLcHI5RTNDaFYyeEE3WEwvRFhNempySXNBSkh2a1hvNWNDTm1p?=
 =?utf-8?Q?XLvUonY6nRMo3SQFUTzdTc3UXPjcZYfRQev+fZV+KA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b694b56-5ea4-4e61-e978-08d9d9ed9828
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 19:14:33.5274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qZMMaUkIPu/VQ8DpsQq9N4QJ67cgfOKcm/oYrjGfFHt+ViQSdwxp1jwTztQyZCCKfkUDq+9GzRADuqIS8P8nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5436
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------442FD2BA9C086CB055B1BE8A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ping on the question

Andrey

On 2022-01-05 1:11 p.m., Andrey Grodzovsky wrote:
>>> Also, what about having the reset_active or in_reset flag in the 
>>> reset_domain itself?
>>
>> Of hand that sounds like a good idea.
>
>
> What then about the adev->reset_sem semaphore ? Should we also move 
> this to reset_domain ?  Both of the moves have functional
> implications only for XGMI case because there will be contention over 
> accessing those single instance variables from multiple devices
> while now each device has it's own copy.
>
> What benefit the centralization into reset_domain gives - is it for 
> example to prevent one device in a hive trying to access through MMIO 
> another one's
> VRAM (shared FB memory) while the other one goes through reset ?
>
> Andrey 

--------------442FD2BA9C086CB055B1BE8A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Ping on the question</p>
    <p>Andrey<br>
    </p>
    <div class="moz-cite-prefix">On 2022-01-05 1:11 p.m., Andrey
      Grodzovsky wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com">
      <blockquote type="cite" style="color: #007cff;">
        <blockquote type="cite" style="color: #007cff;">Also, what about
          having the reset_active or in_reset flag in the reset_domain
          itself?
          <br>
        </blockquote>
        <br>
        Of hand that sounds like a good idea.
        <br>
      </blockquote>
      <br>
      <br>
      What then about the adev-&gt;reset_sem semaphore ? Should we also
      move this to reset_domain ?&nbsp; Both of the moves have functional
      <br>
      implications only for XGMI case because there will be contention
      over accessing those single instance variables from multiple
      devices
      <br>
      while now each device has it's own copy.
      <br>
      <br>
      What benefit the centralization into reset_domain gives - is it
      for example to prevent one device in a hive trying to access
      through MMIO another one's
      <br>
      VRAM (shared FB memory) while the other one goes through reset ?
      <br>
      <br>
      Andrey
    </blockquote>
  </body>
</html>

--------------442FD2BA9C086CB055B1BE8A--
