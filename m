Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C197845D5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CE610E39B;
	Tue, 22 Aug 2023 15:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDFF10E395;
 Tue, 22 Aug 2023 15:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6NXztC2uOV6f3kyMG3MvKKr54elBrtuOo4wv3q8tf0mfLcc2/dWYhnLgXkAiCNxFDCByEB3iG405AucnYYvc5iGYMLW5f0797Xfn51Ip+PP/z29WehxOBKXZHf+o+iuDiVxsbQwV0Qiq6pNUjgJ+CZ5hg9xFRDKuJ5ZK1baJelqWNFhISgsD04JE62Cmh7+mFELN/LDGubYifhX2KV53tty34I0taKlsjydEM9aCpPbO9AMQ45c44BQCmEdj9meYMEkCKRrnEZ5EBqac+QdsswevMWRc9BaSFZOB6H2Nt3fdlTApp3/xmN5hRa/FfGVNnChgWmRPy9Kh0DRxeZJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg23PenFBJ5p/beSy0KWZlOP4fkfyi/1cRChySQzWWI=;
 b=NTzrrTKsYZr8QHDIzqUOpG4joqXu7EAk82R1fNkhAyRJC/Ayxn5/iaWEaw1Kna1BxbaZ29TkvHZ9PsXubNyiUFR1f1w/tR2RDRFIk+iwzJBh5uOaZllM6xwprMYR9IjXhq9h5pR0ASQTRuEyIDP6/CT4n34KhW7HfE0efTS3epz+PjY+5RcApEiA4/9fPGLv/AwzdMkKkljipx/J8R9dkZb1Kjl98nJqfTcINgYdS77OkUYcsQn4p+Cs6tBSJmKIMXTv90p8qLrGd9Z2jbCzeHBqKWzL9s/KJE/fEL0CsGX49pOgqxGMO2nwwEs0xiMMyZ/nGTGmpOSbrhvU2grk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kg23PenFBJ5p/beSy0KWZlOP4fkfyi/1cRChySQzWWI=;
 b=ww4EDBljz2QhQn4ZMnNNBKR1xEMcozGoSeNGEoX+WeMQ0oS8brHDsJfgblOE4Li56iaCMChHzQHIfRCnI+C79sz3KakqnwXLlHqVuVhZEvXThLnqwdvvMajBj8P6G8zV59kc3cSUZpEwPw0bhLpd7wpVD0SJn2U5DoFUIDkpZmw=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:41:19 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:41:19 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 6.1 09/10] drm/amdkfd: disable IOMMUv2 support for
 KV/CZ
Thread-Topic: [PATCH AUTOSEL 6.1 09/10] drm/amdkfd: disable IOMMUv2 support
 for KV/CZ
Thread-Index: AQHZ1Oz2+wy6Gdtu70y7L20taCUADa/2dBCw
Date: Tue, 22 Aug 2023 15:41:19 +0000
Message-ID: <BN9PR12MB51462073F648B388F388B617F71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113628.3551393-1-sashal@kernel.org>
 <20230822113628.3551393-9-sashal@kernel.org>
