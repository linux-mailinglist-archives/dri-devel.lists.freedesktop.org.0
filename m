Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FD0136270
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 22:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DF76E96E;
	Thu,  9 Jan 2020 21:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4E6E96E;
 Thu,  9 Jan 2020 21:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk3CeaVWVpdEobKh7ETwmjVZkeFQHmPhkJjM+Efr7H+Jm1+dBwviMNMQ/ZYSkObXJHB9fA+vd4qzS4NAljLLO4lui3k3VEItoIgJX+OKVlYWL+hHPajANWn5OxYAfW7NcIXs6hR2BmJQpcKBvyqCt6BKJyjHqNi8mdInPaBz4Fc/dOjkJEOpcJsmeRZ12EE8bkwE2LiICYpsujPeSPkZrcgevsloz6UeR0MvDbIqwhFYrVZ+M/1Q0tKY9JuLn49DFn/L/UArvT4884D7Na0CExXJXDCyBuY/UWVS+f9j3D6/1yAgFgkT/oz/G/UdQ9WsEdJB6oerTpvQCEYqgMabGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvNhci6tWBZltRIsxH9vrCmkKIy8HBbQWDvX68bKbz4=;
 b=Cic3vsYuX6jV84udmSq8oKihBizAGvdDLeCg7d46mUpIrlc9T+9NUE5pcYRq0OvgX81SZsWFzo3l/JkVjn0hfMt0lv//T4OGVlBB3j8v4rHYoem2gTqIYIzzGj6llfsl97pJbH4EAl2aqeQmmxZ4zwp8EGy+Y5lntg5hBnZ0gtmiwqR7bfxwE02LRP/OZIIiofuLfkhOfrf566jJqKAlUVW47YyGTy/VklQwzjLvP1WORPvRGFW65bEkPm5q5xlC0pP2jteihBNJnRhYUdzevSNHkoxHeZObMO4/KUjQlbykPJ9He73V4EtxqqERyM9VwPTgp+/mfchgzQ3vatJ+5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvNhci6tWBZltRIsxH9vrCmkKIy8HBbQWDvX68bKbz4=;
 b=etfhccQAi1rmIgAArcdL7BtVnxOx2i6Sn/m93EfT1ZAUQRYBWwRYvYVBl4uteolZow9gr2UKNwxNGVmWSfAkrc2Agd3p6gpZV+uXAhEqhr23LfP5cTzUqvysw1ih8KF+dZhSxj851RnlQr9RFbIu9RAg1WvFsuEccwQPPu1/etU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2535.namprd12.prod.outlook.com (10.172.121.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Thu, 9 Jan 2020 21:26:21 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2602.016; Thu, 9 Jan 2020
 21:26:21 +0000
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>, Harry Wentland <Harry.Wentland@amd.com>
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
 <CAEsyxyjTvuCHHA3D-NJd=aGkHz2d=obSizwGQL8B4k1B7i2jJg@mail.gmail.com>
 <CADnq5_NPdg8MjQ5cB2aCD+US1Hv+FoP1gqKcA4W2e0pouG8cGQ@mail.gmail.com>
 <CAEsyxyjMsCU8rzyO0GewU_-uV5+UoDDwa5Mc74irUnJHhF6ALQ@mail.gmail.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <bae132f3-73e6-5004-c9a9-adb632338268@amd.com>
Date: Thu, 9 Jan 2020 16:26:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <CAEsyxyjMsCU8rzyO0GewU_-uV5+UoDDwa5Mc74irUnJHhF6ALQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 21:26:21 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 97905d00-3fa7-4884-7d7d-08d7954a9286
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2535:|CY4PR1201MB2535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB253539EF3203DB739A8413AE8C390@CY4PR1201MB2535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02778BF158
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(81156014)(81166006)(6636002)(316002)(2906002)(8936002)(6486002)(4326008)(478600001)(16576012)(8676002)(36756003)(16526019)(52116002)(2616005)(33964004)(31686004)(956004)(66946007)(66476007)(53546011)(66556008)(31696002)(5660300002)(186003)(110136005)(26005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2535;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Dm+6e/AkjVG9O3SMJ4MJ7vRsbJ+fvI3rHYl3HnUUtSu1Vua6VeYqj8C0YJQvyNasDsCiRdplhZ3uILjgpv7Edcl6sI8FB0lujyvQSBEqC/JIDOoeYym2KDQiPUSDcs6G2rn9fr0darHoKwFFHSkRJHLRAwDw6bMLO8W22g36iQCYu9FQSG8xrMHcMOXFRLyaMK5Q6tVdQSN/9SVyFvg8+B9eVqV+ff07459h7H3Au28RHUomjG0oWDeoBGtNWEJ8DqP9ffRPWxWkblfT8QZMkcRj5IQhdOHcAaNBfQ39PVLa+FxXpc4AQHCgpBGh7NzGTqESueXmQTHp0H0IDasMRs6bXl/ti2Tbeuf8Xv9THOrmXD6oWjSqROz2psBpsRHl2PpNetDbQ11MU7NAme3yfiRDc42pYDSyPCZQ3mpkd7YvuqfNV377MI2sVX0AMwY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97905d00-3fa7-4884-7d7d-08d7954a9286
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 21:26:21.6179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoyPFMmYbZ93WhBuyQuQfCRJB+j02q2Btlvi3CYyfNpViKpIOXdBn8KXHD4+TK1cAFV/FnZhGh6WvpWjvRrrxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2535
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
Cc: mario.kleiner.de@gmail.de,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============1818409056=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1818409056==
Content-Type: multipart/alternative;
 boundary="------------233C9ABD89B05595E9630594"
Content-Language: en-US

--------------233C9ABD89B05595E9630594
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 2020-01-09 4:04 p.m., Mario Kleiner wrote:
> On Thu, Jan 9, 2020 at 8:49 PM Alex Deucher <alexdeucher@gmail.com
> <mailto:alexdeucher@gmail.com>> wrote:
>
>     On Thu, Jan 9, 2020 at 11:47 AM Mario Kleiner
>     <mario.kleiner.de@gmail.com <mailto:mario.kleiner.de@gmail.com>>
>     wrote:
>     >
>     > On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher
>     <alexdeucher@gmail.com <mailto:alexdeucher@gmail.com>> wrote:
>     >>
>     >> On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner
>     >> <mario.kleiner.de@gmail.com
>     <mailto:mario.kleiner.de@gmail.com>> wrote:
>     >> >
>     As Harry mentioned in the other thread, won't this only work if the=

>     display was brought up by the vbios?=C2=A0 In the suspend/resume ca=
se,
>     won't we just fall back to 2.7Gbps?
>
>     Alex
>
>
> Adding Harry to cc...
>
> The code is only executed for eDP. On the Intel side, it seems that
> intel_edp_init_dpcd() gets only called during driver load /
> modesetting init, so not on resume.
>
> On the AMD DC side, dc_link_detect_helper() has this early no-op
> return at the beginning:
>
> if ((link->connector_signal =3D=3D SIGNAL_TYPE_LVDS ||
> 			link->connector_signal =3D=3D SIGNAL_TYPE_EDP) &&
> 			link->local_sink)
> 		return true;
>
> So i guess if link->local_sink doesn't get NULL'ed during a
> suspend/resume cycle, then we never reach the setup code that would
> overwrite with non vbios settings?
>
> Sounds reasonable to me, given that eDP panels are usually fixed
> internal panels, nothing that gets hot(un-)plugged?
>
> I can't test, because suspend/resume with the Polaris gpu on the MBP
> 2017 is totally broken atm., just as vgaswitcheroo can't do its job.
> Looks like powering down the gpu works, but powering up doesn't. And
> also modesetting at vgaswitcheroo switch time is no-go, because the
> DDC/AUX lines apparently can't be switched on that Apple gmux, and
> handover of that data seems to be not implemented in current
> vgaswitcheroo. At the moment switching between AMD only or Intel+AMD
> Prime setup is quite a pita...
>

I haven't followed the entire discussion on the i915 thread but for the
amdgpu dc patch I would prefer a DPCD quirk to override the reported
link settings with the correct link rate.

Harry

> -mario
>
>


--------------233C9ABD89B05595E9630594
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2020-01-09 4:04 p.m., Mario Kleiner
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAEsyxyjMsCU8rzyO0GewU_-uV5&#43;UoDDwa5Mc74irUnJHhF6ALQ@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">On Thu, Jan 9, 2020 at 8:49 PM Alex Deucher &lt;<a href="mailto:alexdeucher@gmail.com" moz-do-not-send="true">alexdeucher@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Thu, Jan 9, 2020 at
            11:47 AM Mario Kleiner<br>
            &lt;<a href="mailto:mario.kleiner.de@gmail.com" target="_blank" moz-do-not-send="true">mario.kleiner.de@gmail.com</a>&gt;
            wrote:<br>
            &gt;<br>
            &gt; On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher &lt;<a href="mailto:alexdeucher@gmail.com" target="_blank" moz-do-not-send="true">alexdeucher@gmail.com</a>&gt;
            wrote:<br>
            &gt;&gt;<br>
            &gt;&gt; On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner<br>
            &gt;&gt; &lt;<a href="mailto:mario.kleiner.de@gmail.com" target="_blank" moz-do-not-send="true">mario.kleiner.de@gmail.com</a>&gt;
            wrote:<br>
            &gt;&gt; &gt;<br>
            As Harry mentioned in the other thread, won't this only work
            if the<br>
            display was brought up by the vbios?&nbsp; In the suspend/resume
            case,<br>
            won't we just fall back to 2.7Gbps?<br>
            <br>
            Alex<br>
            <br>
          </blockquote>
        </div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">Adding Harry to cc...<br>
        </div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">The code is only executed for eDP. On
          the Intel side, it seems that intel_edp_init_dpcd() gets only
          called during driver load / modesetting init, so not on
          resume.</div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">On the AMD DC side,
          dc_link_detect_helper() has this early no-op return at the
          beginning:</div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">
          <pre>if ((link-&gt;connector_signal == SIGNAL_TYPE_LVDS ||
			link-&gt;connector_signal == SIGNAL_TYPE_EDP) &amp;&amp;
			link-&gt;local_sink)
		return true;</pre>
        </div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">So i guess if link-&gt;local_sink
          doesn't get NULL'ed during a suspend/resume cycle, then we
          never reach the setup code that would overwrite with non vbios
          settings?</div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">Sounds reasonable to me, given that eDP
          panels are usually fixed internal panels, nothing that gets
          hot(un-)plugged?</div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">I can't test, because suspend/resume
          with the Polaris gpu on the MBP 2017 is totally broken atm.,
          just as vgaswitcheroo can't do its job. Looks like powering
          down the gpu works, but powering up doesn't. And also
          modesetting at vgaswitcheroo switch time is no-go, because the
          DDC/AUX lines apparently can't be switched on that Apple gmux,
          and handover of that data seems to be not implemented in
          current vgaswitcheroo. At the moment switching between AMD
          only or Intel&#43;AMD Prime setup is quite a pita...<br>
        </div>
        <div class="gmail_quote"><br>
        </div>
      </div>
    </blockquote>
    <br>
    I haven't followed the entire discussion on the i915 thread but for
    the amdgpu dc patch I would prefer a DPCD quirk to override the
    reported link settings with the correct link rate.<br>
    <br>
    Harry<br>
    <br>
    <blockquote type="cite" cite="mid:CAEsyxyjMsCU8rzyO0GewU_-uV5&#43;UoDDwa5Mc74irUnJHhF6ALQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">-mario<br>
        </div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote"><br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------233C9ABD89B05595E9630594--

--===============1818409056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1818409056==--
