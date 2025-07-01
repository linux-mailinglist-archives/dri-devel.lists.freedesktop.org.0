Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E46AEF067
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B81E10E522;
	Tue,  1 Jul 2025 08:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TdeS7nQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB88510E045;
 Tue,  1 Jul 2025 08:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MK5xnDC+1h22Eb5/SRf6j1ggpAfSC7u1s/RARH2AGSq+2YxT7mb3Uqvk1mqt3t7LrkMgbRrQeWeppxlWldoNSnLJb/zvgpguO9HWBMDLV01M6WFChTUj+CbQwn251xjCzQvNRAxHae6cINjoIPIVGagCO1jAS4J8I4HwPUfmEeMKBA08e5GllnlSUKmngqDg/x+vscpXB3TgtpjZKvMt+7cp8PYwekyYQwkCzleO9lNxP51GMzibkcVA7SoMP61kT7oYq7sqqdlwBHZ7QF5k8nSDLz/epNu2xWBA7z2hCvHAH6ryXRfjq85CZ4uVwXI98wubFif+ewZBbov/axlViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCozHiIltblxr7g3bnerFJFbTXc/fKK6j/1UsRQZBDI=;
 b=JUsgJmpFq8o4xTe67PI5+YJa4IJd/QNoVf9Sz/RidVAqJx+rc1PsvwxZjPQ+shm7B1EN0JtqGfLFWRnq4b4S077bdoO9k3Qupm+29EDdLpAM3lPQ5G1ZWNQsqk4DTVen4BATCWRZpgqoYmi7/fCx2BwAoHGRMzX1nf9+By2mYM30FNs75dp02KxY1312JjgxKxOvRcI9uy7JSG91Q6NVVmEOHe2lO2md81OkY3xlAiKM4moqiKzcYz83Noqy5N/uY3Z4AkcUHDOq9yFtkmqmsFtEcX3hAMVTnRt1uwiASSa9OIT04oxpsfuaFUQpi8JscCFNmFVxzP5XceRJTxF26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCozHiIltblxr7g3bnerFJFbTXc/fKK6j/1UsRQZBDI=;
 b=TdeS7nQLnwmVyl46iHsuaxv4FGKsTRHd6+7Nc3ul6bssCVJajbPD6n74d4vBLGd4O8WsTjRtwgScpz0zVshDT/G/dxHQRcF3xVy9w7L4wRIlYtLvvlhzBhfNKK9Y2UMTCTHL/uv+tY0HDFQk3YKkWN6kBh6U7PH0+c5lGqZRrBg=
Received: from DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) by
 IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 08:04:18 +0000
