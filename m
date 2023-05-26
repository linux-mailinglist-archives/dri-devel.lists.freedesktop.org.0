Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C783D711CD7
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 03:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005D010E76A;
	Fri, 26 May 2023 01:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A2910E1A5;
 Fri, 26 May 2023 01:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO3hc5JPffefXIziQN+Ppt1JDhMp7mtejO87ACckPzBvs7dpg4cm0v0VGSoqgMM+gtODvlxY2gnlQA2Ua6ri9nISnKmfRZheBuECXv2a5Aa1SnQvAuK31mQPxrW2YieEvHbS7Lb/PhcZEGciJJqa4IzRu9mkq64uOdysMQ2zkaQr4M4h82qVw9WN6Ib5Suko/5Lf0WhbsRClDo7vnqXKAXs0947NacmCF+PxSmgzI+c6e6gJbWdhFUVSvJfacFslGWR0+LfzkocJX8wiiYrx3r+dkpO6RcNp4O4E0RQoCx/BkATLb38oX/pi8+y9/XlsiX40GOw6PfldFGkfZSS4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywkeIj6G6qZn3rqM5TivJFX7RDtZK1jVIYijpghJsjQ=;
 b=crnglt/G6uMPCGSpBFltVTNSultfpqpQrKJCKYVLyulm1ktD9Nm/rr6K4QCiFYO+Nf3kID8iAPy2lpjPrJo4aLSQ4YePnjdMEqoax3m94TZRZ9VaA33608eEomIakNhLAmGePkf+m7PNCsoJl7I4RljfAQWLuFhAf2k24MiFCou71kO3cFIwGq5KtcHOeAykIsav6+bqI4CuDPrxqT6B4p2iAVPEYWrw9syA7ho4YaZRcAtZL7DNReue+vDAq29g/aLkPgiVpKge5ziuvNfOPSfvYvdjxMSgYYwKTiyv+IdauVKRwbbGTNdi5Civq6a0uD9K8mtpLh3KSu6P3DQlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywkeIj6G6qZn3rqM5TivJFX7RDtZK1jVIYijpghJsjQ=;
 b=1fusZnJEhWORazg2v+TLjWKmdZC3PrcTCqTbo5yabZ8ew2+TjbyOxM9vtWLDXFZm3QDNoHs98XUQZ9mcyNVyH2saWrd25g6fj3NAya2Kwda6qMFm1hwkfvXEeYUl/EWp5PxfJqBcMS32IRSTwKlzQWEKsQRd/zJqJ7o0HD94GWM=
Received: from BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 by SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.28; Fri, 26 May
 2023 01:39:56 +0000
Received: from BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::7ca6:a548:58f8:e0c0]) by BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::7ca6:a548:58f8:e0c0%2]) with mapi id 15.20.6411.028; Fri, 26 May 2023
 01:39:56 +0000
From: "Joshi, Mukul" <Mukul.Joshi@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Tom Rix <trix@redhat.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "nathan@kernel.org" <nathan@kernel.org>, "ndesaulniers@google.com"
 <ndesaulniers@google.com>
Subject: RE: [PATCH] drm/amdkfd: remove unused function
 get_reserved_sdma_queues_bitmap
Thread-Topic: [PATCH] drm/amdkfd: remove unused function
 get_reserved_sdma_queues_bitmap
Thread-Index: AQHZj0WE+ZiuXUCHnUaYsSsQNUt9Dq9rfAeAgABK7kA=
Date: Fri, 26 May 2023 01:39:55 +0000
Message-ID: <BL3PR12MB6425EB9BD716A308D9DA1460EE479@BL3PR12MB6425.namprd12.prod.outlook.com>
References: <20230525200759.3214525-1-trix@redhat.com>
 <af7eab96-fc2b-0bbc-107c-35f83dc46022@amd.com>
