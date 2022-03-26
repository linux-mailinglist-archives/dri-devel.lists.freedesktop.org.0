Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AEB4E7E3F
	for <lists+dri-devel@lfdr.de>; Sat, 26 Mar 2022 01:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AFD10E423;
	Sat, 26 Mar 2022 00:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB1D10E308;
 Sat, 26 Mar 2022 00:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvMtjAXwY0IzdZo4sA2U4WfuZgkET7biIcghHDSjDyHfOxEnHLK92CrfSRGEyO7R/FQpBz2mQL/DzJsKan/i1t/tW0lvQ3x9/e+Fx02wcik3xFZ6w9qh7xwAELdpSnN82jX0wd/wx3jNgKHbj9WWqiEFRftfmd/x8dEzc3w+wtrpqSAfUxqXOIRMVd6vXBK+15vZ6DT4JPOxzSNuzPFD0bw0i2MaiF/As/gLdPYDQFmq0byd13ANG97tTe93DJGesKCfgUWrYmcEFLcDQD3hLrBxmKDUrxFNG5G3EdvyOY5LMEjrrwXZJ4O0EkMHW5Pk1Nd6coBe8lyBAK6lclEQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFhNvvv1+ENmQzNye6Lt+UMU+t2bnhDmkwHB9RMushU=;
 b=YHSfkxGQi1/glL26M0Iuja4J3BLsUvfNgbm0Y9+0sm/3VFndQBO2Hb45bgfmL8VovNxPWyc0Omer2mqpIOZAWYyoLQTmZ2UDnT+maYKafF7bs4QGub81ShysgvKkq9K/IScXpiuhiLQFjc3m7hTtJhgT9XHHXkNpZ4mD6hezrnLQGLuYhJzhp5QEx/zhNeKRzpnhqV9dolj2+a7MA6XsLO9yuxuecb9RtNZpBneLpBsYmIeKGy4fUnJ8G9PMcAVJd6vAPIHBg9CSC0a5NuOviZwEXf/nQQ41M4S/6PdwcZyHs1IwJkoiUOLzI+MP9QymrnZWpz3dfLF0zfOkrlPq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFhNvvv1+ENmQzNye6Lt+UMU+t2bnhDmkwHB9RMushU=;
 b=0t2kvJNw7fZWAqKo7rsiH4zgZNM5TCJOIxA0NlsXg3LOziFfAqE0k8bMNw1QjIMisyTgUIsJ5dCaFL7MlJPJEY9RtI6AwItBLQUAcEecj5+cng9/ZxAqQORK6i7jpZWC2djOMZgLOsPbdsJAYQk78nBBLEaDGLbvZrZOce9Kgxw=
