Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841E590612
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 19:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC3B11B72E;
	Thu, 11 Aug 2022 17:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2C1112C96;
 Thu, 11 Aug 2022 17:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsSvrl/VONi9vv8vceP+wJQoy8/KwRnuGSbXFG6FLU7/oZtVPliKgue1wocNtOl06Rc4GXNr7vuumOZ7HrvNtEe/85UY5y3Uktn9D7bJZqGNdmhgOCOgpdCIG/UlcinJ76k0PiY1HRwQWAad7wZ/MbfNU1BkpKZBAB/OwH5JGa/wcgv8nlTDIgU/BPlt1MMJlgVmrtzNI6Op6Ouf7+NqhHGlmdvRDz448cYbC8iKGPSMw9d5qVUHox9q9jV13psyVilXqwPO+uUKk7JPbyVtMkkb83Ghsu1BJ5Opo3oY9ClfxdmMfuC3VzJcdbF3OXofArPixU4FPizBP4NHQY1DTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD7B9OM6LYzZlxMVB/LeG3PuvzAbiWA7tIBKUbHhEt8=;
 b=EQ1L5hhSfbKchFIDtnsiYwrUYNCZcxwIMiiIVzl7t+HHZDXQBBeaEPv7GslUTbHVV6bzcfatvK+PXhRTV/3i/T8gNJ8f1gPFM0YJjr40w3xUMc56o13nvqUsMTyp2nRguLFjx7EnQQmzL8amKj27fHJiBYlSEzerJdjVC8erSCgvyrLcRCskdy9N5OND1raJfQI/c0dHY0znS+Eso8yLXDW5/tASzSibQzZ0Tc2PDBCFD7KBjvyMiJQ/aEeTpNSY2Djx/YTws/PZaP9tRD2AzNJnlLTB9Qa2oork1LhuC4XJOIuGLmphRXBHnjDaLurnKQQjFb5RQrY3UFq3dKpT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD7B9OM6LYzZlxMVB/LeG3PuvzAbiWA7tIBKUbHhEt8=;
 b=tAenpvHUToZZBkKFDPfhMpWdK7+0RT14DZiMSt6voccmqDAx04njd3s27A0hRj++Odl3zYF+5wzza8HQHJQm0xuz2JgiCf3BoILx2HQo5SBAAdShLMeep65zI/XDHUXThDz/cf6vBUzZOiP41znDbZt1j/Um4GFXyiyMGPbESok=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH0PR12MB5315.namprd12.prod.outlook.com (2603:10b6:610:d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 17:43:26 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2428:2f57:b85c:757f%7]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 17:43:26 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, =?utf-8?B?Sm91bmkgSMO2Z2FuZGVy?=
 <jouni.hogander@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/3] drm/amdgpu_dm: Rely on split out luminance
 calculation function
Thread-Topic: [PATCH v3 2/3] drm/amdgpu_dm: Rely on split out luminance
 calculation function
Thread-Index: AQHYm1X9BUZc1kmlxU20/Sin4bi0kq2emcMAgAuC3FA=
Date: Thu, 11 Aug 2022 17:43:26 +0000
Message-ID: <BL1PR12MB5144D129C543A4FAD451FFF1F7649@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220719095700.14923-1-jouni.hogander@intel.com>
 <20220719095700.14923-3-jouni.hogander@intel.com> <877d3opc4d.fsf@intel.com>