In-Reply-To: <af7eab96-fc2b-0bbc-107c-35f83dc46022@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=3f24fb23-4106-4d49-b4ab-c643e907df54;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-26T01:38:19Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6425:EE_|SN7PR12MB6983:EE_
x-ms-office365-filtering-correlation-id: 79f9a21f-8757-4dcd-9986-08db5d8a1bfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PCRCjpKweKlyn6Ae1TTPTavGvzFb0OnBgs54UFhU1rrmNo69sEE9diosAqaiGbTH9kV+K5drE1iLVNSo9aUX4T8CLZy+FbtpeQH1vFUchUN9PxZJDNxsdvjHpGzBxUNyoDdMPk6XpKeBaEAnUUMzqgq9mHCL7+dPGmtCQI7qYV9WXau0EYJKORE7z1m1Rho/PPG33A+y8YPaRLJUkTThB3cj2/ogxFNuF1eRbIC0tvjyh0AjyZIQgGrzPxODk7tdPzNmjlM0EkoL3SO7bYAq4VgaqTYwdaZunXV/trjuHEFWBFTS6dNknW2J/Gad29k5pXXVjkF03rxdaBfPxgfTchlzIgd/Ou44xHk8H1k4dHgLuRGiKQpEisrvIAiuT8o+J+WGQsOkF62UZ1h6YkjGoe5ycs6ZEWVxrSetjPV+TlgECgq0S7152g98Dup+1bAaTLrX0YNh15N37zJimGfSmvfY6UlTCLRVJ3i2ZDm7wZmrMp81CkKVAp5yQumArtc4IBQ0w3A4X8MjKkYVL85FTCJpOTGKN5HuozvKHDmVEwquD0jvfpSvz85N0jVGRRMa33+Vaw8uWud2E8bbBy8tw06SZnwOx12lW1Wr0jUtilLu6gBVuKedfzavpOtdrzOvgYvOLA9lZ7wfC0yvqqyjVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6425.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(83380400001)(110136005)(54906003)(38070700005)(86362001)(478600001)(33656002)(186003)(66946007)(66446008)(66556008)(76116006)(64756008)(66476007)(2906002)(26005)(316002)(71200400001)(6506007)(53546011)(9686003)(7696005)(4326008)(41300700001)(52536014)(5660300002)(8676002)(38100700002)(8936002)(55016003)(122000001)(921005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1FyZ0pKb0dlMUplYXJYdXUwWm95YS8xbVptQm11YVptbkVJaVVTb3ZiMURL?=
 =?utf-8?B?T0VnTFlnRS9EcFU4YVd0ZWtpdG1xSVczMWFqMm52cUxjaDNicDlWZGtoSlRK?=
 =?utf-8?B?OUdOUTlMSEtaL1pVdkhiSlhiRkVNVVJ5TWhvaVNmK1ZKUUIvWGR4ZkdwcUVh?=
 =?utf-8?B?Y1k0SFlvVVpobDI2ejNWbFBOOHhTZHNscVh1V0IrazJ4QXRyeHpvVDZhNzds?=
 =?utf-8?B?dW0yU0ErSTZvRC9MdnhxeDhjWnJBOHlWN1dqWHliR0piS1lrTDhFRlhxREkz?=
 =?utf-8?B?eEtGM2pGYmYxS3BPQktBd0IvS20zYTlSemhZVDZJVmxpK3Rlb2ptQXkycXJl?=
 =?utf-8?B?QTQ0amhmdHFSMVJkZjhaZEQvTGRjTFp5MkZlNTB0SGQ1U0pNZ1J2cnBuOXhr?=
 =?utf-8?B?OFMwWEQyaThyQ0NKdUNkMHo1TWtoVUlTdnYxZWZ2czd0L25lVnozOGdMRm5a?=
 =?utf-8?B?Y1JzSldtbmcyV1ZLcysyVDhKYzNacE5QRWhsOWZ4bHZWUTNyb0tMTTh2SXd2?=
 =?utf-8?B?ZFdUWU9IK3JIY25mNUFEb2ZtK2JzZkYvWUlPTXZ0amJJV2VMMTdVQ1JjZDdI?=
 =?utf-8?B?UGpQbXBaTURZT1Znd2JUUFZoZDlReDcwM1BRMU4xaFB1eUI2WkNPazRWS2Zj?=
 =?utf-8?B?N0x1MW9Zek14TXV4TEVncUNMejJJTGlSTC9FTCtzV2paRVBqQW1BZnY5eFUw?=
 =?utf-8?B?MWY3djFqckZ1Z2JGbVVTaWFMZTRPL0lWeXE2NGN2QjhSekoyZGF3WmZENWU1?=
 =?utf-8?B?MzFScjJxd1kxa00wU3pBd1EyaFVXWVp1Zy90OXdLZm9pQkdoVE4ySW5sMkVx?=
 =?utf-8?B?YllDM1J5aC84ZmQ4YmtDQnRQcEFjNDZIamFMbXlGUi9yeWVIYXE0c1NhUEFF?=
 =?utf-8?B?ekF4eGJXWXZ5M05oWWl1Z1RIR3puSzRScG5QeVZlOFRISmFjVHlOcWhCQ1hh?=
 =?utf-8?B?cElDL21CQ1hvUXpCa0JKWWdlcElQNyswZEhyQUdhTDB4NkdaRWFhQWNEMEVW?=
 =?utf-8?B?eUpxc2lQUllCMGhSaG45Qm1VQzIrUDFub2xRVFpsTkt5ZXVBT3dtSksvZ0Rq?=
 =?utf-8?B?MDdKMTFuU0RJZkEvbFViRzByWms3ZmlIa0FWUTJNd0psUFhyK0p6M3FGeEp5?=
 =?utf-8?B?MFZZWG9LNVRzQjdZRmZ1a0tMRFZXakNVcmM3MG5Bc2lweHo0YlZmTm5MNnI3?=
 =?utf-8?B?SitIQWtzZ0V2VjhyQlhvd2hUOWI4WkxMQ0dkR05zbWtxRmJQUjhyaHduTWhS?=
 =?utf-8?B?UWhvMWdveHo0aVZvOVFDc0htZ1FQZmEyVkFOa1NaZWZ1YXowMXEzbjh6U2g3?=
 =?utf-8?B?bW1kcWxYNmUzU3M2QTR1blJkWm13dUUzSUJxTXdYYzhZQW9HY05sdDhJM2Fz?=
 =?utf-8?B?R1VyaTdPOGZNUXlBL3ZvZkhYbWN3b3l1Tk15U2twNGIvYjlkQUo3Zkh5RmRj?=
 =?utf-8?B?VlBWMnl1T2gyQlQ5SVROS2txcWFPV09xWmtjbkZMK2JXVGVTNkpnOERoaGM2?=
 =?utf-8?B?dG45R3ZSUU44cUJUN04vd2F1UHNCejFSYnlaaEJ4UkJvL0lUTXNVbzFGZHBh?=
 =?utf-8?B?TDhwZytlRXlVOE5QbzhwWENWZVJBUjgzR3ZXalhNMGVuZGtjZ1hkaXk5NkNB?=
 =?utf-8?B?QVdYV2ZneGlOSDNkdjgwbEFrWGRmQ3hPeTFkS2t5Ni9sY2RGRFZvV3QwR2FX?=
 =?utf-8?B?UCtLK3d6OVNacUxDcHJCa2g2ZkFhRFgzbzZSMm5VdDUySWduV3J2VW9TOVMz?=
 =?utf-8?B?YTY4MTVuVHB3Y1ZUcFFsZzRXOWZvU1JOb2Z0Zmw1dnFiSlFaVng0WDdQS2th?=
 =?utf-8?B?NndZeWhyZVJFRUlFMCthR1g0YjFhQUJnMG5odWx4bDllb2toc2hPZ1JsRFFk?=
 =?utf-8?B?STI2dlpIRlcvL3hpanR3TUphS3JRRHIzT1VtakNGVHRsTjBsc3J6bTFrcWFp?=
 =?utf-8?B?aTg1Z0JIWWlXUTZXVndDdG04cWd6cy9neHlBajlJK0E2L1ZMUlJDdlV0YThG?=
 =?utf-8?B?SzR5bFk0OS9oZVJuMUVqUkFCaHRuZlFBTUVwak1pMW5QV0MwbG90bFR4OWZ4?=
 =?utf-8?B?MUY4MEx4ZkhmaWI4THdydWhTejJJZzRZTkZVOTJIRW4yL1RCMUptTWtGaElZ?=
 =?utf-8?Q?Z4es=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6425.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f9a21f-8757-4dcd-9986-08db5d8a1bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 01:39:55.9114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ND+YGjvyT7FE420IGtjJGpS5fJG9k8SMchlh0IQljDHkL4jRNCowt5oMI+AVLCNSMVIYXk5l3QMkuF5HTEF2Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
Pg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDI1LCAyMDIzIDU6MTAgUE0NCj4gVG86IFRvbSBSaXgg
PHRyaXhAcmVkaGF0LmNvbT47IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsNCj4gYWlybGllZEBnbWFpbC5j
b207IGRhbmllbEBmZndsbC5jaDsgbmF0aGFuQGtlcm5lbC5vcmc7DQo+IG5kZXNhdWxuaWVyc0Bn
b29nbGUuY29tOyBKb3NoaSwgTXVrdWwgPE11a3VsLkpvc2hpQGFtZC5jb20+DQo+IENjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxsdm1AbGlzdHMubGludXguZGV2
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IHJlbW92ZSB1bnVzZWQgZnVuY3Rp
b24NCj4gZ2V0X3Jlc2VydmVkX3NkbWFfcXVldWVzX2JpdG1hcA0KPg0KPiBbK011a3VsXQ0KPg0K
PiBMb29rcyBsaWtlIHRoaXMgcHJvYmxlbSB3YXMgaW50cm9kdWNlZCBieSBNdWt1bCdzIHBhdGNo
ICJkcm0vYW1ka2ZkOg0KPiBVcGRhdGUgU0RNQSBxdWV1ZSBtYW5hZ2VtZW50IGZvciBHRlg5LjQu
MyIuIENvdWxkIHRoaXMgYmUgYSBtZXJnZQ0KPiBlcnJvciBiZXR3ZWVuIEdGWCA5LjQuMyBhbmQg
R0ZYMTEgYnJhbmNoZXM/IEkgdGhpbmsgdGhlDQo+IHJlc2VydmVkX3NkbWFfcXVldWVzX2JpdG1h
cCB3YXMgaW50cm9kdWNlZCBhZnRlciB0aGUgOS40LjMgYnJhbmNoIHdhcw0KPiBjcmVhdGVkLiBN
dWt1bCwgeW91IHdvcmtlZCBvbiBib3RoLCBzbyB5b3UncmUgcHJvYmFibHkgaW4gdGhlIGJlc3Qg
cG9zaXRpb24NCj4gdG8gcmVzb2x2ZSB0aGlzLg0KPg0KDQpZZXMgbXkgcGF0Y2ggaW50cm9kdWNl
ZCB0aGlzIHJlZ3Jlc3Npb24uIFdlIG5lZWQgdGhlIGdldF9yZXNlcnZlZF9zZG1hX3F1ZXVlc19i
aXRtYXAgZnVuY3Rpb24uDQpJIHdpbGwgZml4IHRoaXMgcmVncmVzc2lvbiBhbmQgc2VuZCBvdXQg
YSBuZXcgcGF0Y2guDQoNClRoYW5rcyBmb3Igbm90aWNpbmcvY2F0Y2hpbmcgdGhpcy4NCg0KUmVn
YXJkcywNCk11a3VsDQoNCj4gUmVnYXJkcywNCj4gICAgRmVsaXgNCj4NCj4NCj4gT24gMjAyMy0w
NS0yNSAxNjowNywgVG9tIFJpeCB3cm90ZToNCj4gPiBjbGFuZyB3aXRoIFc9MSByZXBvcnRzDQo+
ID4NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5jOjEyDQo+IDI6MjQ6IGVycm9yOg0KPiA+ICAgIHVudXNlZCBmdW5jdGlvbiAn
Z2V0X3Jlc2VydmVkX3NkbWFfcXVldWVzX2JpdG1hcCcNCj4gPiBbLVdlcnJvciwtV3VudXNlZC1m
dW5jdGlvbl0gc3RhdGljIGlubGluZSB1aW50NjRfdA0KPiBnZXRfcmVzZXJ2ZWRfc2RtYV9xdWV1
ZXNfYml0bWFwKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtKQ0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIF4NCj4gPiBUaGlzIGZ1bmN0aW9uIGlzIG5vdCB1c2VkIHNvIHJlbW92
ZSBpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4N
Cj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5jIHwgNSAtLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+ID4gaW5kZXggNDkzYjRiNjZmMTgwLi4yZmJk
MGE5NjQyNGYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiA+IEBAIC0xMTksMTEgKzExOSw2IEBA
IHVuc2lnbmVkIGludCBnZXRfbnVtX3hnbWlfc2RtYV9xdWV1ZXMoc3RydWN0DQo+IGRldmljZV9x
dWV1ZV9tYW5hZ2VyICpkcW0pDQo+ID4gICAgICAgICAgICAgZHFtLT5kZXYtPmtmZC0NCj4gPmRl
dmljZV9pbmZvLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
LXN0YXRpYyBpbmxpbmUgdWludDY0X3QgZ2V0X3Jlc2VydmVkX3NkbWFfcXVldWVzX2JpdG1hcChz
dHJ1Y3QNCj4gPiBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtKSAtew0KPiA+IC0gICByZXR1cm4g
ZHFtLT5kZXYtPmtmZC0NCj4gPmRldmljZV9pbmZvLnJlc2VydmVkX3NkbWFfcXVldWVzX2JpdG1h
cDsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAgIHN0YXRpYyB2b2lkIGluaXRfc2RtYV9iaXRtYXBzKHN0
cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtKQ0KPiA+ICAgew0KPiA+ICAgICBiaXRtYXBf
emVybyhkcW0tPnNkbWFfYml0bWFwLCBLRkRfTUFYX1NETUFfUVVFVUVTKTsNCg==