Received: from DM6PR12MB4731.namprd12.prod.outlook.com (2603:10b6:5:35::11) by
 BL0PR12MB4993.namprd12.prod.outlook.com (2603:10b6:208:17e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.19; Sat, 26 Mar 2022 00:53:51 +0000
Received: from DM6PR12MB4731.namprd12.prod.outlook.com
 ([fe80::c185:20ee:fdc3:8db5]) by DM6PR12MB4731.namprd12.prod.outlook.com
 ([fe80::c185:20ee:fdc3:8db5%7]) with mapi id 15.20.5102.019; Sat, 26 Mar 2022
 00:53:51 +0000
From: "Olsak, Marek" <Marek.Olsak@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Thread-Topic: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Thread-Index: AQHYPsowqDD7+BeEoU6+/HU3KbViKqzQzV8H
Date: Sat, 26 Mar 2022 00:53:50 +0000
Message-ID: <DM6PR12MB473154C6C678EA97C03979A4F91B9@DM6PR12MB4731.namprd12.prod.outlook.com>
References: <20220311102709.225616cf@eldfell> <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
 <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
 <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
 <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
 <5e7d4b55-99ca-5fa4-2995-5e42d0a29473@amd.com>
In-Reply-To: <5e7d4b55-99ca-5fa4-2995-5e42d0a29473@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-26T00:53:50.455Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 1ccc040f-b2c8-7f7d-1e3f-8372b9e8e3e4
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1f42606-0648-492c-937c-08da0ec31807
x-ms-traffictypediagnostic: BL0PR12MB4993:EE_
x-microsoft-antispam-prvs: <BL0PR12MB49931225BFFFAF127563A035F91B9@BL0PR12MB4993.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWgy1EvpKk8N+yMoJJ1dK21wwjKExOKJ0/N4l82/2k/qK3RPRtRe8NoqF0f3S9ZtTBwrOFznoJjZXjjqbcodEJtqAKgo6etnNuIiab7bGqtTRqfn7tNhJrjpethfJtdKMGdcr0FpczNcgvsn5Ny9PWZU5aVBmec75PMhrhsw/kKitneSabGyq2xx/XEMzaLbBk8g0k/9OlvkXcRB1KGzC78OStMJ4n9McwDJdfyfft6Pd2mErip+cVMCI8mTvvQ+BoL7k7nU9iCgCiedUK67QmcrwxjlpBju96kPLPBfBhBYHWXBIIUCJdml6lIQgJXY/vFErsHdizfU17Y2bY6Z+TNv4XJ4Mm/2O5DUoix+BViR4BBfvgezv5Kacvi5M8HqtZjjahprLn0yGxLTKoYK3vrqiMVgIbDRLDJbVJaHMDb1lcGYnRQcnP09uf4KAg72S/t/8gYFatebjrGHwI4COlopIDXEVmEVXzQmu7YxHXTbkXa31mMarqMHH2i1yjxIzzVNmIEpIZMLNDGos6KGFK1+UTmcTyES0dcd6AU5Il1pqfL+VzACcmvB64/IExOxARqbxEtbjqk0yoxCDjgPk0X/RPpGwNDvN+qFOUtFlw1wzko9CughA/ERmqvbsLu8hw5g1X+K0ApBGwcBJRsnkh3Jsy9HkTkBcNM4xIfm60cOQIk5P1cejdDOjkKsRt4KKx0uEeeEhlKIY+m1W2zFqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4731.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(66574015)(9686003)(6636002)(66946007)(54906003)(76116006)(186003)(33656002)(19627405001)(508600001)(66556008)(91956017)(38070700005)(2906002)(71200400001)(26005)(64756008)(66446008)(66476007)(8676002)(55016003)(4326008)(122000001)(5660300002)(6506007)(7696005)(53546011)(83380400001)(52536014)(38100700002)(86362001)(8936002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Vh2uuxgv04In/Uor1IHE4qRhulapmprHx6WADWoNxIkFb8viyHAeyUsSSX?=
 =?iso-8859-1?Q?TSEGXQJGI1uW8TTfZ5j5Gl86EV33umcKRa9QmCFobjXOVZRcTtqacA4xjW?=
 =?iso-8859-1?Q?5IX7ek3ejY7QvC5EN3Vbmu9JgwqGveXuTHy9nHNcZDFm2e/pHowMjExPKa?=
 =?iso-8859-1?Q?e+7Y5mphRxXeT+wrHWdGjySnigtGHRQs1tVzucc2v1eN5gsa8U/ZLo3cc+?=
 =?iso-8859-1?Q?WWnlPI+xrqm2kI1D7KO0I1aHudTg/7rcnsABtTRMSHmPk4D2D9CcZVvnkv?=
 =?iso-8859-1?Q?urlvuffcT+GflabB/P9prsGRDEu+zWdBQ/q3rD5uakcxFXCvEGwtJ7FKGV?=
 =?iso-8859-1?Q?j9i3Vu85al7toX8f69nRBXvRH3V4lLwnBzGCNv8jaJJaTEVuv0nEGgXFco?=
 =?iso-8859-1?Q?PHvVIWbtTPbvI7Vd+57ic3oRi0T4bmSWRa34jMlMnbaVMGRsV7Rr0Z2WfM?=
 =?iso-8859-1?Q?vQhwBXtHIcV8Yw9zYTTZY9VkbFCoCj43Jtbo2cq7JezunM4lrpMlUrHCx1?=
 =?iso-8859-1?Q?g9u7X4IpHAbMV3Tek7tzKVTSdWcxxhKbNjHmivrQXmfNOYwEOXGGdfa8FX?=
 =?iso-8859-1?Q?DfHXbuyYOMfLfS1CtYlDYr0ArK6q19NbOK/qHRvr5q9vdLQfnn35T5in0I?=
 =?iso-8859-1?Q?Z8uo+XsX9Ys/jPEiu79AOUwtwwShAM4qDo/SW2NxxstuP9QXZgmO/e9YWB?=
 =?iso-8859-1?Q?7ABhshWYteI4N0M7EpQzLTCIef6e+HImSo/xzLI6+NUtCMl/kI4W6my1pG?=
 =?iso-8859-1?Q?cJH8ASSjzwKZ5jH0qTGW1Og5L1AWHY8eOO00nXOd7MiWAaGR7DYaIuMUmV?=
 =?iso-8859-1?Q?GT3OQlH2OCv/45SdUqDILUywavQtwiI0eINROzT0/XF6EIUkE26NESfugm?=
 =?iso-8859-1?Q?FRHQY+QuZqAPQASDlsFnupTXJl/JYyhoBiCxDyVXFjGw9CzreQB6c7XR9F?=
 =?iso-8859-1?Q?sa6qseJ0XQhxcKQnKKf0BTbQZIMiarRywe45eBteNXjCv1dtX/GTMaRl09?=
 =?iso-8859-1?Q?wXLu0nqRiGV+WqaRp4HBX+Hx2wD6WHO/SmCU56sznTw4f/q/Y6qMsvuSKa?=
 =?iso-8859-1?Q?bPx5egTxrGRlwQcGEmhyeso6d8eg5+1ro9uxBvwNHJmlR9n4D8l4H2Zdww?=
 =?iso-8859-1?Q?gKORGqL1sh8KfQtfa4bCfE6lqz9yzXrS4Z2E2a79h3ivgPIsRFQYfEZR/Q?=
 =?iso-8859-1?Q?fOFzdkjjYv57XHiPXxfRo4e12hcMKqxcwOYQ951YKmpaG0KYUVOeU6M0Yg?=
 =?iso-8859-1?Q?J2l3ZWLVlU1tBlQWtSt4d7SN2sQlleSfGgRGzh1iyltiTvfh+P2T090+2n?=
 =?iso-8859-1?Q?sewpOFa87uYVaAy1nPxzJwgvGRRS09e6ZGd9FUBl6Tk9gNhdnLUWv7MhjM?=
 =?iso-8859-1?Q?LQYR2rsek/tWOmNel30ptZc7Gkm+Y7q8WyYxV6W4d4KX5D5ZNkqh+XN3LK?=
 =?iso-8859-1?Q?UV5VljuAEuKksfDuZg41P9Z+nklXDJr2iJLWpevAmZ0j9vKUDdY52uuiEC?=
 =?iso-8859-1?Q?v4lXst1yOCjNJQuJuBc7RxGXgTdNZBgpUvMk1MOkGQNyT2S1yJs7sNGnTX?=
 =?iso-8859-1?Q?qJn90j153KhLs1iYKQ/hv7ZVFqYwdN+qahBUyVSO55w+Nvg0PEDSCD/onJ?=
 =?iso-8859-1?Q?+17OuBVBDiguW9CmRBpfU4QgRzjYPBFZVD6vGC0Y/+Wu9i36jZ5ShVb0qD?=
 =?iso-8859-1?Q?DcyHfdrxcbA7qGFwCZMEbTk7UAxWMEwaAKHhNu1xcHzlZkMs+QhoJIyM10?=
 =?iso-8859-1?Q?NytvzHXmU1qLW+6sp7+kR/LCKJCuzNO6GY6oA4HuAOpaV7?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR12MB473154C6C678EA97C03979A4F91B9DM6PR12MB4731namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4731.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f42606-0648-492c-937c-08da0ec31807
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2022 00:53:50.9345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93iBSvQl2CkP8CdHPgWHvQmsen1dktqHTVYtEyykw96tTVxOe/WRe8bBJg3sorE3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4993
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM6PR12MB473154C6C678EA97C03979A4F91B9DM6PR12MB4731namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

amdgpu has 2 resets: soft reset and hard reset.

The soft reset is able to recover from an infinite loop and even some GPU h=
angs due to bad shaders or bad states. The soft reset uses a signal that ki=
lls all currently-running shaders of a certain process (VM context), which =
unblocks the graphics pipeline, so draws and command buffers finish but are=
 not correctly. This can then cause a hard hang if the shader was supposed =
to signal work completion through a shader store instruction and a non-shad=
er consumer is waiting for it (skipping the store instruction by killing th=
e shader won't signal the work, and thus the consumer will be stuck, requir=
ing a hard reset).

The hard reset can recover from other hangs, which is great, but it may use=
 a PCI reset, which erases VRAM on dGPUs. APUs don't lose memory contents, =
but we should assume that any process that had running jobs on the GPU duri=
ng a GPU reset has its memory resources in an inconsistent state, and thus =
following command buffers can cause another GPU hang. The shader store exam=
ple above is enough to cause another hard hang due to incorrect content in =
memory resources, which can contain synchronization primitives that are use=
d internally by the hardware.

Asking the driver to replay a command buffer that caused a hang is a sure w=
ay to hang it again. Unrelated processes can be affected due to lost VRAM o=
r the misfortune of using the GPU while the GPU hang occurred. The window s=
ystem should recreate GPU resources and redraw everything without affecting=
 applications. If apps use GL, they should do the same. Processes that can'=
t recover by redrawing content can be terminated or left alone, but they sh=
ouldn't be allowed to submit work to the GPU anymore.

dEQP only exercises the soft reset. I think WebGL is only able to trigger a=
 soft reset at this point, but Vulkan can also trigger a hard reset.

Marek
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: March 23, 2022 11:25
To: Daniel Vetter <daniel@ffwll.ch>; Daniel Stone <daniel@fooishbar.org>; O=
lsak, Marek <Marek.Olsak@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@am=
d.com>
Cc: Rob Clark <robdclark@gmail.com>; Rob Clark <robdclark@chromium.org>; Sh=
arma, Shashank <Shashank.Sharma@amd.com>; Christian K=F6nig <ckoenig.leicht=
zumerken@gmail.com>; Somalapuram, Amaranath <Amaranath.Somalapuram@amd.com>=
; Abhinav Kumar <quic_abhinavk@quicinc.com>; dri-devel <dri-devel@lists.fre=
edesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Deucher, Alexa=
nder <Alexander.Deucher@amd.com>; Shashank Sharma <contactshashanksharma@gm=
ail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event

[Adding Marek and Andrey as well]

Am 23.03.22 um 16:14 schrieb Daniel Vetter:
> On Wed, 23 Mar 2022 at 15:07, Daniel Stone <daniel@fooishbar.org> wrote:
>> Hi,
>>
>> On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com> wrote:
>>> On Mon, Mar 21, 2022 at 2:30 AM Christian K=F6nig
>>> <christian.koenig@amd.com> wrote:
>>>> Well you can, it just means that their contexts are lost as well.
>>> Which is rather inconvenient when deqp-egl reset tests, for example,
>>> take down your compositor ;-)
>> Yeah. Or anything WebGL.
>>
>> System-wide collateral damage is definitely a non-starter. If that
>> means that the userspace driver has to do what iris does and ensure
>> everything's recreated and resubmitted, that works too, just as long
>> as the response to 'my adblocker didn't detect a crypto miner ad'  is
>> something better than 'shoot the entire user session'.
> Not sure where that idea came from, I thought at least I made it clear
> that legacy gl _has_ to recover. It's only vk and arb_robustness gl
> which should die without recovery attempt.
>
> The entire discussion here is who should be responsible for replay and
> at least if you can decide the uapi, then punting that entirely to
> userspace is a good approach.

Yes, completely agree. We have the approach of re-submitting things in
the kernel and that failed quite miserable.

In other words currently a GPU reset has something like a 99% chance to
get down your whole desktop.

Daniel can you briefly explain what exactly iris does when a lost
context is detected without gl robustness?

It sounds like you guys got that working quite well.

Thanks,
Christian.

>
> Ofc it'd be nice if the collateral damage is limited, i.e. requests
> not currently on the gpu, or on different engines and all that
> shouldn't be nuked, if possible.
>
> Also ofc since msm uapi is that the kernel tries to recover there's
> not much we can do there, contexts cannot be shot. But still trying to
> replay them as much as possible feels a bit like overkill.
> -Daniel
>
>> Cheers,
>> Daniel
>
>


--_000_DM6PR12MB473154C6C678EA97C03979A4F91B9DM6PR12MB4731namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
amdgpu has 2 resets: soft reset and hard reset.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The soft reset is able to recover from an infinite loop and even some GPU h=
angs due to bad shaders or bad states. The soft reset uses a signal that ki=
lls all currently-running shaders of a certain process (VM context), which =
unblocks the graphics pipeline,
 so draws and command buffers finish but are not correctly. This can then c=
ause a hard hang if the shader was supposed to signal work completion throu=
gh a shader store instruction and a non-shader consumer is waiting for it (=
skipping the store instruction by
 killing the shader won't signal the work, and thus the consumer will be st=
uck, requiring a hard reset).<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size:12pt">The hard reset can recover from other hangs,=
 which is great, but it may use a PCI reset, which erases VRAM on dGPUs. AP=
Us don't lose memory contents, but we should assume that any process that h=
ad running jobs on the GPU during
 a GPU reset has its memory resources in an inconsistent state, and thus fo=
llowing command buffers can cause another GPU hang. The shader store exampl=
e above is enough to cause another hard hang due to incorrect content in me=
mory resources, which can contain
 synchronization primitives that are used internally by the hardware.</span=
><br>
<span style=3D"font-size:12pt"></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size:12pt">Asking the driver to replay a command buffer=
 that caused a hang is a sure way to hang it again. Unrelated processes can=
 be affected due to lost VRAM or the misfortune of using the GPU while the =
GPU hang occurred. The window system
 should recreate GPU resources and redraw everything without affecting appl=
ications. If apps use GL, they should do the same. Processes that can't rec=
over by redrawing content can be terminated or left alone, but they shouldn=
't be allowed to submit work to
 the GPU anymore.</span><br>
<span style=3D"font-size:12pt"></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
dEQP only exercises the soft reset. I think WebGL is only able to trigger a=
 soft reset at this point, but Vulkan can also trigger a hard reset.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Marek<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> March 23, 2022 11:25<br>
<b>To:</b> Daniel Vetter &lt;daniel@ffwll.ch&gt;; Daniel Stone &lt;daniel@f=
ooishbar.org&gt;; Olsak, Marek &lt;Marek.Olsak@amd.com&gt;; Grodzovsky, And=
rey &lt;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Cc:</b> Rob Clark &lt;robdclark@gmail.com&gt;; Rob Clark &lt;robdclark@c=
hromium.org&gt;; Sharma, Shashank &lt;Shashank.Sharma@amd.com&gt;; Christia=
n K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;; Somalapuram, Amaranath =
&lt;Amaranath.Somalapuram@amd.com&gt;; Abhinav Kumar &lt;quic_abhinavk@quic=
inc.com&gt;;
 dri-devel &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx list &lt;amd-gf=
x@lists.freedesktop.org&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.c=
om&gt;; Shashank Sharma &lt;contactshashanksharma@gmail.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Adding Marek and Andrey as well]<br>
<br>
Am 23.03.22 um 16:14 schrieb Daniel Vetter:<br>
&gt; On Wed, 23 Mar 2022 at 15:07, Daniel Stone &lt;daniel@fooishbar.org&gt=
; wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 21 Mar 2022 at 16:02, Rob Clark &lt;robdclark@gmail.com&gt=
; wrote:<br>
&gt;&gt;&gt; On Mon, Mar 21, 2022 at 2:30 AM Christian K=F6nig<br>
&gt;&gt;&gt; &lt;christian.koenig@amd.com&gt; wrote:<br>
&gt;&gt;&gt;&gt; Well you can, it just means that their contexts are lost a=
s well.<br>
&gt;&gt;&gt; Which is rather inconvenient when deqp-egl reset tests, for ex=
ample,<br>
&gt;&gt;&gt; take down your compositor ;-)<br>
&gt;&gt; Yeah. Or anything WebGL.<br>
&gt;&gt;<br>
&gt;&gt; System-wide collateral damage is definitely a non-starter. If that=
<br>
&gt;&gt; means that the userspace driver has to do what iris does and ensur=
e<br>
&gt;&gt; everything's recreated and resubmitted, that works too, just as lo=
ng<br>
&gt;&gt; as the response to 'my adblocker didn't detect a crypto miner ad'&=
nbsp; is<br>
&gt;&gt; something better than 'shoot the entire user session'.<br>
&gt; Not sure where that idea came from, I thought at least I made it clear=
<br>
&gt; that legacy gl _has_ to recover. It's only vk and arb_robustness gl<br=
>
&gt; which should die without recovery attempt.<br>
&gt;<br>
&gt; The entire discussion here is who should be responsible for replay and=
<br>
&gt; at least if you can decide the uapi, then punting that entirely to<br>
&gt; userspace is a good approach.<br>
<br>
Yes, completely agree. We have the approach of re-submitting things in <br>
the kernel and that failed quite miserable.<br>
<br>
In other words currently a GPU reset has something like a 99% chance to <br=
>
get down your whole desktop.<br>
<br>
Daniel can you briefly explain what exactly iris does when a lost <br>
context is detected without gl robustness?<br>
<br>
It sounds like you guys got that working quite well.<br>
<br>
Thanks,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Ofc it'd be nice if the collateral damage is limited, i.e. requests<br=
>
&gt; not currently on the gpu, or on different engines and all that<br>
&gt; shouldn't be nuked, if possible.<br>
&gt;<br>
&gt; Also ofc since msm uapi is that the kernel tries to recover there's<br=
>
&gt; not much we can do there, contexts cannot be shot. But still trying to=
<br>
&gt; replay them as much as possible feels a bit like overkill.<br>
&gt; -Daniel<br>
&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt; Daniel<br>
&gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR12MB473154C6C678EA97C03979A4F91B9DM6PR12MB4731namp_--