Received: from DM4PR12MB5937.namprd12.prod.outlook.com
 ([fe80::c847:70c6:3c78:54ba]) by DM4PR12MB5937.namprd12.prod.outlook.com
 ([fe80::c847:70c6:3c78:54ba%4]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 08:04:18 +0000
From: "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang, GuoQing (Sam)"
 <GuoQing.Zhang@amd.com>, "rafael@kernel.org" <rafael@kernel.org>,
 "len.brown@intel.com" <len.brown@intel.com>, "pavel@kernel.org"
 <pavel@kernel.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>
CC: "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun"
 <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
Thread-Topic: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
Thread-Index: AQHb6auWHDxg3eDLo0CTH/CkVPD93LQbmTEAgAHWVgA=
Date: Tue, 1 Jul 2025 08:03:49 +0000
Message-ID: <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
 <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
In-Reply-To: <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: DM4PR12MB5937.namprd12.prod.outlook.com
 (15.20.8880.029)
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5937:EE_|IA1PR12MB6459:EE_
x-ms-office365-filtering-correlation-id: 1fc65006-7773-408e-1f86-08ddb875e0fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?yBzPepUSXhpKY1yyEdrIV4LPbuaFn/aSIg9PQd6opIgW87K5+OnCd8XzRJ?=
 =?iso-8859-1?Q?q2NwVXJcjqqcwpmrlOjPCZBDNgJVBKF7V6EdB8iCKZzHfnqdM4epYLM/0o?=
 =?iso-8859-1?Q?CQvDwbGq4JZikqCLcL5Yz+NE+T1KqspwD3D5fyh9TnDZFbFqU8NfPCigDx?=
 =?iso-8859-1?Q?rl3O3CsFY/mGaL0Ne4vAeidUcCqUwGFHorbsDCqCB5LTuRmlqdeaiQNssb?=
 =?iso-8859-1?Q?m/S33orP4EOI5ckQGzaWKdar38IEahmKLig4ByAdVFUhMtNhD41eGn6t3R?=
 =?iso-8859-1?Q?E8C/I2W3KgirkIQXRXq3ATUzp6jSX1C2YM3V7FdveWwSdCVbWLLxLz0cPe?=
 =?iso-8859-1?Q?w8iZKwxxTWzIzP6dng8vTb1Hg4JCrfaxfy0m22gjMVcSG/pGA+2DO5nMDK?=
 =?iso-8859-1?Q?d8ziY0ylAnJI2FVVbJ1+kwmAYKJAJvfPWK63xAF9q27aGLIpVNNFulqj/s?=
 =?iso-8859-1?Q?gLTaMIwKB4OSLIX/OlgbvCfkiWvQV8QEp5edkMnucABelpFZ/rYJkwnvYS?=
 =?iso-8859-1?Q?U+NqRgouxaqpn3z7aDPZ1e6gfagaXNkt6WmL6walbVzNLMEGdWoPOZVXwp?=
 =?iso-8859-1?Q?DWrVcrMXyfR4TllbfBusOHl8BoaNbrTje8wknZ0F5dxK0rBaGo3GdchQcU?=
 =?iso-8859-1?Q?y8DvQci3PzvQ6hVC1hmfoUtF3ZN3xSUlMiPWQU49hqpukXUr4FViE63KnG?=
 =?iso-8859-1?Q?kh+Dl2vvUNJaZ/IuPFU15zW1AV+8j2i2GK0cWVDTty0o7tLl53XbrIE8Yx?=
 =?iso-8859-1?Q?NAL8kuUNWHMKE6xFCtOzLxCVru5JHwpbJjPhrTxI9O4Ke7/2i4uDU+hQOw?=
 =?iso-8859-1?Q?y/LmJ5OgqO+kN+uw67zoD8lzj0xwakKkI6i9I2jc8mFrK6ivJMkAopNxwj?=
 =?iso-8859-1?Q?GI2v0mfbueP4/UcxfOFlkCNE1p0GoQccJq7jVAzHBWLlXMd+IEw9FYA3jF?=
 =?iso-8859-1?Q?nXAbGd85M4t9RoRTdIcvtOZIvdI9/2bsNNRDYzdDmoFeyDHBTig3NEcw8I?=
 =?iso-8859-1?Q?9qyZBkQTYWnmZBhbU96Arjvtw+xNKI2igGCItpc/1llzoM2gEq2hXqUjiR?=
 =?iso-8859-1?Q?dwsv6h48uuvg/8DFg4ILbud9SzveaGuduSkV4Q8EyKsPKs2f6i4+uVpMCO?=
 =?iso-8859-1?Q?7fLBmLwLc7kFHVfQebAAUeGPG2rV5J8cUIV7yVKNAS0bPPLhytaWsHKEbj?=
 =?iso-8859-1?Q?eTB3x14xFG2W4KScGbzy/+Bogu7HFUyCspbKKBMREy1OcTsxZVw5T/3crn?=
 =?iso-8859-1?Q?WBig8XxSDniFcilLtkzTt1XLkGZ3NN4lT82FRuYvXmnIlPPUxIhueTRww7?=
 =?iso-8859-1?Q?1E/XnN8noRq1qiQMAEds377NKO0I9Kt2igi2h8lUs3fU9dQteA1A9y+0hO?=
 =?iso-8859-1?Q?2paAOKjaYS5m2uKXkXsR5XJIV5nkxbnhGvtt7iH40T5ksivGkF3gdnTvB+?=
 =?iso-8859-1?Q?4OgXZCLy/bx6wL2iVXvsmKdlSCSTpdg+MQqJwAsHPokqAlbpEm3wm8Qzoq?=
 =?iso-8859-1?Q?BJtYRjB4i/xTrfB6SrpRyip2om4XUUepkLNA0vL/pRSA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(13003099007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dK9QYrYLf99mvPdm71+hOmrv0bc3mC8yyrS9ho1R+QpMMnK4DVnZoxNURe?=
 =?iso-8859-1?Q?Qajc1b3SM97wc4cTAtRFHIdJV8/W2PdD7O7Sx95bwg93PaKIqITL4/aSD0?=
 =?iso-8859-1?Q?IwuynqvZhXTfSgmCXo91ccD8sTsvfBIfWEWaIqsQC/0uBWpj++TY1mgwIH?=
 =?iso-8859-1?Q?nhBs1rJ61NGbkLJO6Gz22oOmVBVB0fQPOcjRH+bZOgwW+xqDOc4IAEWqUB?=
 =?iso-8859-1?Q?ao1+LY+4sAlEtp6FHHSO5SkENGYnBvd9sqSfv498z4o+915i951re6dtLY?=
 =?iso-8859-1?Q?RGBfXL6rIZJ/TMX27lYslJms2NuCCQuqzSdkb0ND8WK6/IY7NP4gElvkPM?=
 =?iso-8859-1?Q?TbEh0ZFfAFuwlMQQ970teeGIZQdpffIpSm9W2xvRx9+yJFr3J4b+pIoFy4?=
 =?iso-8859-1?Q?MFOmuuTHejKbu8MnCYem8jUPvaNLmTZdn94ABWV+YndzdWl37tz+Wx7bUT?=
 =?iso-8859-1?Q?a3nWCIatiyPAMaPFFT5nQg9EFhjt0JcYJpEd1J3trLPQ84n3cBw6OkLtKQ?=
 =?iso-8859-1?Q?TXPYJj9AgBjsdMFUrYCr7I37NpoieuSsmyT+vzGwvqpKAPLe5opoSWgaIz?=
 =?iso-8859-1?Q?KKsPD7XfGba2cjY80WDAh/t+ba1uxbHaLx2UtM8aZw7NiNnJY+AXCK/VJn?=
 =?iso-8859-1?Q?0mVqwYzji3CZDFN2QNbQdg7ADeFTUFZkTlEvVbuWBxer9lDV1CaS4bkY3p?=
 =?iso-8859-1?Q?U4/fgohY4jTFWyFHbXoZrRbatnbEQQBPiPYu3gMyIiecmwfvE0d/98BweR?=
 =?iso-8859-1?Q?MLBPRHMYuzXtVulxODHJqeKMmnkfJhA9exqs/P/aLr8SlVbJg8EOITatF7?=
 =?iso-8859-1?Q?gDVapQURjVITZq0AKacL46aWY/sKWpyXYCSG7jxMEdNkPHMgXtx0vcDBrj?=
 =?iso-8859-1?Q?4Pv8sbb9+ZM3tUJ3vnV8oOU6aTJIa7ayalNHZQhbtrlxdX190qJ2vzZaRk?=
 =?iso-8859-1?Q?ifvve9fTnYpZrS2EiXHI2S9zcqMZkeQcjCcphlvhhAP/gV/jervoujJq3/?=
 =?iso-8859-1?Q?1FEdj/9lVPYDJw+ZWCk+FOQqmRPqXhOUgHP6dTQDcfIXvpuhwL3+719ARq?=
 =?iso-8859-1?Q?eX23rxR+s9Or+L/K6FCS/deiIGjm4fQN/T8sC70k0bVfGFI2X4tnng1uW5?=
 =?iso-8859-1?Q?8kM8EHeVHpmVE97MtVXUjuxtI2d0AJj6ghgsajndSF7kNPDF7A03oD4oXt?=
 =?iso-8859-1?Q?C/VXdzk+TtozIbxziOtxZ1XJLOymFmuGLMUOiquPgWuuypPHfayv5T6aIe?=
 =?iso-8859-1?Q?v4mBk4ZjViLdM0dl9e4xZH3PquwlN/iTEx/HdaWrorqT2t6NrfrMc3QnoJ?=
 =?iso-8859-1?Q?UD6moVK3A9os/EGLhZDoR5WfG3MbKM9vmfLt4Qm9ZKxtLPZ7B5myudU44d?=
 =?iso-8859-1?Q?ZCPWjYrEkpUoMRD/E8CKWk3Oq5RcT8iPYA9bAXu0XIlzregGoz9Q7k0T2Z?=
 =?iso-8859-1?Q?tjbnIRggqdw2YeSVJttP9jTirMKpt2yIHv39r5hf/c9xqtA/s1BBE/ktoX?=
 =?iso-8859-1?Q?FA2gdsR5282B/sfISxrPNXRTWRwE+twyT0paopFJLE0l5MuGm26qOawKO2?=
 =?iso-8859-1?Q?wnZavvo4w+B4F6cxmVEVeZuhDuc52x26LPz/+VbLGqsyRZUJXUwqo0wKWI?=
 =?iso-8859-1?Q?XrjZ7S67B1mLY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_8eb1700d4d604a1e9d09718f65baaf1eamdcom_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc65006-7773-408e-1f86-08ddb875e0fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:04:18.1283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28WCUGRUMrMVRjSYXhCGe8U4DeAnEauSR0pmDDRV7VzA0BHAEQT4s1R/oOne/9eJGl4SDZHLYqZqNpj0wcBsBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
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

--_000_8eb1700d4d604a1e9d09718f65baaf1eamdcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


thaw() is called before writing the hiberation image to swap disk. See
the doc here.
https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/de=
vices.rst?plain=3D1#L552

And amdgpu implemented thaw() callback by calling amdgpu_device_resume().
https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amd=
gpu_drv.c#L2572

This patch is skip amdgpu_amdkfd_resume_process() call in thaw() during
hibernation. it is not skipped in restore() during resume from
hibernation when system boot again.


I just found the following kernel doc. Thaw() is intended to resume the
storage device for saving the hibernation image. Our GPU is not involved
in it, it is not necessary to resume our GPU in thaw().
https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?pl=
ain=3D1#L588

So another implementation is to remove the amdgpu_device_resume() call
in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in
amdgpu_pci_shutdown() for hibernation.
Initial tests show it's working fine for hibernation successful case.
Should I switch to this implementation?

But thaw() is also called to restore the GPU when hibernation is aborted
due to some error in hibernation image creation stage. In this case,
amdgpu_device_resume() is needed in thaw().

So I need a method to check if hibernation is aborted or not to
conditionally skip amdgpu_device_resume() in thaw(). Currently I don't
know how to do this.


Regards
Sam


On 2025/6/30 19:58, Christian K=F6nig wrote:
> On 30.06.25 12:41, Samuel Zhang wrote:
>> The hibernation successful workflow:
>> - prepare: evict VRAM and swapout GTT BOs
>> - freeze
>> - create the hibernation image in system memory
>> - thaw: swapin and restore BOs
> Why should a thaw happen here in between?
>
>> - complete
>> - write hibernation image to disk
>> - amdgpu_pci_shutdown
>> - goto S5, turn off the system.
>>
>> During prepare stage of hibernation, VRAM and GTT BOs will be swapout to
>> shmem. Then in thaw stage, all BOs will be swapin and restored.
> That's not correct. This is done by the application starting again and no=
t during thaw.
>
>> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
>> the swapin and restore BOs takes too long (50 minutes) and it is not
>> necessary since the follow-up stages does not use GPU.
>>
>> This patch is to skip BOs restore during thaw to reduce the hibernation
>> time.
> As far as I can see that doesn't make sense. The KFD processes need to be=
 resumed here and that can't be skipped.
>
> Regards,
> Christian.
>
>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_device.c
>> index a8f4697deb1b..b550d07190a2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, b=
ool notify_clients)
>>               amdgpu_virt_init_data_exchange(adev);
>>               amdgpu_virt_release_full_gpu(adev, true);
>>
>> -            if (!adev->in_s0ix && !r && !adev->in_runpm)
>> +            if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in_s4=
)
>>                       r =3D amdgpu_amdkfd_resume_process(adev);
>>       }
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_drv.c
>> index 571b70da4562..23b76e8ac2fd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device *de=
v)
>>   static int amdgpu_pmops_restore(struct device *dev)
>>   {
>>       struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
>>
>> +    adev->in_s4 =3D false;
>>       return amdgpu_device_resume(drm_dev, true);
>>   }
>>

