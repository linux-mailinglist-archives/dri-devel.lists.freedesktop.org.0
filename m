Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F14AB35C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 03:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17DD10EBBD;
	Mon,  7 Feb 2022 02:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4ED10E1EF;
 Mon,  7 Feb 2022 02:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enZFgQlhHlU/XULpMO7or8L6yWercERAKjvUys0rMxf3E7uF3vf+bB2gudKFldyWIx27briOiD9raC0u4mwJgMucC/oVB1E6I1qWany6XUcppk6aFc9ASWRR2Ytiv/muDIahqI47ZK7oFEHC7oWbjV7xAd2GB2vu1h6k65M9Pr7UBcQB8xKvJTunb7+5GoLDQTLxuudkqERB7fgIbMbYL3rGN9VwZR7jPuS7TUbQcYF8AyeTCjhxUoutqhqjG9Y8iGkQRhB5+iWhzwqaNyBWqlNxJfj9oVMNaOgQEZS9mRv0bsXzODZsCKpk0aDMyq1cJrj1dnGnjr5h2ApvHiYm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dws72lJh5PtnSRVA4urluuHMpTm8bfs52n6OqewPMh0=;
 b=BjIhF/XGc/rzoOFCGYSbqrs20s4yhdcvq5Mi4Q8sN2OkPMOkACIYL6jb3KGQHOvF8hcf01hx9l8r724BAYzOUTwzjJmjVvaed6NbjbyrnOgYM79jq+9aXSZt+S4oGSCWu2LtqW1ngilMmUl8QFuu4PnFRTJDnenpNLzzjp6Kg9wSDlo93dGM0zmwJLQj0JcVLBQKdCpBWUpQPzLIUMPWzV5RjWRLzQDS8mq9EBhNUOZLz9uku+0DoUcfA+NlWcIzTDdbxdSlMf2AjlHDtiQvmViOGQvmJoRmfUlAOh2zjEOCHbgLFvqOsTMRXJS3aiyEbbZDTOhamVJMO/mui0eDHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dws72lJh5PtnSRVA4urluuHMpTm8bfs52n6OqewPMh0=;
 b=KS/30Eu2I/sIJQ/XeG205PcWZi4QQQ2K+qWzEB+TLfLTsNaHQjAP2t02f5J3stK0+gHdxeCkBU6cK8J6MkYIJLxOX0PTshXhv7sg08/DxkqmUoT6gqQmKAJZflu7MQlhWJLo/5RTXb62Cnp86aEKtYOcuOTFUpf1xoR5CTNtZmo=