In-Reply-To: <877d3opc4d.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-08-11T17:43:22Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=ba535539-785f-4274-b312-f66cc0e26ee2;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-08-11T17:43:24Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 136ce476-45c5-4523-b562-969ad8f47070
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4d1a3d7-65a7-4d29-6c43-08da7bc0fe94
x-ms-traffictypediagnostic: CH0PR12MB5315:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYZl/hXj0buADwuoJiZ/Aaa3LHfXVQl/VuGK3b7wqbmZO04ANWiLexl6GRlJ1k0nkuRRFMavYTsvsDUMcgnNsUG7WtozrPy+jd5L+zqeamuWMvdrxl0IJryS6xVDIFRuLZO187DdYDDcubhkBBKH7w5IosRuihZdM3FZRK1/txJ0gR8Um+drMZQV1kT6mLl5L7yzzq2W2ejwONYWTdZ/SvBLPOaoeODBwjZs/09uww2BHKjQJs3f+iaglm3eHTiMJA5th5Dpbregb8UBvp23MnVXn8Z0JZtkcD9uUEuA4n1WSJu6uobLuaSYsZbOsIwqy4tNgM5r7XKoxdgODHDIJGXhbsUWlwk76HMDNQVz1MPMDHT2N8vAMwNTAwfKs8TMfZvc4riR8QwmVmLXBs9XKWeba2bEDPpbyfD2u9jDYC6TFbekciQcM8YEFRHMCH/cJg/bX3mV1zna5Dp5ZN+oBH+mkHAWMBZKi9oJMss9WNjIMIKEKYfoCfKOCUol7i1wFleLB9D2ZB/6+jU1jIik2V5kPpL/9DYWVOZi2G11NUseinVMAU/YMDO50L9+RfsYlWRwNAV6b0FS5Bgcg87lUj8Q/x5aQ19gvDWnrXo2WBR6pDwM+fKywm+ARPESEVpWBZHu/SvYKEoeZEFF+8izAf0M0ZaG0WBInv0joBFxPrFL6N5A4oT13EqbMo99DIjv+T4WxfttGGnie9lquhX1qkCOLLyGVEsHe67tBqJQYwlOTURTusu5IMKbbGwnLu30yX66SshMNUr6pNo4SkjAVW8F4RybAUawCoEzdHneyjs8nwPBo62xOonp4QS2MSPo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(110136005)(54906003)(5660300002)(52536014)(41300700001)(76116006)(316002)(4326008)(7696005)(86362001)(33656002)(66476007)(6506007)(53546011)(2906002)(64756008)(8936002)(66946007)(66446008)(66556008)(9686003)(8676002)(26005)(83380400001)(186003)(66574015)(71200400001)(478600001)(55016003)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejFrVURISDFJUmswQmc3T3hoWHA1aGxvUlRBNkZtcFNlSElGaDBqaG1YODZP?=
 =?utf-8?B?OXFGTlBBKy8ybmM4MnY5TGJzazNka01hM3JnbnpvV2JBWFVBbFdYUjE2T3Uy?=
 =?utf-8?B?OXVxZGF4OXQrWDkrNzZFTEtPL09NYUQ5N2RMc2lFMEtaVGRqb3ZNbUVjZWF4?=
 =?utf-8?B?RmhRVEdZV2pSMW9iNzk5TFRLbTFtMi9QTzNsVVlTa245QWtqeTU5RFJYZXRp?=
 =?utf-8?B?OWFyK0YvYjZMS3Ridkx2bkZrM3cvNHQxSjQrRnluWnRQandrRDN2VHI5VXZU?=
 =?utf-8?B?OU5lejNydWlHM3NMaVhYQnIwTk1pUmNqWmtSNllWRHlLU3NRSXdwUEY4aWwr?=
 =?utf-8?B?WVNaNVJyN1NVb2grdGZFVk1XbkhMSmdBcWlpMGVta1hwMTYvbUxYeU5VRFp2?=
 =?utf-8?B?NU1SZHhRUkNLUVFIckNEYWpoNlI4Nm5NeWJiNHNCQXBBRXJaN09aSExtck04?=
 =?utf-8?B?RXI2QnZiTHdPRjZia0Y3TzRPZEZTYTZ5czB2di9RdktMWkJqb1pPNDl3ZDYx?=
 =?utf-8?B?ZW1jOUtBYzYybHRnTkxMRkxXekk0SUFhd3NNRnN2WWFTZFRGaGdhOFRXS0R3?=
 =?utf-8?B?eUVUbXh1cG5KdVd1SXdhQzVsQXppL21sdmZ0elRhUW1Ja21wVlVBNXBRT3Zp?=
 =?utf-8?B?UTJIU3paRzh0YXpZTnBrQis3MFpUMWhlZmd3cTk0UTY5T3pRNGp1ZEtBakpI?=
 =?utf-8?B?WW9hWWFYSTUrWTBGU013TVFaUCswVVR4azVOUVNGTzVQMUpyZmM4M3RweVl5?=
 =?utf-8?B?TlFMbGE5S2REOHUzWTdOelhoTGcvZm5aMEhJZlV4eG1RQnF2clRMdG1Rb0RH?=
 =?utf-8?B?MmRqMUVobkViaG0rNVVmTk9xNWV4SXNkTW9OVHFmdm1vc2xBUTA4b2YwQzBt?=
 =?utf-8?B?amdvQ1h2Q3djOXR6YVFhcnN3eUhDQ3RUWVV1TGV3aGltM3lVK1RmbVgwOEZw?=
 =?utf-8?B?czBhNTZzT0JEdzRxd01STklKU1pjeUdQYjM5YmdDanQvM2NWYXlYUFBQQVVx?=
 =?utf-8?B?YXppWXJ6NGFnQ3RSSWNXeXRKYzkyOC9TVFZ5Q1JDU0pkakkyVWd1cDNRZ0Ix?=
 =?utf-8?B?dUFScEZRRmZlSG5rb1dVemlDWHFWNGJwRkpIQXU4a1YxaEEyR3pwZTgxS2xa?=
 =?utf-8?B?ODY2WTUrMk1FVHJLdWp1UXhEOGh6SW9zbnl0empyWmlyNUdmVDhpaDdVeWtK?=
 =?utf-8?B?YjhwYXZveE9yNlkvcTBOUVk0VThNTXhESlFtUGQxVWVZR3ZRbDltWkJPcjhT?=
 =?utf-8?B?VkYxMDFhWUtaVWVjZ3Y1Z2Via1FFbXQzYWwzSWhjcjhMZmJ5Z0RwUTM3ME5L?=
 =?utf-8?B?aEhWM2dLT3NuSDZXd0lTbGZ1ejAyblEraituZlJ0ckM5SUhaQWhvRUFIQ21w?=
 =?utf-8?B?N2U2OWRYWjNhRWVSNWVMcW5EZEdUdyszaHZQRUpGanc3aEl3aGxSeEE0eFIr?=
 =?utf-8?B?WC9ya0VDY2F3SzNkaUFqZUZaL09Id2dLZDY3bHZ0NVNPV3dGd1hJMklyalpo?=
 =?utf-8?B?cGZ1NG50dHdwSGZySWpwcnBkUzg5VDZqVDUydE9CN1hWVjBJUzAwOTZPYlhq?=
 =?utf-8?B?c2tzZUFSSkNHTnp2aE84NmxTVDFOeUZjLzhnWFZQa1hrUStGSWJoUUZia09C?=
 =?utf-8?B?NHVmSVcrdWc1MXhKejYrQUJpWEFaL2hiR3ZsaUExZlV3K0hyTTJPeHQ0emxE?=
 =?utf-8?B?SEZ0aDd6U3BjYTlRSWI3ZjkyRENVRTNtM3RmckdBRzZac1dpMURmcnNTb056?=
 =?utf-8?B?ZlhHQzF5ZGRORDg2dTVEK2V3eU5jWnY3Znc5aUM0SkRkdTRFd3Y2b0hSRm9v?=
 =?utf-8?B?b2daMXJOWTE5czFkWVhSUFFoRXNFSVJIZlpJM0lzUXVJelRCZmkwblM5bnZY?=
 =?utf-8?B?Sm95U3ZoVERlRDJQTnloQ0Q3NitmaW94MC81WnpacTdYclB4a1RGRmFUaVlP?=
 =?utf-8?B?RGFnWW5HT3ZXaUpSc3dUQWF2OGtGdzRuSHBCeC8zK0RTSXJ4dXZYcFdzT3lm?=
 =?utf-8?B?THFtamhjVmZ0cC9MLzN3VDFLYyt1d283QW4xdHVibkdLZHY0a1BmbDBycngw?=
 =?utf-8?B?cmd4YUphYklEUER6M1pIOEowNWVKNXNLVGIwL2drbFNPM05SNURVVGVaZVV5?=
 =?utf-8?Q?zJ26xhN4gRjBKb4efmt4olDYO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d1a3d7-65a7-4d29-6c43-08da7bc0fe94
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 17:43:26.0798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KIu4kTgkV7orWz878wX1suLONepQDS9MypRZeKvJnPuxEcE4+pclGiH3Ny4ZHT4l4eVNKjCFMCMGMK16MUhIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5315
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Li,
 Roman" <Roman.Li@amd.com>, Manasi Navare <manasi.d.navare@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?utf-8?B?Sm91bmkgSMO2Z2FuZGVy?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFu
aQ0KPiBOaWt1bGENCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCA0LCAyMDIyIDU6NTUgQU0NCj4g
VG86IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPjsgZHJpLQ0KPiBk
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogU2lxdWVpcmEsIFJv
ZHJpZ28gPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT47IExpLCBSb21hbg0KPiA8Um9tYW4uTGlA
YW1kLmNvbT47IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+OyBNaWth
DQo+IEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPjsgSm91bmkgSMO2Z2FuZGVyDQo+IDxq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+OyBXZW50bGFuZCwgSGFycnkNCj4gPEhhcnJ5LldlbnRs
YW5kQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8zXSBkcm0vYW1kZ3B1X2Rt
OiBSZWx5IG9uIHNwbGl0IG91dCBsdW1pbmFuY2UNCj4gY2FsY3VsYXRpb24gZnVuY3Rpb24NCj4g
DQo+IE9uIFR1ZSwgMTkgSnVsIDIwMjIsIEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPiB3cm90ZToNCj4gPiBMdW1pbmFuY2UgcmFuZ2UgY2FsY3VsYXRpb24gd2FzIHNw
bGl0IG91dCBpbnRvIGRybV9lZGlkLmMgYW5kIGlzIG5vdw0KPiA+IHBhcnQgb2YgZWRpZCBwYXJz
aW5nLiBSZWx5IG9uIHZhbHVlcyBjYWxjdWxhdGVkIGR1cmluZyBlZGlkIHBhcnNpbmcNCj4gPiBh
bmQgdXNlIHRoZXNlIGZvciBjYXBzLT5hdXhfbWF4X2lucHV0X3NpZ25hbCBhbmQgY2Fwcy0NCj4g
PmF1eF9taW5faW5wdXRfc2lnbmFsLg0KPiANCj4gSGFycnksIEknbGwgbWVyZ2UgcGF0Y2hlcyAx
ICYgMyBpbiB0aGlzIHNlcmllcyB0aHJvdWdoIGRybS1taXNjLW5leHQsIGJlY2F1c2UgSQ0KPiB0
aGluayB0aGV5J3JlIGdvb2QgdG8gZ28sIGFuZCBmaXggc3R1ZmYgaW4gaTkxNS4NCj4gDQo+IENh
biBJIGdldCB5b3VyIHJiL2FjayB0byBtZXJnZSB0aGlzIHBhdGNoIGFzIHdlbGwsIG9yIGRvIHlv
dSB3YW50IHRvIHRha2UgdGhpcw0KPiBsYXRlciB2aWEgeW91ciB0cmVlPw0KDQpZb3UgY2FuIHRh
a2UgdGhpcyB2aWEgZHJtLW1pc2MuDQpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPg0KDQoNCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiANCj4gDQo+ID4NCj4g
PiB2MjogVXNlIHZhbHVlcyBjYWxjdWxhdGVkIGR1cmluZyBlZGlkIHBhcnNpbmcNCj4gPg0KPiA+
IENjOiBSb21hbiBMaSA8cm9tYW4ubGlAYW1kLmNvbT4NCj4gPiBDYzogUm9kcmlnbyBTaXF1ZWly
YSA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPg0KPiA+IENjOiBIYXJyeSBXZW50bGFuZCA8aGFy
cnkud2VudGxhbmRAYW1kLmNvbT4NCj4gPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4NCj4gPiBDYzogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCj4gPiBDYzog
SmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiBDYzogTWFuYXNpIE5hdmFy
ZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBI
w7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMzUNCj4gPiArKystLS0t
LS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMxIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gPiBpbmRleCAzZTgzZmVkNTQwZTguLmViN2Fi
ZGViODY1MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiA+IEBAIC0yOTAzLDE1ICsyOTAzLDEyIEBAIHN0YXRp
YyBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5jcw0KPiA+IGFtZGdwdV9kbV9tb2Rl
X2NvbmZpZ19oZWxwZXJmdW5jcyA9IHsNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCB1cGRhdGVfY29u
bmVjdG9yX2V4dF9jYXBzKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yDQo+ID4gKmFjb25uZWN0
b3IpICB7DQo+ID4gLQl1MzIgbWF4X2F2ZywgbWluX2NsbCwgbWF4LCBtaW4sIHEsIHI7DQo+ID4g
IAlzdHJ1Y3QgYW1kZ3B1X2RtX2JhY2tsaWdodF9jYXBzICpjYXBzOw0KPiA+ICAJc3RydWN0IGFt
ZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtOw0KPiA+ICAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5fYmFzZTsNCj4gPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2Ow0KPiA+ICAJc3RydWN0
IGRjX2xpbmsgKmxpbmsgPSBOVUxMOw0KPiA+IC0Jc3RhdGljIGNvbnN0IHU4IHByZV9jb21wdXRl
ZF92YWx1ZXNbXSA9IHsNCj4gPiAtCQk1MCwgNTEsIDUyLCA1MywgNTUsIDU2LCA1NywgNTgsIDU5
LCA2MSwgNjIsIDYzLCA2NSwgNjYsIDY4LCA2OSwNCj4gPiAtCQk3MSwgNzIsIDc0LCA3NSwgNzcs
IDc5LCA4MSwgODIsIDg0LCA4NiwgODgsIDkwLCA5MiwgOTQsIDk2LCA5OH07DQo+ID4gKwlzdHJ1
Y3QgZHJtX2x1bWluYW5jZV9yYW5nZV9pbmZvICpsdW1pbmFuY2VfcmFuZ2U7DQo+ID4gIAlpbnQg
aTsNCj4gPg0KPiA+ICAJaWYgKCFhY29ubmVjdG9yIHx8ICFhY29ubmVjdG9yLT5kY19saW5rKSBA
QCAtMjkzMyw4ICsyOTMwLDYgQEANCj4gPiBzdGF0aWMgdm9pZCB1cGRhdGVfY29ubmVjdG9yX2V4
dF9jYXBzKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yDQo+ICphY29ubmVjdG9yKQ0KPiA+ICAJ
Y2FwcyA9ICZkbS0+YmFja2xpZ2h0X2NhcHNbaV07DQo+ID4gIAljYXBzLT5leHRfY2FwcyA9ICZh
Y29ubmVjdG9yLT5kY19saW5rLT5kcGNkX3NpbmtfZXh0X2NhcHM7DQo+ID4gIAljYXBzLT5hdXhf
c3VwcG9ydCA9IGZhbHNlOw0KPiA+IC0JbWF4X2F2ZyA9IGNvbm5fYmFzZS0+aGRyX3NpbmtfbWV0
YWRhdGEuaGRtaV90eXBlMS5tYXhfZmFsbDsNCj4gPiAtCW1pbl9jbGwgPSBjb25uX2Jhc2UtPmhk
cl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEubWluX2NsbDsNCj4gPg0KPiA+ICAJaWYgKGNhcHMt
PmV4dF9jYXBzLT5iaXRzLm9sZWQgPT0gMSAvKnx8DQo+ID4gIAkgICAgY2Fwcy0+ZXh0X2NhcHMt
PmJpdHMuc2RyX2F1eF9iYWNrbGlnaHRfY29udHJvbCA9PSAxIHx8IEBADQo+ID4gLTI5NDYsMzEg
KzI5NDEsOSBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfY29ubmVjdG9yX2V4dF9jYXBzKHN0cnVjdA0K
PiBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yKQ0KPiA+ICAJZWxzZSBpZiAoYW1kZ3B1
X2JhY2tsaWdodCA9PSAxKQ0KPiA+ICAJCWNhcHMtPmF1eF9zdXBwb3J0ID0gdHJ1ZTsNCj4gPg0K
PiA+IC0JLyogRnJvbSB0aGUgc3BlY2lmaWNhdGlvbiAoQ1RBLTg2MS1HKSwgZm9yIGNhbGN1bGF0
aW5nIHRoZSBtYXhpbXVtDQo+ID4gLQkgKiBsdW1pbmFuY2Ugd2UgbmVlZCB0byB1c2U6DQo+ID4g
LQkgKglMdW1pbmFuY2UgPSA1MCoyKiooQ1YvMzIpDQo+ID4gLQkgKiBXaGVyZSBDViBpcyBhIG9u
ZS1ieXRlIHZhbHVlLg0KPiA+IC0JICogRm9yIGNhbGN1bGF0aW5nIHRoaXMgZXhwcmVzc2lvbiB3
ZSBtYXkgbmVlZCBmbG9hdCBwb2ludCBwcmVjaXNpb247DQo+ID4gLQkgKiB0byBhdm9pZCB0aGlz
IGNvbXBsZXhpdHkgbGV2ZWwsIHdlIHRha2UgYWR2YW50YWdlIHRoYXQgQ1YgaXMgZGl2aWRlZA0K
PiA+IC0JICogYnkgYSBjb25zdGFudC4gRnJvbSB0aGUgRXVjbGlkcyBkaXZpc2lvbiBhbGdvcml0
aG0sIHdlIGtub3cgdGhhdA0KPiBDVg0KPiA+IC0JICogY2FuIGJlIHdyaXR0ZW4gYXM6IENWID0g
MzIqcSArIHIuIE5leHQsIHdlIHJlcGxhY2UgQ1YgaW4gdGhlDQo+ID4gLQkgKiBMdW1pbmFuY2Ug
ZXhwcmVzc2lvbiBhbmQgZ2V0IDUwKigyKipxKSooMioqKHIvMzIpKSwgaGVuY2Ugd2UNCj4ganVz
dA0KPiA+IC0JICogbmVlZCB0byBwcmUtY29tcHV0ZSB0aGUgdmFsdWUgb2Ygci8zMi4gRm9yIHBy
ZS1jb21wdXRpbmcgdGhlDQo+IHZhbHVlcw0KPiA+IC0JICogV2UganVzdCB1c2VkIHRoZSBmb2xs
b3dpbmcgUnVieSBsaW5lOg0KPiA+IC0JICoJKDAuLi4zMikuZWFjaCB7fGN2fCBwdXRzICg1MCoy
KiooY3YvMzIuMCkpLnJvdW5kfQ0KPiA+IC0JICogVGhlIHJlc3VsdHMgb2YgdGhlIGFib3ZlIGV4
cHJlc3Npb25zIGNhbiBiZSB2ZXJpZmllZCBhdA0KPiA+IC0JICogcHJlX2NvbXB1dGVkX3ZhbHVl
cy4NCj4gPiAtCSAqLw0KPiA+IC0JcSA9IG1heF9hdmcgPj4gNTsNCj4gPiAtCXIgPSBtYXhfYXZn
ICUgMzI7DQo+ID4gLQltYXggPSAoMSA8PCBxKSAqIHByZV9jb21wdXRlZF92YWx1ZXNbcl07DQo+
ID4gLQ0KPiA+IC0JLy8gbWluIGx1bWluYW5jZTogbWF4THVtICogKENWLzI1NSleMiAvIDEwMA0K
PiA+IC0JcSA9IERJVl9ST1VORF9DTE9TRVNUKG1pbl9jbGwsIDI1NSk7DQo+ID4gLQltaW4gPSBt
YXggKiBESVZfUk9VTkRfQ0xPU0VTVCgocSAqIHEpLCAxMDApOw0KPiA+IC0NCj4gPiAtCWNhcHMt
PmF1eF9tYXhfaW5wdXRfc2lnbmFsID0gbWF4Ow0KPiA+IC0JY2Fwcy0+YXV4X21pbl9pbnB1dF9z
aWduYWwgPSBtaW47DQo+ID4gKwlsdW1pbmFuY2VfcmFuZ2UgPSAmY29ubl9iYXNlLT5kaXNwbGF5
X2luZm8ubHVtaW5hbmNlX3JhbmdlOw0KPiA+ICsJY2Fwcy0+YXV4X21pbl9pbnB1dF9zaWduYWwg
PSBsdW1pbmFuY2VfcmFuZ2UtPm1pbl9sdW1pbmFuY2U7DQo+ID4gKwljYXBzLT5hdXhfbWF4X2lu
cHV0X3NpZ25hbCA9IGx1bWluYW5jZV9yYW5nZS0+bWF4X2x1bWluYW5jZTsNCj4gPiAgfQ0KPiA+
DQo+ID4gIHZvaWQgYW1kZ3B1X2RtX3VwZGF0ZV9jb25uZWN0b3JfYWZ0ZXJfZGV0ZWN0KA0KPiAN
Cj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcg0K