--_000_8eb1700d4d604a1e9d09718f65baaf1eamdcom_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <92F0F351C3D55C4AA73F829AA76CF2FF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><br>
thaw() is called before writing the hiberation image to swap disk. See <br>
the doc here.<br>
<a href=3D"https://github.com/torvalds/linux/blob/v6.14/Documentation/drive=
r-api/pm/devices.rst?plain=3D1#L552">https://github.com/torvalds/linux/blob=
/v6.14/Documentation/driver-api/pm/devices.rst?plain=3D1#L552</a><br>
<br>
And amdgpu implemented thaw() callback by calling amdgpu_device_resume().<b=
r>
<a href=3D"https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd=
/amdgpu/amdgpu_drv.c#L2572">https://github.com/torvalds/linux/blob/v6.14/dr=
ivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572</a><br>
<br>
This patch is skip amdgpu_amdkfd_resume_process() call in thaw() during <br=
>
hibernation. it is not skipped in restore() during resume from <br>
hibernation when system boot again.<br>
<br>
<br>
I just found the following kernel doc. Thaw() is intended to resume the <br=
>
storage device for saving the hibernation image. Our GPU is not involved <b=
r>
in it, it is not necessary to resume our GPU in thaw().<br>
<a href=3D"https://github.com/torvalds/linux/blob/v6.14/Documentation/power=
/pci.rst?plain=3D1#L588">https://github.com/torvalds/linux/blob/v6.14/Docum=
entation/power/pci.rst?plain=3D1#L588</a><br>
<br>
So another implementation is to remove the amdgpu_device_resume() call <br>
in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in <br>
amdgpu_pci_shutdown()</span><span lang=3D"EN-US" style=3D"font-size:11.0pt"=
> for hibernation</span><span style=3D"font-size:11.0pt">.<br>
Initial tests show it's working fine for hibernation successful case. <br>
Should I switch to this implementation?<br>
<br>
But thaw() is also called to restore the GPU when hibernation is aborted <b=
r>
due to some error in hibernation image creation stage. In this case, <br>
amdgpu_device_resume() is needed in thaw().<br>
<br>
So I need a method to check if hibernation is aborted or not to <br>
conditionally skip amdgpu_device_resume() in thaw(). Currently I don't <br>
know how to do this.<br>
<br>
<br>
Regards<br>
Sam<br>
<br>
<br>
On 2025/6/30 19:58, Christian K=F6nig wrote:<br>
&gt; On 30.06.25 12:41, Samuel Zhang wrote:<br>
&gt;&gt; The hibernation successful workflow:<br>
&gt;&gt; - prepare: evict VRAM and swapout GTT BOs<br>
&gt;&gt; - freeze<br>
&gt;&gt; - create the hibernation image in system memory<br>
&gt;&gt; - thaw: swapin and restore BOs<br>
&gt; Why should a thaw happen here in between?<br>
&gt;<br>
&gt;&gt; - complete<br>
&gt;&gt; - write hibernation image to disk<br>
&gt;&gt; - amdgpu_pci_shutdown<br>
&gt;&gt; - goto S5, turn off the system.<br>
&gt;&gt;<br>
&gt;&gt; During prepare stage of hibernation, VRAM and GTT BOs will be swap=
out to<br>
&gt;&gt; shmem. Then in thaw stage, all BOs will be swapin and restored.<br=
>
&gt; That's not correct. This is done by the application starting again and=
 not during thaw.<br>
