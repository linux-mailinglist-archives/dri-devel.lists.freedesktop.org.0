Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA7843C25
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95017113AF1;
	Wed, 31 Jan 2024 10:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FCF113AF1;
 Wed, 31 Jan 2024 10:20:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOhzPTlfV1SzkXm/jEXJfvoya+0/dzo89rJfBOZMQOAOxFL+FOrR3Q1oKhWr3bgxoadTQE4UatuOmtpBkX1zeMVSVs5IiP7q5VrnEXGTvSEloMhJM4MbEqDtgcLbUdoPrkyv8geEWgkF69L/HF6/NSJOG0BkedL1e1EHnfEW+Sjz7UoASRFJynrH13x/ZkIAl2ipFxPp2uFW1Ld5rvlGIvUOQai327+VIQqFw/OvSb0oyQ93RqP/AiiaJQb/uDoLO9qXkpNXrRExBVOWNcuG5E/JfoagssbS0CKM55Kjsx8nepSC9pf70MtoB1Ri1HHoJirYby8+MDNh0CKKUxugCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMCOf/9ZqG7vb9zNlawSzGmb1dds2U95pAZX6muYrPc=;
 b=MwY2QMPg6jIHhpIUWtB6upyq6YWXdjn4RtiWDXOkwt5Q/Z3Kj2G2E/HiMdCm21ovp+c0mfO/5gKDc7gpL/6P8cgkMfc4WvqybGpHbwLH5Aw72+OuPOPlk0dVkn8pE5jhx4OCF9XgC36fFti07uVodSz4TPyjcZSCIyQMe+U32cYnMDoxmx4CpBx70dsCh6fB2dpcUwyhaDKts22wQDosnlsZ9UUd0GfbxfhKk0LhY4Shqs4dcnQjhXRCtFUgTlXmgJ+53ncLygTq6eRbb3QP62UYO/cR8fwE/imnCSlZgbvssKlzyyQIKXhYstmAdVh6bc3XUd1CGLcfKSiJbStmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMCOf/9ZqG7vb9zNlawSzGmb1dds2U95pAZX6muYrPc=;
 b=jBiRCv2/BtKdJ/rukbb/wO4nZRuLX74KnGGsvE6dSZ1loF6j4+wbnaAO4WjR335GQiNliz7SZB4zb/vSnPIro8n/DgOe15ofAz4WlAgcXKX2QTgQey0s2GnK2VTHOyB4YSPtylCWOvoAKIf2HuL0AcnTns7PrP4o3AiugIdNPqg=
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 10:20:13 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::f70b:6b07:4565:a2b1]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::f70b:6b07:4565:a2b1%6]) with mapi id 15.20.7228.036; Wed, 31 Jan 2024
 10:20:13 +0000
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang, Julia"
 <Julia.Zhang@amd.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I
 Wu <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, David Airlie <airlied@gmail.com>, Erik Faye-Lund
 <kusmabite@gmail.com>, "Olsak, Marek" <Marek.Olsak@amd.com>, "Pelloux-Prayer, 
 Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>, "Huang, Honglei1"
 <Honglei1.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray"
 <Ray.Huang@amd.com>, David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v2 1/1] drm/virtio: Implement device_attach
Thread-Topic: [PATCH v2 1/1] drm/virtio: Implement device_attach
Thread-Index: AQHaUp5loSGDM+9UH0yP2y64Fdg2D7DyNKOAgAABk4CAADRYAIAB1EAA
Date: Wed, 31 Jan 2024 10:20:12 +0000
Message-ID: <IA1PR12MB653270F7FD75C1B4DF8B90E8F27C2@IA1PR12MB6532.namprd12.prod.outlook.com>
References: <20240129103118.3258781-1-julia.zhang@amd.com>
 <ZbjZJ3qQzdOksnb2@phenom.ffwll.local> <ZbjaebswTCxmlwu0@phenom.ffwll.local>
 <97c50e01-ee33-4ac8-975c-f645c2ed49c6@amd.com>
In-Reply-To: <97c50e01-ee33-4ac8-975c-f645c2ed49c6@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: IA1PR12MB6305.namprd12.prod.outlook.com
 (15.20.7249.014)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|PH7PR12MB5950:EE_