In-Reply-To: <20230822113628.3551393-9-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=7028ee93-80a8-43dd-9032-e2ef91ffee6f;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:40:26Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|LV3PR12MB9188:EE_
x-ms-office365-filtering-correlation-id: 758e9407-f8bc-48ef-10e5-08dba3263aaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +f3yW9pwD2vp3O5A27QHO9VZpKX6qTZpikjEPU7bjUsNGSX/StjfuOF1lvnmKsy6IoD03//CjxrfMzPf5As3CkZy1CTL56yjyA9FkUo+5nJvM2ZSSeZ8TpHBCWDEMEkeaJJbH1cjz0Ptwwq3u9b/kzNfGojVkdzK7pWAxIk+Q9um+LwTaD1UDTgzuGhUIsXpXSkht+LCyy/rFFcOpn6EgxkDAzDRmHu3D7v9R5EhUFTS5gjyq6NqlHMbDm9V3EsuCrEiQxgDrX807yG0u6TmNCwx6rxiZ7s2u5qmGkRYTwvkqx65a9m9k0QXMiS3txvQ4yQNmvsRJYeVqM1YoAJh9R0a4A0CkHLFTCIqaePxqZJYPOXoeEPUYLb8Kqb0hvqOgGtwWtaxdoPtj+5OZ5D9sNU/bBW1yvbGOYgh+NqpqLHeBo6f/i00OgnUp5dtKwvkce+WK8SX85JMj9WH0+XQuD/jH2D5VgMvQ2oaRh6+Wu1Hta9cScLh9Ab6vhVJ5oHrLnr7nAA8gCNww2unBg36vL17XMLI5UlmtPKDVp3+RRmo00sDJ2LZsPcJbcC1ZNzP8MEdatvLmt+KXNvKWDgTjvEr9MuSnVdvpG0lXXUdFm4KV2q091ITUrOhtrF0svfc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66446008)(54906003)(66476007)(64756008)(66556008)(76116006)(316002)(9686003)(110136005)(8676002)(4326008)(8936002)(41300700001)(122000001)(478600001)(55016003)(71200400001)(66946007)(38100700002)(53546011)(6506007)(66574015)(2906002)(83380400001)(86362001)(7696005)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZS9QRU5ETXBldm1JMjdpRDFKclZucTg1YnB0S1A2OGI4bTZpZ2Y4bTNXTC9G?=
 =?utf-8?B?eldmQmxJQUl2RTV0S0RxUTVwRVdMOXc2N3VER2Jicm9POWtNTDRQOUZaY3dZ?=
 =?utf-8?B?Vi8wbmdGUXg4TCtJNmN0TmJ3VFFMbGJWeWdjdkJRNzkyTytWTFBRNGtuUnFM?=
 =?utf-8?B?Vzd1ZjgzWVc4QXJoRWFRTHQxTk1uTi81QWpaRmZTbXNUMWw4QTFKSWs1cTU4?=
 =?utf-8?B?amxJaGNvVVlMV2phMUc2NjJ4emE3ZlhFMjhKR3hzaG16a0JNajc1Rm1ZRlZT?=
 =?utf-8?B?alFNZlI3cHNudXN5bk5yY2N6VWlnb3ZCdFNQRnV5OVpST0ZEVGlYd0NhbU0x?=
 =?utf-8?B?UEdza1YwM241MHc2eTdGWitidmZzbmtHWlVOSzdFSjE1VW5rb2hMUkhsaStz?=
 =?utf-8?B?NGkxMCtNU0lBK0I1V216K3JyNWx3OGZHeTk3Q1g4S2ZrMGJCRHdkRjdDSEJ3?=
 =?utf-8?B?OTEzMENJRnNGRVFJeG84MmRHNFZCbjByUkV4Rm9DZ3RLVVJpRW1Db1ZTU3NP?=
 =?utf-8?B?VXprRTlsUGQ3NlpaSXM5Ynk3YmN3SnlzMnJWbE1udzZpM0JTREtJQVpwZ1dP?=
 =?utf-8?B?U2N3cXFRNzM2SEIrcjBnWmd0L0drTzlhTXVKV2JuRjIzMjdCclVtanVLdm5k?=
 =?utf-8?B?R1FyK1hJNTg0LzdRNVlhQVJ1WFExL0w4TnFXTU5scUJaOHlvM2Ixdk0xcitU?=
 =?utf-8?B?ZVZEeFVqQ2hwK2NZVk9aN2haVXFrOTRxb1Mxd1BUWCt4bHQ0ZHQ5eXRBUGI0?=
 =?utf-8?B?TXhJOHVCS3g2SjNIV1k5ZDh6R1ZWcXRpZlZ0K25EenFvVnVvK2ZwL1ErQjY2?=
 =?utf-8?B?SHhJMzd0c21SdjBDS3VGL3BCQTRVTWs2TjdCTjVNbVFQWk5PTFM1VExFb3BB?=
 =?utf-8?B?OGEzL0VEVTRYbkFpbHBUaXhzenYwV0luak9iaVM3bTJud1djUksvb012YkJV?=
 =?utf-8?B?UXRVQjQ0TkJzRWlZb2Ixb1JxTFN4QlVsRTZiblAxN3krQS9XTHR1UFdkeHZM?=
 =?utf-8?B?T0JxcDhTVy90L09XZjBJU2lIUGdpT0JvbVYyODFhbGE2dFNtWUZ0U1hJS0lv?=
 =?utf-8?B?a3ErS2c3Ky9tNXRVZXRCd3BsK0JIdHc5dlpLNk4xWjc0bzVnQTlYOXZjWkI0?=
 =?utf-8?B?cFBjL1BkWmlWRmVkb0RFS2V1cDRRZDVhNUplWWFIaGx5RHpUWGpqUnVVVDdv?=
 =?utf-8?B?eGcwVVBUd2JHeGMzT1JzMGNvdmlVSmxvcERWcEo0blNCRzRJSllSU3V0UFho?=
 =?utf-8?B?MDRJVVZ4TnZmcGYwUG1mKzdxQTRpN1VaTUFCTThyTDNNR2VSUDZ3TllqSXJ0?=
 =?utf-8?B?VFRqS2NOYzg3ZlFKaEt2M2x3VENDZFM3WmVHSllwUVdIaldNV3VQZXBpV3NR?=
 =?utf-8?B?YkhrVnBENXZxMnhLVUtrTmVEeFJQWVdkYjVlWGtoT2xxSHZrbDFab3AxNmh5?=
 =?utf-8?B?MTVxMWJZSzFSSTFMUE9lSzAyOUpkN2Y2K25jd1hPYUVXMkV5V3BvWFhib2I5?=
 =?utf-8?B?WkcrOEJRcWxkcGo1L2FlWVJHTE16cElyU1FsdW8zRE80Ty9SVW9iSk5LRk1G?=
 =?utf-8?B?RjdvRFB1OXB1ZGduNk5pbjlSbFdQVG90UGo0RlBKQVBwMFovUkpyOTFXeUVY?=
 =?utf-8?B?VTlZY0VwN2ZxWEJvdGE5YlRTWU4yRnlVazBsRmJkMVlzckJDbGF0Yk9VN2N2?=
 =?utf-8?B?K2VFdkxVOFptTkNBdTVmeXNqOGV4eGsvd1dNRTl0eXk4SU9TRmltR1ltSHNy?=
 =?utf-8?B?VWdCWTAxbnNWanVLdGg3MDNXUGtUeVlrRFdtMS9CUEdRUXFSMkxObFVyTGZC?=
 =?utf-8?B?c2I1V1d6V0VrRXNFTmczcjl3THREdGxUMFdWeVBJa1Q3RGZNUDBKTG43R0FN?=
 =?utf-8?B?VHBkMmdxV2tIMVozSkZlVkRESEZGc0ZVVDRkL0dBdEVSS1oyVkppcW1DQVc2?=
 =?utf-8?B?blYwdlRrTGVyanBHVFk0bFo4TGxuMk1DTkVDQWw3a0xxM092eVgxcWVCRzBV?=
 =?utf-8?B?QmJQYm96Y1ZvbmpsTVo2dnBuYzhNMXBFREJBZmhjUUhpbWRESkM0SXUwa084?=
 =?utf-8?B?TXpHbVlIOFdqVUVlZ2FRMm1ab28wVThUQk9sRzZlbml4VTkxTFFLMW5YbVlP?=
 =?utf-8?Q?bW58=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758e9407-f8bc-48ef-10e5-08dba3263aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:41:19.1248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCL4J2F5wq4+QRlNj+BEYXGrmAughSkL/R8LDvM8MNTzE3dmuWUdU52cUn4o3h7CXmLfFoepvOEeRZVeCGdtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMiwgMjAy
MyA3OjM2IEFNDQo+IFRvOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsNCj4gTWlrZSBMb3Ro
aWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPjsgU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PjsgUGFuLA0KPiBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGFpcmxpZWRAZ21haWwuY29t
OyBkYW5pZWxAZmZ3bGwuY2g7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggQVVUT1NFTCA2
LjEgMDkvMTBdIGRybS9hbWRrZmQ6IGRpc2FibGUgSU9NTVV2Mg0KPiBzdXBwb3J0IGZvciBLVi9D
Wg0KPg0KPiBGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
DQo+IFsgVXBzdHJlYW0gY29tbWl0IDYxNmY5MmQxODhlZTcxNDJhOTVhNTIwNjhlZmRiZWE4MjY0
NWY4NTkgXQ0KPg0KPiBVc2UgdGhlIGRHUFUgcGF0aCBpbnN0ZWFkLiAgVGhlcmUgd2VyZSBhIGxv
dCBvZiBwbGF0Zm9ybSBpc3N1ZXMgd2l0aCBJT01NVQ0KPiBpbiBnZW5lcmFsIG9uIHRoZXNlIGNo
aXBzIGR1ZSB0byB3aW5kb3dzIG5vdCBlbmFibGluZyBJT01NVSBhdCB0aGUgdGltZS4NCj4gVGhl
IGRHUFUgcGF0aCBoYXMgYmVlbiB1c2VkIGZvciBhIGxvbmcgdGltZSB3aXRoIG5ld2VyIEFQVXMg
YW5kIHdvcmtzDQo+IGZpbmUuICBUaGlzIGFsc28gcGF2ZXMgdGhlIHdheSB0byBzaW1wbGlmeSB0
aGUgZHJpdmVyIHNpZ25pZmljYW50bHkuDQoNClRoaXMgaXMgbm90IG5lZWRlZCBmb3Igc3RhYmxl
Lg0KDQpBbGV4DQoNCj4NCj4gdjI6IHVzZSB0aGUgZEdQVSBxdWV1ZSBtYW5hZ2VyIGZ1bmN0aW9u
cw0KPg0KPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+DQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQo+IFRlc3RlZC1ieTogTWlrZSBMb3RoaWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPg0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgICAgICAgICAgICAgICB8
IDYgLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVl
X21hbmFnZXIuYyB8IDggKy0tLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jDQo+IGluZGV4IDI3ODIwZjBhMjgyZDEuLjRjYzVkZWJkZDExOWIgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gQEAgLTIxNiwxMCArMjE2
LDYgQEAgc3RhdGljIHZvaWQga2ZkX2RldmljZV9pbmZvX2luaXQoc3RydWN0IGtmZF9kZXYgKmtm
ZCwNCj4gICAgICAgICAgICAgICAgICAgYXNpY190eXBlICE9IENISVBfVE9OR0EpDQo+ICAgICAg
ICAgICAgICAgICAgICAgICBrZmQtPmRldmljZV9pbmZvLnN1cHBvcnRzX2N3c3IgPSB0cnVlOw0K
Pg0KPiAtICAgICAgICAgICAgIGlmIChhc2ljX3R5cGUgPT0gQ0hJUF9LQVZFUkkgfHwNCj4gLSAg
ICAgICAgICAgICAgICAgYXNpY190eXBlID09IENISVBfQ0FSUklaTykNCj4gLSAgICAgICAgICAg
ICAgICAgICAgIGtmZC0+ZGV2aWNlX2luZm8ubmVlZHNfaW9tbXVfZGV2aWNlID0gdHJ1ZTsNCj4g
LQ0KPiAgICAgICAgICAgICAgIGlmIChhc2ljX3R5cGUgIT0gQ0hJUF9IQVdBSUkgJiYgIXZmKQ0K
PiAgICAgICAgICAgICAgICAgICAgICAga2ZkLT5kZXZpY2VfaW5mby5uZWVkc19wY2lfYXRvbWlj
cyA9IHRydWU7DQo+ICAgICAgIH0NCj4gQEAgLTIzMyw3ICsyMjksNiBAQCBzdHJ1Y3Qga2ZkX2Rl
diAqa2dkMmtmZF9wcm9iZShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCB2ZikN
Cj4gICAgICAgdWludDMyX3QgZ2Z4X3RhcmdldF92ZXJzaW9uID0gMDsNCj4NCj4gICAgICAgc3dp
dGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCj4gLSNpZmRlZiBLRkRfU1VQUE9SVF9JT01NVV9WMg0K
PiAgI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX0NJSw0KPiAgICAgICBjYXNlIENISVBfS0FWRVJJ
Og0KPiAgICAgICAgICAgICAgIGdmeF90YXJnZXRfdmVyc2lvbiA9IDcwMDAwOw0KPiBAQCAtMjQ2
LDcgKzI0MSw2IEBAIHN0cnVjdCBrZmRfZGV2ICprZ2Qya2ZkX3Byb2JlKHN0cnVjdA0KPiBhbWRn
cHVfZGV2aWNlICphZGV2LCBib29sIHZmKQ0KPiAgICAgICAgICAgICAgIGlmICghdmYpDQo+ICAg
ICAgICAgICAgICAgICAgICAgICBmMmcgPSAmZ2Z4X3Y4X2tmZDJrZ2Q7DQo+ICAgICAgICAgICAg
ICAgYnJlYWs7DQo+IC0jZW5kaWYNCj4gICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9DSUsNCj4g
ICAgICAgY2FzZSBDSElQX0hBV0FJSToNCj4gICAgICAgICAgICAgICBnZnhfdGFyZ2V0X3ZlcnNp
b24gPSA3MDAwMTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gaW5kZXggYzA2YWRhMDg0NGJhMS4uNTYxNmE3
MjI1NzhmNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gQEAgLTIzMzUsMTggKzIzMzUsMTIgQEAgc3Ry
dWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyDQo+ICpkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0KHN0
cnVjdCBrZmRfZGV2ICpkZXYpDQo+ICAgICAgIH0NCj4NCj4gICAgICAgc3dpdGNoIChkZXYtPmFk
ZXYtPmFzaWNfdHlwZSkgew0KPiAtICAgICBjYXNlIENISVBfQ0FSUklaTzoNCj4gLSAgICAgICAg
ICAgICBkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0X3ZpKCZkcW0tPmFzaWNfb3BzKTsNCj4gLSAg
ICAgICAgICAgICBicmVhazsNCj4gLQ0KPiAgICAgICBjYXNlIENISVBfS0FWRVJJOg0KPiAtICAg
ICAgICAgICAgIGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXRfY2lrKCZkcW0tPmFzaWNfb3BzKTsN
Cj4gLSAgICAgICAgICAgICBicmVhazsNCj4gLQ0KPiAgICAgICBjYXNlIENISVBfSEFXQUlJOg0K
PiAgICAgICAgICAgICAgIGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXRfY2lrX2hhd2FpaSgmZHFt
LT5hc2ljX29wcyk7DQo+ICAgICAgICAgICAgICAgYnJlYWs7DQo+DQo+ICsgICAgIGNhc2UgQ0hJ
UF9DQVJSSVpPOg0KPiAgICAgICBjYXNlIENISVBfVE9OR0E6DQo+ICAgICAgIGNhc2UgQ0hJUF9G
SUpJOg0KPiAgICAgICBjYXNlIENISVBfUE9MQVJJUzEwOg0KPiAtLQ0KPiAyLjQwLjENCg0K