&gt;<br>
&gt;&gt; On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,<br>
&gt;&gt; the swapin and restore BOs takes too long (50 minutes) and it is n=
ot<br>
&gt;&gt; necessary since the follow-up stages does not use GPU.<br>
&gt;&gt;<br>
&gt;&gt; This patch is to skip BOs restore during thaw to reduce the hibern=
ation<br>
&gt;&gt; time.<br>
&gt; As far as I can see that doesn't make sense. The KFD processes need to=
 be resumed here and that can't be skipped.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt;&gt; Signed-off-by: Samuel Zhang &lt;guoqing.zhang@amd.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-<br>
&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp;&nbsp;&nb=
sp; | 2 ++<br>
&gt;&gt;&nbsp;&nbsp; 2 files changed, 3 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt; index a8f4697deb1b..b550d07190a2 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt; @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *=
dev, bool notify_clients)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; amdgpu_virt_init_data_exchange(adev);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; amdgpu_virt_release_full_gpu(adev, true);<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (!adev-&gt;in_s0ix &amp;&amp; !r &amp;&amp; !adev-&gt;in_runpm)<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (!adev-&gt;in_s0ix &amp;&amp; !r &amp;&amp; !adev-&gt;in_runpm &amp;&a=
mp; !adev-&gt;in_s4)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amd=
gpu_amdkfd_resume_process(adev);<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;&gt; index 571b70da4562..23b76e8ac2fd 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt;&gt; @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct devi=
ce *dev)<br>
&gt;&gt;&nbsp;&nbsp; static int amdgpu_pmops_restore(struct device *dev)<br=
>
&gt;&gt;&nbsp;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *drm_dev =3D=
 dev_get_drvdata(dev);<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D drm_to_adev(drm=
_dev);<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; adev-&gt;in_s4 =3D false;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return amdgpu_device_resume(dr=
m_dev, true);<br>
&gt;&gt;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp; <o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_8eb1700d4d604a1e9d09718f65baaf1eamdcom_--