Received: from DM5PR16CA0047.namprd16.prod.outlook.com (2603:10b6:4:15::33) by
 BYAPR12MB3352.namprd12.prod.outlook.com (2603:10b6:a03:a8::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.11; Mon, 7 Feb 2022 02:41:20 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::7c) by DM5PR16CA0047.outlook.office365.com
 (2603:10b6:4:15::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18 via Frontend
 Transport; Mon, 7 Feb 2022 02:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 02:41:20 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 6 Feb
 2022 20:41:16 -0600
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 JingWen" <JingWen.Chen2@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
 <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
 <096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com>
 <769b97dd-c6f9-88fe-a26b-34bfd617e257@amd.com>
 <17b6f133-1b7b-7fcb-5fb2-17edcac50a72@amd.com>
 <DM5PR12MB19474AEFB824C4C97DCD7AABEA229@DM5PR12MB1947.namprd12.prod.outlook.com>
From: JingWen Chen <jingwech@amd.com>
Message-ID: <4119e53a-29c5-bb80-10c4-d1e66b91d83b@amd.com>
Date: Mon, 7 Feb 2022 10:41:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB19474AEFB824C4C97DCD7AABEA229@DM5PR12MB1947.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------FB78EBE1506D7E8EE87F0D30"
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e2be0a0-a562-4e52-7715-08d9e9e352bd
X-MS-TrafficTypeDiagnostic: BYAPR12MB3352:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3352B4A16C297832A327FB9EB72C9@BYAPR12MB3352.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ahONRInLscQEpx3R1x+rBNSGIDOo5lG/xs3oge04/vZw2RCwI1tt/ZwgdotRwCcl0M3duPWWZYxulSVnWCOIWpq/sVLFSRpFY+Nc73MPfzyCGmf8KYcx3KD5rSeD3u0Sd/x8me0bSAIaosC7EvKsvGClPLDIGjj06pbSihklnu1CjGNByBuC0fdqhEEhJwAwKkynJWv1OE4MnYB/K7FJTfJa773ieByzaH0upDKWkuGK+r6DsY4H8qmpkyXphrY6gv5AQV6VJPNG/b5cz9JIZzd0yzjJLcAkH4+Af7kAZvgddkHWwNgEipuYUEcbMpZMkcVxb+WuPsg3g1TVoW306nj27kbMLOnyFKAssgGbANyaQ/e8TfKsfl09Zu1xxa5gQi3gIigFKFALJKR9oed8YOhovodkjqk8JeuVPzAZQJOyGbB2+2sb1AvVOyRabEX7d87uk9EWVUeWkI/zPHv8HTXr55wu+qTKcbwMcw9qMXIQlF10dtAwPkyeIusowuI5B78qWY+0yskr6NfwFKar8eSyYq9DRhLg8rrHYW4igKGJw+QgRmsNylShjYDlH6xCqgLi3VX5qov+eP9FfXY4m7yC5V9w05esFciW6VCILWcR+/E6nbhZxui4YjyLNpsGuGJ8NGfyMytWfbJP3vS3f3YuHTegb1Tv7sz+4fB2boa5jC9i6UZS2WFTqWrYBaR9tPir5EukhRDvbHZKDVTg+8gsWUbRrZaR+HmaZHZ6M18UnI0VJaE85fCRfEqKwBMU
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(110136005)(6636002)(31686004)(36756003)(81166007)(33964004)(31696002)(53546011)(508600001)(36860700001)(54906003)(316002)(16576012)(2906002)(2616005)(26005)(16526019)(82310400004)(70206006)(70586007)(336012)(186003)(921005)(47076005)(426003)(4326008)(8676002)(83380400001)(8936002)(40460700003)(66574015)(5660300002)(356005)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 02:41:20.3538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2be0a0-a562-4e52-7715-08d9e9e352bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3352
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
Cc: "Chen, Horace" <Horace.Chen@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------FB78EBE1506D7E8EE87F0D30
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrey,

I don't have any XGMI machines here, maybe you can reach out shaoyun for =
help.

On 2022/1/29 =E4=B8=8A=E5=8D=8812:57, Grodzovsky, Andrey wrote:
> Just a gentle ping.
>
> Andrey
> -----------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------
> *From:* Grodzovsky, Andrey
> *Sent:* 26 January 2022 10:52
> *To:* Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>; Koenig, =
Christian <Christian.Koenig@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; d=
ri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-gfx=
@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Chen, JingWen <Ji=
ngWen.Chen2@amd.com>
> *Cc:* Chen, Horace <Horace.Chen@amd.com>; Liu, Monk <Monk.Liu@amd.com>
> *Subject:* Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery =
with TDRs
> =C2=A0
>
> JingWen - could you maybe give those patches a try on SRIOV XGMI system=
 ? If you see issues maybe you could let me connect and debug. My SRIOV X=
GMI system which Shayun kindly arranged for me is not loading the driver =
with my drm-misc-next branch even without my patches.
>
> Andrey
>
> On 2022-01-17 14:21, Andrey Grodzovsky wrote:
>>
>>
>> On 2022-01-17 2:17 p.m., Christian K=C3=B6nig wrote:
>>> Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:
>>>>
>>>> Ping on the question
>>>>
>>>
>>> Oh, my! That was already more than a week ago and is completely swapp=
ed out of my head again.
>>>
>>>> Andrey
>>>>
>>>> On 2022-01-05 1:11 p.m., Andrey Grodzovsky wrote:
>>>>>>> Also, what about having the reset_active or in_reset flag in the =
reset_domain itself?
>>>>>>
>>>>>> Of hand that sounds like a good idea.
>>>>>
>>>>>
>>>>> What then about the adev->reset_sem semaphore ? Should we also move=
 this to reset_domain ?=C2=A0 Both of the moves have functional
>>>>> implications only for XGMI case because there will be contention ov=
er accessing those single instance variables from multiple devices
>>>>> while now each device has it's own copy.
>>>
>>> Since this is a rw semaphore that should be unproblematic I think. It=
 could just be that the cache line of the lock then plays ping/pong betwe=
en the CPU cores.
>>>
>>>>>
>>>>> What benefit the centralization into reset_domain gives - is it for=
 example to prevent one device in a hive trying to access through MMIO an=
other one's
>>>>> VRAM (shared FB memory) while the other one goes through reset ?
>>>
>>> I think that this is the killer argument for a centralized lock, yes.=

>>
>>
>> np, i will add a patch with centralizing both flag into reset domain a=
nd resend.
>>
>> Andrey
>>
>>
>>>
>>> Christian.
>>>
>>>>>
>>>>> Andrey=20
>>>

--------------FB78EBE1506D7E8EE87F0D30
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html data-lt-installed="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body spellcheck="false" data-gramm="false">
    <p>Hi Andrey,</p>
    <p>I don't have any XGMI machines here, maybe you can reach out
      shaoyun for help.<br>
    </p>
    <div class="moz-cite-prefix">On 2022/1/29 上午12:57, Grodzovsky,
      Andrey wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM5PR12MB19474AEFB824C4C97DCD7AABEA229@DM5PR12MB1947.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div>Just a gentle ping.</div>
      <div><br>
      </div>
      <div>Andrey</div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
          face="Calibri, sans-serif" color="#000000"><b>From:</b>
          Grodzovsky, Andrey<br>
          <b>Sent:</b> 26 January 2022 10:52<br>
          <b>To:</b> Christian König
          <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>; Koenig, Christian
          <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Lazar, Lijo
          <a class="moz-txt-link-rfc2396E" href="mailto:Lijo.Lazar@amd.com">&lt;Lijo.Lazar@amd.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Chen, JingWen
          <a class="moz-txt-link-rfc2396E" href="mailto:JingWen.Chen2@amd.com">&lt;JingWen.Chen2@amd.com&gt;</a><br>
          <b>Cc:</b> Chen, Horace <a class="moz-txt-link-rfc2396E" href="mailto:Horace.Chen@amd.com">&lt;Horace.Chen@amd.com&gt;</a>; Liu, Monk
          <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com">&lt;Monk.Liu@amd.com&gt;</a><br>
          <b>Subject:</b> Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR
          gpu recovery with TDRs</font>
        <div> </div>
      </div>
      <div>
        <p>JingWen - could you maybe give those patches a try on SRIOV
          XGMI system ? If you see issues maybe you could let me connect
          and debug. My SRIOV XGMI system which Shayun kindly arranged
          for me is not loading the driver with my drm-misc-next branch
          even without my patches.<br>
        </p>
        <p>Andrey<br>
        </p>
        <div class="x_moz-cite-prefix">On 2022-01-17 14:21, Andrey
          Grodzovsky wrote:<br>
        </div>
        <blockquote type="cite">
          <p><br>
          </p>
          <div class="x_moz-cite-prefix">On 2022-01-17 2:17 p.m.,
            Christian König wrote:<br>
          </div>
          <blockquote type="cite">Am 17.01.22 um 20:14 schrieb Andrey
            Grodzovsky:<br>
            <blockquote type="cite">
              <p>Ping on the question</p>
            </blockquote>
            <br>
            Oh, my! That was already more than a week ago and is
            completely swapped out of my head again.<br>
            <br>
            <blockquote type="cite">
              <p>Andrey<br>
              </p>
              <div class="x_moz-cite-prefix">On 2022-01-05 1:11 p.m.,
                Andrey Grodzovsky wrote:<br>
              </div>
              <blockquote type="cite">
                <blockquote type="cite" style="color:#007cff">
                  <blockquote type="cite" style="color:#007cff">Also,
                    what about having the reset_active or in_reset flag
                    in the reset_domain itself?
                    <br>
                  </blockquote>
                  <br>
                  Of hand that sounds like a good idea. <br>
                </blockquote>
                <br>
                <br>
                What then about the adev-&gt;reset_sem semaphore ?
                Should we also move this to reset_domain ?  Both of the
                moves have functional
                <br>
                implications only for XGMI case because there will be
                contention over accessing those single instance
                variables from multiple devices
                <br>
                while now each device has it's own copy. <br>
              </blockquote>
            </blockquote>
            <br>
            Since this is a rw semaphore that should be unproblematic I
            think. It could just be that the cache line of the lock then
            plays ping/pong between the CPU cores.<br>
            <br>
            <blockquote type="cite">
              <blockquote type="cite"><br>
                What benefit the centralization into reset_domain gives
                - is it for example to prevent one device in a hive
                trying to access through MMIO another one's
                <br>
                VRAM (shared FB memory) while the other one goes through
                reset ? <br>
              </blockquote>
            </blockquote>
            <br>
            I think that this is the killer argument for a centralized
            lock, yes.<br>
          </blockquote>
          <p><br>
          </p>
          <p>np, i will add a patch with centralizing both flag into
            reset domain and resend.</p>
          <p>Andrey</p>
          <p><br>
          </p>
          <blockquote type="cite"><br>
            Christian.<br>
            <br>
            <blockquote type="cite">
              <blockquote type="cite"><br>
                Andrey </blockquote>
            </blockquote>
            <br>
          </blockquote>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------FB78EBE1506D7E8EE87F0D30--
