Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8499CCD951
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0137F10EB60;
	Thu, 18 Dec 2025 20:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gq7AwIS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A337F10E5A8;
 Thu, 18 Dec 2025 20:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFFeZsByLa1x1IeMRw7r9GiVQErJ5GpI5EYIc40CZXVi4yqn1Ydt8JyH+XYsSo489a5lDYkKMLXpeFSZ+adTZmK4h27EJM+49GVo1/+WR6oe4q+x8vu96ZJLAcGUb0u/+m2Uce/drzYEoixWt0onJePXHCkDvO+sfRAwNpbnEb47vkzrbR0IDIQdbWQWqyjqnkvUYcv+pTJE14vU8x55aKVMw9rFFRtO2mZANMGk25n3XkTAtMxOpDBtdqGTUelQAhFs8LHw5PeqhkEoJ3dmbKnt+L8cuAk6vTRmt36B0KUvjqYDhwsIEnIl6UqaTur9zh5nf+k7NGZwaF6QotEaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8msRAfbeSwbeG8wMD41E5TnAsqCK3eJAiCVeTCXhlw=;
 b=mtj3Amfas4qHSPGfHCJp+a3+EdOyUvqWfang6Ox0l2aNOZ7RaYo5TAl6yUXoevBPBvPzJeyThWjeekjx4WzMVW57vKqD7tyh6iOa/nGY/V+F6hM83Adllt3tS7R23beaBEuUxp07ujMW0unoNpK7IhGkXBGPtob8p67uwOjVOv7KBjr2RMxEnZzniuFucKN2hxmHyE/mURxzLPsYM3rgvMCQxk8VSrBgoFNPzm2JGdSaWNhjN+jLBK10tWuY2LzfexPfg2wiN2HlIuZ2koxMRQB78fhooLa9Yb9OKuresaZ8e7mwdwgJAmZHwOnN0er0ewWshJKY6w9l41OsPIY9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8msRAfbeSwbeG8wMD41E5TnAsqCK3eJAiCVeTCXhlw=;
 b=Gq7AwIS1C3u/FRPzAs/ZZ9CNi3cuHHnq6uyITqc6tSYin1trqOciZ/dUhauTgVd8rj37mYVI+kXs+fhoTaUfaOGfEAJGFVvOkO8c7XshQgS8cHhy+2E1UIA4T6Wgf+TXqV+HgIT4cN7xG6SiCZ0caKHsbqCWRIh0ZQHxaBFq1rVexGPA0taJNfDHKj3v9yEN5p2o5ifv2/0F5i1mh22Bqp86xetgk4l1c3cIHB0N3IVwmgNUl8m9wAOmzXIlHEbZ7tatUAcEbhll3O6nXMUCfMa+ssKGaxCBm9D9LOZIomDEjJHMseClkjjsmOi5dQDm6ZIktUK/3l5/z7qSQKldtQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ0PR12MB6854.namprd12.prod.outlook.com (2603:10b6:a03:47c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 20:53:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:53:00 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?iso-8859-2?Q?Bj=F6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Alistair
 Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Topic: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
Thread-Index: AQHcbkrHLZgrNHAX9U+MOO9nREKCZ7UkZ8A6gAL/6ICAAHxZSA==
Date: Thu, 18 Dec 2025 20:52:59 +0000
Message-ID: <47F9A9AB-42B5-4A5C-90CA-8A00DD253DA7@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
In-Reply-To: <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SJ0PR12MB6854:EE_
x-ms-office365-filtering-correlation-id: b9404543-e028-4338-a89c-08de3e776dfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?8RbyI0R6zoxHM7C9ehzv/RdqQhFkDP3i6t4WGFhTzgYIsthJJPKBn02DSL?=
 =?iso-8859-2?Q?0k4l3h3P8hievE2fR299YnRNKEwqOfw45vZ8120UOiNJ0uUbg8b5ZSTu+6?=
 =?iso-8859-2?Q?1g5KOuD/LRnRv7UyZ2pzjP9YxhqKF+PRtvnTVJ0a06wMyZeAEICUcjaEpd?=
 =?iso-8859-2?Q?/kqL622ikWDWmPdDP4NmI1YaiDf6MDz9X9mk8JAbhEWvWpmbqXlQqQNcQX?=
 =?iso-8859-2?Q?svB2xJglo5xGUMFLwMcCDK4ak9G0dbcsdjrWc4SlrExF3tPnDOk1HQ8ioN?=
 =?iso-8859-2?Q?oYvjcyH9s5Gl3niK6lLEj9dAzehL0YD33N+zK4tWXRASft+R06fLxh0D7l?=
 =?iso-8859-2?Q?/3mFX2GqW93vR6eiPawoWg49dJHv8yeNO99gUR8l8tASFhgxQq7LsPbeeR?=
 =?iso-8859-2?Q?Q63M33VrlU6+LhqY4azjx1aVn5sy0rFCeJm8cvi11amcrt5cY+2UDQ5w/f?=
 =?iso-8859-2?Q?AfGF/j6Ym0ror8VI3MxMWvK42Dw+FUf9+0hG/GLyjL4XEEKdm+gJHQbdRX?=
 =?iso-8859-2?Q?cTpkN7Sl5I80TJKATJFHpu/otQk5L9tUf7a4AZHzi5DZI4bzvVNivYs4Zt?=
 =?iso-8859-2?Q?vZxON59sfn723Ol8ZjZfUwJQ028FP6T3mShMRW1gQwDoyI8yd7ZpbcI9dj?=
 =?iso-8859-2?Q?/1sYsOwcBxixq6VU6vxUlfVKPyzqcRQvItiWkmlZ5ggAfJq/ezeSS3Aq7C?=
 =?iso-8859-2?Q?cMJjhPDdESXrg0q7J/l6FL9zB3lomQJZDRmmpCsr2OCpB5VpODUMLraGsR?=
 =?iso-8859-2?Q?9teCG/SfpKl3mVdHQzMYlPUk8ZXnMIMRNLe1K4v6NDNJn5x50PyvNJEW6x?=
 =?iso-8859-2?Q?ttWqqo6EJMISYufH/px1Wk4Ax4BNyouUt8Otv03pIpGhVPZ2j4bgmEIGZw?=
 =?iso-8859-2?Q?AFtsKhtSg4s2mTF0fYrCP1bENXWhUie5vyp4LQPS0zP+8TREJGSauFeYnt?=
 =?iso-8859-2?Q?AoKm3rRV4S336cNjvab4YlU19HGz3gCM2E6BWIHaliXt750RjvFe4+g3Ny?=
 =?iso-8859-2?Q?SXmeF3sJgcs9WlwROJrSZ6ppvAXQRQ3jCjeyrbKIBu4PDLo9NosgWv2hXh?=
 =?iso-8859-2?Q?kCrCpNDLaPLsSpluj56S0PILULzlOVJAOqNr3n97DoQaof9DYGayK++/hO?=
 =?iso-8859-2?Q?tzmDe6xXgnbojCo3QIEegqOjIF6kvnPrgawSNWAKa7GzTlFNpRvdm3NP2b?=
 =?iso-8859-2?Q?WN2sBesj3qo+pc8rSnZHbJpIRoROh9HM+CQmtgaGntqRshQIg7+fxc4Q8k?=
 =?iso-8859-2?Q?E4Gn/xwxxAMVzz3JOO6NmoB9Y+nm1TKpJ8yfqNd+wymE1Kzc8vdkwkN2OW?=
 =?iso-8859-2?Q?g659WCdGAiC+meNOkf/1GRaj6ON/mZlf5TJLRnZFqCKCW3eYI0sMLkHBYD?=
 =?iso-8859-2?Q?+YYrcTO+4ZrwHz+Qu6wactRUobY4tDiZfhcK2vEiI2C/Q8UtBHl5zMnpnj?=
 =?iso-8859-2?Q?aR/CWLvgbACwgUY6vgMQ5jA01FcDIlv3x56JyR+UfPYmFIVFMi0Bo3UcSG?=
 =?iso-8859-2?Q?fVyH8y/a1On/i5WJNPkSb1+ziyGxjYeWcIAFq0e+JGyNMai2tYMjctmLNx?=
 =?iso-8859-2?Q?Nr+slY/BHYODYtf0Aqt6jmjykLcA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?TmkSaMbJ/qLlXu7gbSCxOTRBn75R2337wSMPld54xb5xcKf4KsiArKXU9p?=
 =?iso-8859-2?Q?CERHhTxV5gnY0lScFcpkKvfo1oOxa+UthsgKlrqs66VmIoAU6M0AgUSQ+1?=
 =?iso-8859-2?Q?evR0o6ARAs0AmjSbOosBBO3e4klWKJ/KQZQDHAALhgchNRclili6K6g8Rb?=
 =?iso-8859-2?Q?8AHj1PWaBlAflzr6107NCGmfmwtZk0CyGerskRj2aC1xd4XG5ONg7836tz?=
 =?iso-8859-2?Q?4B0bnaCZqLfY8kPglTckAg9UT9kAsibq+FiWdyjapN6mRbSEJMXI5cgzhN?=
 =?iso-8859-2?Q?wp/XGWy19PmCy2m+1ULXqR1uafp+R2dSRMcXJ5VcmzHPj7nLs2vzKPc+uw?=
 =?iso-8859-2?Q?UDu4iLPo309eWq3DyQptc0LfT+rY1QcWwp9AD7vRVFWawnvWXvttfq24o0?=
 =?iso-8859-2?Q?0uifWojB4Ui4C8g+BWEVrX8WwbQe1mCpn/5wU6WbZwESsvwDyl74rRqMKu?=
 =?iso-8859-2?Q?SO17faHR7uo2nmXmtPYuXkkgAdQGWwDhX7pB4TkyKtUbAW+xEwnTwQhJrh?=
 =?iso-8859-2?Q?XquW6A+wVz0PJGXHNoFxgAkkMOf3ShvB1hikMZCMp/CkRHb9VMKhcdrU+N?=
 =?iso-8859-2?Q?dLWHteydu9ToxIukajZWVPCGRDYkpfm8dJTvVqCgtQOOF8ndb/wmN+87f8?=
 =?iso-8859-2?Q?r/KArt3L36q1SNjjOghry2YWtABTSVEHGTHVlkZ4FMiLtdgGtsvsul1AlE?=
 =?iso-8859-2?Q?KroI9rvEh6DmWC01Z+Qottlagk9Jmjtf79eYICJvppIZKVF5ACtxDaV9ka?=
 =?iso-8859-2?Q?j5+z8wWi3Mkl19RvNL9stE+STsSqFjA3+MSCAfByvJYBsxNX3BPdIzWHBy?=
 =?iso-8859-2?Q?ZWLLArRlvABAp6iWTFCOu0q8D3vV96jAh15gxNeAtvzp6wsho97jXtdhGo?=
 =?iso-8859-2?Q?gYfnBESUHku7uFJtlKNx1Jj50CVRJnnSJ4e68Gux9IiGIi2G1Tt4atZvok?=
 =?iso-8859-2?Q?89ET98HUP+tH0xkUei9LAkF1UiJDPz8+nNiGFJEcWXp15ejLECWl5PIvaQ?=
 =?iso-8859-2?Q?UsrRuEcYzo/qjJTIJoeel7RBGjLh1s9nHQ3oogFpoacWqUhW2+0sGAuXNH?=
 =?iso-8859-2?Q?EhsQI4hcaGdXDcd+zqTuLsa9qA31z3yYUGUYyJtfVeLbw+9rE5Ik+G42JF?=
 =?iso-8859-2?Q?6odIPcwMv/8/T9E/Pi/nROTH/o25HKFC3VrIuVf5mWpmxOfJAoAuIgPL40?=
 =?iso-8859-2?Q?uQIqJnpiVG4vES+PzCt7iUs+tpxGoglgxC5kqgUUB7SbCmDv+00EOpp1JM?=
 =?iso-8859-2?Q?BWJYwNNzGAIVeX2fDR6B4aIpai0114kOEcuyWtSZcigpurBItuZ2X5VEIC?=
 =?iso-8859-2?Q?jTp7eoSdabNgKYL/fReOWViUnEp6dyfTsX4Rf7TRYvVdIhSjzu60LHISyh?=
 =?iso-8859-2?Q?8YE0Xalp9tKoKc1wIKk/AD3oPU1LFJLemU783ObvcKXKwkJjxRdXbY+BBE?=
 =?iso-8859-2?Q?wfB8WXrjbpZHgH28XJPI9qfSeq01TLfeku6aCcaL8Tj8+zOOGnbfKJyjAk?=
 =?iso-8859-2?Q?xL1vAXsbosHEj/kr8crgDpK3glP8oKYGBM+/bJDSed8AeA2q5uZjQM/G2c?=
 =?iso-8859-2?Q?eKgN1zaqsvfbkWS+4yzQLskPkMcMaWNBXnJoLH7ChkoIzgBuu55hOvrH/2?=
 =?iso-8859-2?Q?MLe5lVFytMAshALUyf+X6g9R+tVQnel53A?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9404543-e028-4338-a89c-08de3e776dfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 20:53:00.0096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8tbGfNt0l3WC/EiUwlXATYf00EIWeQrl7RR2pKjJlsU99HPwSrNLFLkJDzrYn43WgzJ6FhuxFGKB8B6kxBfReQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6854
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

Hi Alex,

>>> +    }
>>> +}
>>> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gs=
p/fw.rs
>>> index 09549f7db52d..228464fd47a0 100644
>>> --- a/drivers/gpu/nova-core/gsp/fw.rs
>>> +++ b/drivers/gpu/nova-core/gsp/fw.rs
>>> @@ -209,6 +209,7 @@ pub(crate) enum MsgFunction {
>>>    GspInitPostObjGpu =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_O=
BJGPU,
>>>    GspRmControl =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
>>>    GetStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
>>> +    UnloadingGuestDriver =3D bindings::NV_VGPU_MSG_FUNCTION_UNLOADING_=
GUEST_DRIVER,
>>>=20
>>>    // Event codes
>>>    GspInitDone =3D bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
>>> @@ -249,6 +250,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
>>>            }
>>>            bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL =3D> Ok(MsgFun=
ction::GspRmControl),
>>>            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> Ok(MsgFu=
nction::GetStaticInfo),
>>> +            bindings::NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER =3D>=
 {
>>> +                Ok(MsgFunction::UnloadingGuestDriver)
>>> +            }
>>>            bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE =3D> Ok(MsgFunctio=
n::GspInitDone),
>>>            bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> {
>>>                Ok(MsgFunction::GspRunCpuSequencer)
>>> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nov=
a-core/gsp/fw/commands.rs
>>> index 85465521de32..c7df4783ad21 100644
>>> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
>>> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
>>> @@ -125,3 +125,30 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
>>> // SAFETY: This struct only contains integer types for which all bit pa=
tterns
>>> // are valid.
>>> unsafe impl FromBytes for GspStaticConfigInfo {}
>>> +
>>> +/// Payload of the `UnloadingGuestDriver` command and message.
>>> +#[repr(transparent)]
>>> +#[derive(Clone, Copy, Debug, Zeroable)]
>>> +pub(crate) struct UnloadingGuestDriver {
>>> +    inner: bindings::rpc_unloading_guest_driver_v1F_07,
>>> +}
>>> +
>>> +impl UnloadingGuestDriver {
>>> +    pub(crate) fn new(suspend: bool) -> Self {
>>> +        Self {
>>> +            inner: bindings::rpc_unloading_guest_driver_v1F_07 {
>>=20
>> We should go through intermediate firmware representation than direct bi=
ndings access?
>=20
> Only if the size of the bindings justifies it - here having an opaque
> wrapper just just well, and spares us some code down the line as we
> would have to initialize the bindings anyway.

I am not sure about that, it sounds like a layering violation. It would be =
good not to keep the rules fuzzy about this, because then we could do it ei=
ther way in all cases.

Another reason is that we cannot anticipate in advance which specific helpe=
r functions we will need to add in the future. Down the line, we may need t=
o add some helper functions to the struct as well.  Also having V1F07 in th=
e name sounds very magic number-ish. It would be good to abstract that out =
with a better-named struct anyway.

Thanks,

- Joel



>=20
>>=20
>>=20
>>> +                bInPMTransition: if suspend { 1 } else { 0 },
>>=20
>> Then this can just be passed as a bool.
>>=20
>>> +                bGc6Entering: 0,
>>> +                newLevel: if suspend { 3 } else { 0 },
>=20
> Note to self to figure out these magic numbers. :)
>=20