x-ms-office365-filtering-correlation-id: 2e22b94e-de55-4fed-ffba-08dc22463611
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nLzSUvH6foJbYzk1mTxQ7BFi/1bkfMNZS8qDq9FNH8gjq57eAHjCQXYpitJbmH9pBA7uQ4xHKmHvRAmxDQl04LAa/sIV4v+sby6rP4SQqWsmda9PdrYRpDDl54EcQo+bi+VQlAdUQzbvVGFE+ZA2RhUMbsDvy4RSmOBz3yQyO+qrBLFaLWBo79v7ulM5x400N41Ug1vQouglz2A6ooyCxDcp/7udtg+zTSZJxG2F76fi7HBRH75esHsLHYkPKi9clhW8ESZWIf7NiBDaFl1Ny3BW7ioV1tggWjLnU6YbMC8NGBwUgHN6FnXH4jWQlf5hMPmBQkoEJyH4kXUnh+ZKR7qyIX1Ma3xNhcP7jWHNHLM8UW9SM8OcrppfNMmkFKApfrWPHOMyM6Fc56/snylUMHmgiJrQ6BxERU2Rve8tV9G+JAOrrxmP4QVCPsGPd3XomRWOREQZNsLVSvF5t+8kIDdbgwOZece/zEfh7C76yJcZo42QVaCn2k8EaHZZEYoakr4QidBLuQqH71SHYOrbsgaY+ycPeo3nc5irfd6oBMvByDlIXom4ENj5uR4DaIv9SGjCtYnbm4JAcsV13BnFr+nlyD0uLQL9whmampeQOpHx9bMfggT1dGJ+VEMWziSs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(376002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(316002)(55016003)(66476007)(66446008)(66556008)(66946007)(64756008)(122000001)(2906002)(8936002)(52536014)(9686003)(8676002)(38070700009)(76116006)(110136005)(5660300002)(33656002)(38100700002)(7416002)(83380400001)(66574015)(921011)(26005)(71200400001)(66899024)(966005)(6506007)(7696005)(41300700001)(53546011)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3A1cHdVSlJZK1VEcko5aTBDbENSa0ZvOVRFNFBEcUt5SHZYNUNMeUtES2Mw?=
 =?utf-8?B?Vjd0ajNKMklpaHJBRm90RDlqai8vMldlelhvL0FZZWlCa2VNYkQzRFJ4RElC?=
 =?utf-8?B?d083UDE4RHJ4TVphYitwcGhxZVdnbDRMc2taZlRoRlEvZXJvWDlDQVVra3I3?=
 =?utf-8?B?NnBjcENpdTRDT25lemx4cXVIWnA5ckErcDNVaERjOG1vUlYzeXFnQzJqSGVZ?=
 =?utf-8?B?S0tzeUlQQ1ZtdVU2ZEZoT2tBMXhrMjlHcSs0UldmMEdZVmRjM0ZuQ3RaVlRo?=
 =?utf-8?B?aEdzNWR1RTY3WDU4dVc1dU44bi92Wm14VmJwaVVLQnlWdktTbnRiUGhvTytS?=
 =?utf-8?B?enlzZ2s4QU4wN2NiS3FXMVZpZVVMMEpSL2RCYzdTa3Z3UjZIQWFPSFFRYzJF?=
 =?utf-8?B?WTM2VVhuV1RVMXJnUFUzV0ozOXYwTWM3eWFLTHp2RlMydTY0TVNpNXd2cTRN?=
 =?utf-8?B?NXZMb0c2djZ0Y29MVkM1MzUrREFGa2ZXL3FFRU04QXRCOHJyYlBYNmx0UkRk?=
 =?utf-8?B?bjgrRUttNXo2NE95Z05CbE1VSXJyQzZQYm5IWUpjMzlTSVZzRHNFS0VFOXE4?=
 =?utf-8?B?MDNBNndxblYwVmdmbEltVWdVazVDaUhEcUs3ckkzZElZakdMQkR1aUplTEpI?=
 =?utf-8?B?U0VET1BKZVdITjJKeUwrN3VDS0xFYTI4SW1PSVcxOHJldlE2OGR5dDRVNHdj?=
 =?utf-8?B?VG1QcUwvbGdiK3pqMW54eml0M3FJcXhpSVNJTFJUbXNrS0VyM3JyYmpuTmw4?=
 =?utf-8?B?YmVSb0EzR1dDVllXdS9kM3BjK2t3QjMxOThGVlRsWWRydjhjWVhmU0N4M0xO?=
 =?utf-8?B?ajIvLzl3S1A3VWsyeDJZazhpK3dNSCtUV3R3WTg1STB0SWZ0UGlydHBxOHRB?=
 =?utf-8?B?V3lVdVR1RHIvTjBmeWFBODUwOGc4NW4zNk9CMHM5Y2NEOGtZbGZOM0R2SkJV?=
 =?utf-8?B?WmRtZDhrSER2T25nMG5aNEpXZnhsK3pXNDAxYm9SYllodk9nd3pHVkU2dUxz?=
 =?utf-8?B?RHdXc2Juc1FEQkhHYTVQem9VbTltL0gvWW01WGVEN3BiZzVNaWRXa2c1UWgy?=
 =?utf-8?B?RklLenNreWFCSkltaDVtYnNRYmhkWUxwQnZYKytKV2NEa3R0SmYvc3V2c0tt?=
 =?utf-8?B?a0d3L1g5R21mQmtWd3NKU1E3T2RtbzdMSjVILzFXYW56d0toU2tKRGpocUVG?=
 =?utf-8?B?em93NTRtYWJmQ3lzWjJDanhOb2dVaTVORy91QmgwMWUvRk1hUjNsdzlWSU4v?=
 =?utf-8?B?RnR6YXczNlZzaVg0a3Z1TXNuc3d2alZUUU90VEV1Ym42VGloOFI1TmxNQTR3?=
 =?utf-8?B?WlhSOWpydkVzV2pEZWVYY0dPMjc5cFdkWFkvc2Y4TkFGdWtIQkRCTmE3WElO?=
 =?utf-8?B?UkNxTGVDL0NMdUxGQ09ON0puNUVrVm0zaTdqSHE3OUc4M3h3YndaZEVYc2tY?=
 =?utf-8?B?VmtWckhFVGxUZVJXM2ZpeWdGeUlHUGtZVGpQZitid0FUNzJKOTNUZ01XZWl3?=
 =?utf-8?B?TVQ1V1pwWVpzekFiLzhubW0xUTFzWjM0QVJHWG9MM1g0Y3NnWkcrNk8xRWpB?=
 =?utf-8?B?Z0l0V1REZW1XbXF2NVVYM21qVmJnYkRJNXNDRDhZOE5POFR4blJkSHZvZjI5?=
 =?utf-8?B?UXQ5dERnbU9FaGZxSklTRDJrYWY4QUtoVnE1S0NCQnVSSEVxZmJpcmxhaTQ1?=
 =?utf-8?B?dnZKRmdzTTM2WlN3QXNuTTQvNjRScWgxVEdmYU1XRW1FRkJ1cGNlRE5WVU0v?=
 =?utf-8?B?ckpWaGEwVzRGMDFNYkcyR01EYTVPN3NrY3Y1QnZiWm1MUWJzTlg2dGpiODVR?=
 =?utf-8?B?b0YxczBKTVhDM0sxdzR1Yk5ETmowUUtrWHNLZVovTFJmZURyZU1kM3dXWmRs?=
 =?utf-8?B?aFdjRzJUS2RMZlRnY2tBTnlpZjI0SDQwU1NuVy9oRDNVWHpBalgvMVBJWFFI?=
 =?utf-8?B?UTVUcjhvNS8vb2E0b1NCbzdsMTR1OEtpbnVud3Qra0grUHlDajRGTWJsWENx?=
 =?utf-8?B?K2hpbU80NWZ3aTcwRUtrMHFOak4zWFN5bEp5TnNrNVltNys1d0swWVA0eGVQ?=
 =?utf-8?B?M290MXMvNEF0TGIvbEFUOTZWcXpzVmxHOExrdklDYThycXJ0c081S0Uwb0dW?=
 =?utf-8?Q?ek2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6395FC751C127743BBC4052A75875A11@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e22b94e-de55-4fed-ffba-08dc22463611
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 10:20:12.9574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dyrBoauuSV9VriH8vx1XV6/sKAwjT1MFvJIw5WCaI9QQJat6bKtbJ+7gW6cYKSsES2+06mzoVCPxgJdgCs2FdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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

DQoNCk9uIDIwMjQvMS8zMCAyMjoyMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gQW0gMzAu
MDEuMjQgdW0gMTI6MTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4gT24gVHVlLCBKYW4gMzAs
IDIwMjQgYXQgMTI6MTA6MzFQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4+PiBPbiBN
b24sIEphbiAyOSwgMjAyNCBhdCAwNjozMToxOVBNICswODAwLCBKdWxpYSBaaGFuZyB3cm90ZToN
Cj4+Pj4gQXMgdnJhbSBvYmplY3RzIGRvbid0IGhhdmUgYmFja2luZyBwYWdlcyBhbmQgdGh1cyBj
YW4ndCBpbXBsZW1lbnQNCj4+Pj4gZHJtX2dlbV9vYmplY3RfZnVuY3MuZ2V0X3NnX3RhYmxlIGNh
bGxiYWNrLiBUaGlzIHJlbW92ZXMgZHJtIGRtYS1idWYNCj4+Pj4gY2FsbGJhY2tzIGluIHZpcnRn
cHVfZ2VtX21hcF9kbWFfYnVmKCkvdmlydGdwdV9nZW1fdW5tYXBfZG1hX2J1ZigpDQo+Pj4+IGFu
ZCBpbXBsZW1lbnQgdmlydGdwdSBzcGVjaWZpYyBtYXAvdW5tYXAvYXR0YWNoIGNhbGxiYWNrcyB0
byBzdXBwb3J0DQo+Pj4+IGJvdGggb2Ygc2htZW0gb2JqZWN0cyBhbmQgdnJhbSBvYmplY3RzLg0K
Pj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpYSBaaGFuZyA8anVsaWEuemhhbmdAYW1kLmNv
bT4NCj4+Pj4gLS0tDQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wcmlt
ZS5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4+Pj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYyBiL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9wcmltZS5jDQo+Pj4+IGluZGV4IDQ0NDI1ZjIwZDkxYS4uYjQ5
MGE1MzQzYjA2IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfcHJpbWUuYw0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJp
bWUuYw0KPj4+PiBAQCAtNDksMTEgKzQ5LDI2IEBAIHZpcnRncHVfZ2VtX21hcF9kbWFfYnVmKHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4+Pj4gwqAgew0KPj4+PiDCoMKgwqDC
oMKgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gYXR0YWNoLT5kbWFidWYtPnByaXY7DQo+
Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyA9IGdlbV90b192aXJ0
aW9fZ3B1X29iaihvYmopOw0KPj4+PiArwqDCoMKgIHN0cnVjdCBzZ190YWJsZSAqc2d0Ow0KPj4+
PiArwqDCoMKgIGludCByZXQ7DQo+Pj4+IMKgIMKgwqDCoMKgwqAgaWYgKHZpcnRpb19ncHVfaXNf
dnJhbShibykpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdmlydGlvX2dwdV92cmFt
X21hcF9kbWFfYnVmKGJvLCBhdHRhY2gtPmRldiwgZGlyKTsNCj4+Pj4gwqAgLcKgwqDCoCByZXR1
cm4gZHJtX2dlbV9tYXBfZG1hX2J1ZihhdHRhY2gsIGRpcik7DQo+Pj4+ICvCoMKgwqAgc2d0ID0g
ZHJtX3ByaW1lX3BhZ2VzX3RvX3NnKG9iai0+ZGV2LA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdG9fZHJtX2dlbV9zaG1lbV9vYmoob2JqKS0+cGFnZXMsDQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvYmotPnNpemUgPj4g
UEFHRV9TSElGVCk7DQo+Pj4+ICvCoMKgwqAgaWYgKElTX0VSUihzZ3QpKQ0KPj4+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIHNndDsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIHJldCA9IGRtYV9tYXBf
c2d0YWJsZShhdHRhY2gtPmRldiwgc2d0LCBkaXIsIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMpOw0K
Pj4+PiArwqDCoMKgIGlmIChyZXQpIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNnX2ZyZWVfdGFi
bGUoc2d0KTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGtmcmVlKHNndCk7DQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gRVJSX1BUUihyZXQpOw0KPj4+PiArwqDCoMKgIH0NCj4+Pj4gKw0KPj4+
PiArwqDCoMKgIHJldHVybiBzZ3Q7DQo+Pj4+IMKgIH0NCj4+Pj4gwqAgwqAgc3RhdGljIHZvaWQg
dmlydGdwdV9nZW1fdW5tYXBfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRh
Y2gsDQo+Pj4+IEBAIC02MywxMiArNzgsMjkgQEAgc3RhdGljIHZvaWQgdmlydGdwdV9nZW1fdW5t
YXBfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsDQo+Pj4+IMKgwqDC
oMKgwqAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBhdHRhY2gtPmRtYWJ1Zi0+cHJpdjsN
Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvID0gZ2VtX3RvX3Zp
cnRpb19ncHVfb2JqKG9iaik7DQo+Pj4+IMKgICvCoMKgwqAgaWYgKCFzZ3QpDQo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm47DQo+Pj4+ICsNCj4+Pj4gwqDCoMKgwqDCoCBpZiAodmlydGlvX2dw
dV9pc192cmFtKGJvKSkgew0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmlydGlvX2dwdV92cmFt
X3VubWFwX2RtYV9idWYoYXR0YWNoLT5kZXYsIHNndCwgZGlyKTsNCj4+Pj4gLcKgwqDCoMKgwqDC
oMKgIHJldHVybjsNCj4+Pj4gK8KgwqDCoCB9IGVsc2Ugew0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
ZG1hX3VubWFwX3NndGFibGUoYXR0YWNoLT5kZXYsIHNndCwgZGlyLCBETUFfQVRUUl9TS0lQX0NQ
VV9TWU5DKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNnX2ZyZWVfdGFibGUoc2d0KTsNCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGtmcmVlKHNndCk7DQo+Pj4+IMKgwqDCoMKgwqAgfQ0KPj4+PiArfQ0K
Pj4+PiArDQo+Pj4+ICtzdGF0aWMgaW50IHZpcnRncHVfZ2VtX2RldmljZV9hdHRhY2goc3RydWN0
IGRtYV9idWYgKmRtYV9idWYsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCkNCj4+Pj4gK3sNCj4+
Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IGF0dGFjaC0+ZG1hYnVmLT5w
cml2Ow0KPj4+PiArwqDCoMKgIHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8gPSBnZW1fdG9f
dmlydGlvX2dwdV9vYmoob2JqKTsNCj4+Pj4gK8KgwqDCoCBpbnQgcmV0ID0gMDsNCj4+Pj4gKw0K
Pj4+PiArwqDCoMKgIGlmICghdmlydGlvX2dwdV9pc192cmFtKGJvKSAmJiBvYmotPmZ1bmNzLT5w
aW4pDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBvYmotPmZ1bmNzLT5waW4ob2JqKTsNCj4+
Pj4gwqAgLcKgwqDCoCBkcm1fZ2VtX3VubWFwX2RtYV9idWYoYXR0YWNoLCBzZ3QsIGRpcik7DQo+
Pj4+ICvCoMKgwqAgcmV0dXJuIHJldDsNCj4+PiBUaGlzIGRvZXNuJ3QgbG9vayBsaWtlIHdoYXQg
SSd2ZSBleHBlY3RlZC4gVGhlcmUgc2hvdWxkIGJlIG5vIG5lZWQgdG8NCj4+PiBjaGFuZ2UgdGhl
IG1hcC91bm1hcCBmdW5jdGlvbnMsIGVzcGVjaWFsbHkgbm90IGZvciB0aGUgdXN1YWwgZ2VtIGJv
IGNhc2UuDQo+Pj4gV2Ugc2hvdWxkIGRlZmluaXRlbHkga2VlcCB1c2luZyB0aGUgZXhhY3Qgc2Ft
ZSBjb2RlIGZvciB0aGF0LiBJbnN0ZWFkIGFsbA0KPj4+IEkgZXhwZWN0ZWQgaXMgcm91Z2hseQ0K
Pj4+DQo+Pj4gdmlydGdwdV9nZW1fZGV2aWNlX2F0dGFjaCgpDQo+Pj4gew0KPj4+IMKgwqDCoMKg
aWYgKHZpcnRpb19ncHVfaXNfdnJhbShibykpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAoY2Fu
X2FjY2Vzc192aXJ0aW9fdnJhbV9kaXJlY3RseShhdHRhY2gtPmRldikNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+IMKgwqDCoMKgwqDCoMKgIGVsc2UNCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUJVU1k7DQo+Pj4gwqDCoMKgwqB9IGVsc2Ugew0K
Pj4+IMKgwqDCoMKgwqDCoMKgIHJldHVybiBkcm1fZ2VtX21hcF9hdHRhY2goKTsNCj4+PiDCoMKg
wqDCoH0NCj4+PiB9DQo+Pj4NCj4+PiBOb3RlIHRoYXQgSSB0aGluayBjYW5fYWNjZXNzX3ZpcnRp
b192cmFtX2RpcmVjdGx5KCkgbmVlZHMgdG8gYmUNCj4+PiBpbXBsZW1lbnRlZCBmaXJzdC4gSSdt
IG5vdCBldmVuIHN1cmUgaXQncyBwb3NzaWJsZSwgbWlnaHQgYmUgdGhhdCBhbGwgdGhlDQo+Pj4g
aW1wb3J0ZXJzIG5lZWQgdG8gc2V0IHRoZSBhdHRhY2htZW50LT5wZWVyMnBlZXIgZmxhZy4gV2hp
Y2ggaXMgd2h5IHRoaXMNCj4+PiB0aGluZyBleGlzdHMgcmVhbGx5LiBCdXQgdGhhdCdzIGEgcGls
ZSBtb3JlIHdvcmsgdG8gZG8uDQo+IA0KSGkgU2ltYSwgQ2hyaXN0aWFuLA0KDQo+IFllYWgsIHRo
YXQgaXMgcmVhbGx5IGp1c3Qgc3BlY3VsYXRpdmUuIEFsbCBpbXBvcnRlcnMgbmVlZCB0byBzZXQg
dGhlIHBlZXIycGVlciBmbGFnIGp1c3QgaW4gY2FzZS4NCg0KSSBzZWUsIEkgd2lsbCBtb2RpZnkg
dGhpcy4NCg0KPiANCj4gV2hhdCBoYXBwZW5zIHVuZGVyIHRoZSBob29kIGlzIHRoYXQgSU9NTVUg
cmVkaXJlY3RzIHRoZSAiVlJBTSIgbWVtb3J5IGFjY2VzcyB0byB3aGF0ZXZlciBhZGRyZXNzIHRo
ZSBETUEtYnVmIG9uIHRoZSBob3N0IGlzIHBvaW50aW5nIHRvIChzeXN0ZW0sIFZSQU0sIGRvb3Ji
ZWxsLCBJT01NVSwgd2hhdGV2ZXIpLg0KPiANCj4gSSdtIGFsc28gbm90IDEwMCUgc3VyZSBpZiBh
bGwgdGhlIGNhY2hlIHNub29waW5nIGlzIGRvbmUgY29ycmVjdGx5IGluIGFsbCBjYXNlcywgYnV0
IGZvciBub3cgaXQgc2VlbXMgdG8gd29yay4NCj4+Pj4NCj4+PiBGcmFua2x5IHRoZSBtb3JlIEkg
bG9vayBhdCB0aGUgb3JpZ2luYWwgcGF0Y2ggdGhhdCBhZGRlZCB2cmFtIGV4cG9ydA0KPj4+IHN1
cHBvcnQgdGhlIG1vcmUgdGhpcyBqdXN0IGxvb2tzIGxpa2UgYSAicGxzIHJldmVydCwgdGhpcyBp
cyBqdXN0IHRvbw0KPj4+IGJyb2tlbiIuDQo+PiBUaGUgY29tbWl0IEkgbWVhbiBpcyB0aGlzIG9u
ZTogZWE1ZWEzZDhhMTE3ICgiZHJtL3ZpcnRpbzogc3VwcG9ydCBtYXBwaW5nDQo+PiBleHBvcnRl
ZCB2cmFtIikuIFRoZSBjb21taXQgbWVzc2FnZSBkZWZpbml0ZWx5IG5lZWRzIHRvIGNpdGUgdGhh
dCBvbmUsIGFuZA0KPj4gYWxzbyBuZWVkcyBhIGNjOiBzdGFibGUgYmVjYXVzZSBub3QgcmVqZWN0
aW5nIGludmFsaWQgaW1wb3J0cyBpcyBhIHByZXR0eQ0KPj4gYmlnIGRlYWwuDQo+IA0KPiBZZWFo
LCBJJ3ZlIHBvaW50ZWQgb3V0IHRoYXQgY29tbWl0IGluIGFuIGludGVybmFsIGRpc2N1c3Npb24g
YXMgd2VsbC4gSSB3YXMganVzdCBub3QgYXdhcmUgdGhhdCBpdCdzIHRoYXQgc2V2ZXJlbHkgYnJv
a2VuLg0KPiANCg0KWWVhaCB3ZSBoYXZlIG1lbnRpb25lZCB0aGlzIHBhdGNoIGJlZm9yZSwgYnV0
IEkgZG9uJ3QgdG90YWxseSB1bmRlcnN0YW5kIHdoeSB0aGlzIGlzIHRvbyBicm9rZW4uIFdpdGhv
dXQgZXhwb3J0aW5nIHZyYW0gb2JqZWN0cywgZEdQVSBwcmltZSBmZWF0dXJlIHdvdWxkIG5vdCBi
ZSByZWFsaXplZC4NCldvdWxkIHlvdSBtaW5kIHRvIGV4cGxhaW4gbW9yZSBhYm91dCBpdC4gVGhh
bmtzIQ0KDQpCZXN0IHJlZ2FyZHMsDQpKdWxpYQ0KDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4N
Cj4gDQo+Pg0KPj4gQWxzbyBhZGRpbmcgRGF2aWQuDQo+PiAtU2ltYQ0KPj4NCj4+PiBXZSBzaG91
bGQgZGVmaW5pdGVseSBub3Qgb3Blbi1jb2RlIGFueSBmdW5jdGlvbnMgZm9yIHRoZSBnZW1fYm8g
ZXhwb3J0DQo+Pj4gY2FzZSwgd2hpY2ggeW91ciBwYXRjaCBzZWVtcyB0byBkbz8gT3IgbWF5YmUg
SSdtIGp1c3QgZXh0cmVtZWx5IGNvbmZ1c2VkLg0KPj4+IC1TaW1hDQo+Pj4NCj4+Pj4gwqAgwqAg
c3RhdGljIGNvbnN0IHN0cnVjdCB2aXJ0aW9fZG1hX2J1Zl9vcHMgdmlydGdwdV9kbWFidWZfb3Bz
ID3CoCB7DQo+Pj4+IEBAIC04Myw3ICsxMTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZpcnRp
b19kbWFfYnVmX29wcyB2aXJ0Z3B1X2RtYWJ1Zl9vcHMgPcKgIHsNCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIC52bWFwID0gZHJtX2dlbV9kbWFidWZfdm1hcCwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIC52dW5tYXAgPSBkcm1fZ2VtX2RtYWJ1Zl92dW5tYXAsDQo+Pj4+IMKgwqDCoMKgwqAgfSwN
Cj4+Pj4gLcKgwqDCoCAuZGV2aWNlX2F0dGFjaCA9IGRybV9nZW1fbWFwX2F0dGFjaCwNCj4+Pj4g
K8KgwqDCoCAuZGV2aWNlX2F0dGFjaCA9IHZpcnRncHVfZ2VtX2RldmljZV9hdHRhY2gsDQo+Pj4+
IMKgwqDCoMKgwqAgLmdldF91dWlkID0gdmlydGdwdV92aXJ0aW9fZ2V0X3V1aWQsDQo+Pj4+IMKg
IH07DQo+Pj4+IMKgIC0twqANCj4+Pj4gMi4zNC4xDQo+Pj4+DQo+Pj4gLS3CoA0KPj4+IERhbmll
bCBWZXR0ZXINCj4+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24NCj4+PiBo
dHRwOi8vYmxvZy5mZndsbC5jaA0KPiANCg==
