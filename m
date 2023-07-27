Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1937648A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0113210E4F0;
	Thu, 27 Jul 2023 07:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CD510E4F0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCPWSsczGyexg+4N3NFdU0hBTx0HXKKppV69xs4LdMvRWAHvkHj9lG8iZybmhdpGxZ8gTCr8JFGscScf9b/az+nrNilMb8yCaK+tyyjCqlJ2jiPN1ikJiLOkuQeE/VhgQNamFPGQm6OhLBOEhtUEQCJjXCcQM+fLTo+8pY0ciA5ujZ6LOl14akkdzSjofIKUPyebqdFb1vw+pUOaZ/0SY4GtQXXk17JLBFLSYCLT4v/UPQMNqO4/+8WE7QnCNXCntBJp0dLcsGAyEPudISA6EiH6eL9unFSxnkpULWIIa/Cb8HL547V54MiyCyenZHDgJhDKdcmU8/TfjpJM5vho7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLk8pCwF6Pq3JseraZNPpx6fPLKLTFPfxfLUSINZMlI=;
 b=oawWpT1dcgfkiZPdj9CrMBS1mllGWUYQaN7PXjAvCEdqdo1TfYxGnDFv5hY3+MGGhKdmFVno1xq3yePB8mjL9/v0Nl/EWjqTwCvUXXtpensr2eGjl1SfUD5eszAzzv1wHQGhKPivqY+T2stVVjefu/3SN6p2Xb9+eNEidMVx0N3xlSTjhnef7DD+AjQeYltwUUA5BdKWa3BDz/phn0BqX+qIRAC+TNrxF+XZF3uRaBYJQBoS6Xp8TDcsZvn/iB06sqY+b5Y4kwVtWsiEBhUOV8kWhGGBELRCkuKur6WhI9xcSOutm392AFpt+S9OoY068eIpOsxdS9240UMlojMGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLk8pCwF6Pq3JseraZNPpx6fPLKLTFPfxfLUSINZMlI=;
 b=lUUr2o18p8eV3ThmZetbKt0iALXBgreem+Rt3Q25mPHMNErr+fmVrpE40lN/5rEUepEFc2J5+slFqMkByXmx6B0etP+Fx2eiWnKri2dIW/IC+SlLN5l50Auou5cxegKoe4XJEqiEbIKoGWnqlz3Wint93HBJ8wM9Y+2aFxnB6yY=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 BY5PR12MB4935.namprd12.prod.outlook.com (2603:10b6:a03:1d9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Thu, 27 Jul 2023 07:33:04 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::72dd:353e:4775:1225]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::72dd:353e:4775:1225%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:33:03 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [PATCH] drm/ttm: check null pointer before accessing when swapping
Thread-Topic: [PATCH] drm/ttm: check null pointer before accessing when
 swapping
Thread-Index: AQHZvdiQzR671zMMyEWQLlY6WXQdz6/I6+CAgARQNACAAADewA==
Date: Thu, 27 Jul 2023 07:33:02 +0000
Message-ID: <DM5PR12MB2469A467CC44134886BD6F9EF101A@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230724024229.1118444-1-guchun.chen@amd.com>
 <CADnq5_Pfwyen7W6v9-MoT_S=owcRHbu-+TbwJ2KTN-iHcbEY5w@mail.gmail.com>
 <f401e8b1-d2c1-9837-7a0f-35fd9a4ac64d@amd.com>
In-Reply-To: <f401e8b1-d2c1-9837-7a0f-35fd9a4ac64d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=9178fd87-56ad-4d2d-adb4-2c37c5f3a36e;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-07-27T07:31:16Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|BY5PR12MB4935:EE_
x-ms-office365-filtering-correlation-id: 82c37eb1-d6af-40f0-15b8-08db8e73b61e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kXL2HGRGp49nhtpnr62b7QL5HQUcymhQTNA5ulJJ8YXti9Jd4X7JaGtEwg6H83Te84VeWOPqwPgPMHQ1emF/u1ANjPStmvkDcR1AcWIGDcR2wTBmFP+fJvhZMDeY916V8/IsvSa89xQ2kpSlxF9roeT7cxsceGU/Zp94/5+Wlc3P6bDZBnr2Vt1ZdPXzkCRVYeXvkYKg3nRbmbcvU0X5FrTBAxL1ktj/lmROvFLLBVe0bXXY/YC6rgygtDqDAKeyzJDEMTVbCWQjjoBvDAeTdCPY6XBgKWxRkvdeZ+G9vZD7BASW1w+ttXy91X3e1IfEAWV31bJTbHGXqsBSqjAg191v3x9qHsy3BRKjkicOcEfj8GDUSW3zbkzcVnON0GiUMeiYBsEbsXPuAwQ7p5NEPAILUjcswA86eGaFtIqVHbk28mArK/sF0tw7hDgUXyPBioBFbKrxt/phACEourn0//pnsJIXfzEJnS/BoP8HDVhNe+HyImauCEIGyJcJMorPbkfNB51eH2SDt2Vrd72lAYgvT1S8GOekJjRisv/nM8orb2xeht+CnTPYwfAfKLa+nn16kg6i0GZ4VLajc7keijJZ+a0OK8KlbcK1PSYx7SGNoXmk6PjGxUNLJj+Gbj1u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(54906003)(110136005)(7696005)(9686003)(478600001)(83380400001)(55016003)(33656002)(86362001)(38070700005)(66446008)(2906002)(66556008)(71200400001)(53546011)(66574015)(66476007)(6506007)(186003)(26005)(66946007)(64756008)(122000001)(38100700002)(76116006)(4326008)(316002)(41300700001)(52536014)(8936002)(5660300002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTRENlp3QVN6ZjdvRGJsWEJQMU5RNTNyYkFCRmFFdmNMOCtrbFMybmM1bnBl?=
 =?utf-8?B?WnhrZU0zOG5QWCt1L2ZEdURtck90SFZxZFhOcENBcExoME52bTRjZlRSeitN?=
 =?utf-8?B?VURSNFY2dHRFK1ljd05IOTUzejYzRnVXcGRucmhCUUdHTDIwY0JzT3ljZEVE?=
 =?utf-8?B?aGZNcnhMc3YxcmJpVGdrczZuT2w4N1VvRXpucUZ0ajQ1SEJtTmJiUXN0VThp?=
 =?utf-8?B?Ynk3dUtsT3cwVEF0Y3Fqc3hGQVRsWXZCTmRoa3Z2eUcwZVoyV2NKS2RjY2xU?=
 =?utf-8?B?V29Ra0I0TnFydmRUZzFvcXVNT1dEVmR0czdlSUVVMXpGcEpUaG45NDFZd0lx?=
 =?utf-8?B?VEZadDJ0UjJKZ0RXU1Rvb3R5WVEyd0o5U2JkQzdUblRvdmF3WkdNQklzeXU4?=
 =?utf-8?B?N0JYb3VvZFQ0MHU0RTVVaTIveTZTSHUzL0grdkZJV2RoMlVkNXo1UjB3TzF3?=
 =?utf-8?B?aWQyaFB6UFA5LzRPeXB1dXdXYjM3ZFZ1OEZEenJZUGROemt4YzV1Wll5MTYw?=
 =?utf-8?B?Yjc3UjlZcU1lYXJoZU1McU83ZmdWNkVHTG5COGVKaFUxMVpzSFU2ZDVNTzNN?=
 =?utf-8?B?T1diMkRCWm1xcTRrcERyQXZXTzZ3MThqc1huNGdUTklJR0hkWFhxU0JUOGlP?=
 =?utf-8?B?bDZIVU0vQksycldlNHpCOFBOVVNTTHMwdU91N1RtWGJ4U2VBMkpQaFZuSWYw?=
 =?utf-8?B?am41R2pBYW83RlptblcvMktGcmlpM2p2R3hJREJMa2QrZExOYisvendtSmgv?=
 =?utf-8?B?ZmFrOXRQVEpSajRtRkV1YmtqYUVCbUJSWXRUL2ptQ2t0UDZvY1FFdDAvd3dh?=
 =?utf-8?B?eGhVUGVvaFZaMG5ZaUVQbEFRTTQ5Wm1sOWo5aGYwaWhPOTZSSG9VQnZyMW94?=
 =?utf-8?B?Z1cyeDN4bmo5T1o0VWozQ3JBTWVkNHU4RXFnUmlGSGNmbDlUM3J4YVZIUTVY?=
 =?utf-8?B?eEZ5U0RrUllOdG45SENiMXVjcDhnZG5xck5mNjF3bjUzWERIaXFmK0o5SHFR?=
 =?utf-8?B?ZTdvR21QeWc1VllxYysvWDZ4US9nazF1Qmw5aisrNG9HOFFSVkQzTk8xOUVy?=
 =?utf-8?B?Q09pTkZUemlYSlhKbmFWSGhaaGVEQWZLSGdKaE9xK1hsc3pvMVlLQ3k3d0Iv?=
 =?utf-8?B?S2N0bGJzZ09OVmQzdUxpdWtSRGFzYjRJdHliOUR1dVRqU045eUJyVW5Xenk0?=
 =?utf-8?B?WjZ5SzFINzJJa09ISzJmeEpaU29zdXhUK3E2THRCUllsYUN3VDRqQTBKbnBZ?=
 =?utf-8?B?czFLUXg4QWs1ekhSaG5uT3NCUGdNa1BTSTFjZnpLdk1UaGJvdVIxTiswVXYz?=
 =?utf-8?B?ZmptYWUyT3Azcy85d1ZTYTZxbklQK3JhRVg3elhKY0ZSMlRzSTdKenU2YzJx?=
 =?utf-8?B?anFTMXY1NTFUb2FaMUI4TnhZaFRoR2xUV1dGcDB2aCsrcFMzS3Bua2phMlRn?=
 =?utf-8?B?Wm9DRWFERVBWTzhNR25NdC9sK3Zzbk5HR3RtSThhRWN4aGcxTUdDU2ZxYWF5?=
 =?utf-8?B?UFA4OWtBWko5ZTc2cWRDUHJnRDJYeXlDNVAvNlNJR0M0TlljYzhwVWEwaS9N?=
 =?utf-8?B?VGVFMHlibHh0cFNUdm1RaGd0Qm5yZDFzcEwxTkEvZE5ZZFVKeU85NVFDWXo5?=
 =?utf-8?B?ODhRd3hHM0g5NWFSa0RhZVB1THRIVFQrUXExVEUxSHZJVkFaa01RZUVpTEtF?=
 =?utf-8?B?Z3g5bVFoZjhIdUJUMHBnZHkzamRnd3NxVjVQOHg2amZDdFk3NGV5VjdrTHRF?=
 =?utf-8?B?K00xU2YvUUJyai9IT1pGN05FM3pFcHBuc1ZkQzdSeHE0d1lGc0xjSjFHL0ZY?=
 =?utf-8?B?b1ZJeldnK3Q0NnB6SWhTS09yUmFwMW9tdUI1a2NYQ1kvcVE5cUtub3dRdGlU?=
 =?utf-8?B?b1F3U2ZxMDZPWWNGZEtTS3BjOFc0VXh4YmlOOHNEZUxrTFUyU1QxTFhQbTht?=
 =?utf-8?B?VXR6Y1RZbHFadUE0eUw4Yk1paFpQUUVhV3RIamhRZXpjakRKVjRFcFJJcCtm?=
 =?utf-8?B?VnVNditRTUlkR1BPMjdaY2pubkV1QmJqSVFyNjk1RDFTaVJXSDBmTkU2MEJY?=
 =?utf-8?B?Z1NVVWk4OUEwSWpvbGo1eWp0eVlvM1R5ZzBEMnFUM1gxZ3h0MkVCazdGV0Z6?=
 =?utf-8?Q?qJhs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c37eb1-d6af-40f0-15b8-08db8e73b61e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 07:33:03.0281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xGS3EJxYUpT0HNPqi065ooelARBPRMoS+dtqxYl9JTArqD0uWHyjmRHGwwv5u6YD66u6g7uyMLa/m+eH0bg4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4935
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcs
IENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
SnVseSAyNywgMjAyMyAzOjI4IFBNDQo+IFRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT47IENoZW4sIEd1Y2h1bg0KPiA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NCj4gQ2M6IERl
dWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IGFpcmxpZWRAZ21h
aWwuY29tOw0KPiBkYW5pZWxAZmZ3bGwuY2g7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IE1pa2hhaWwgR2F2cmlsb3YNCj4gPG1pa2hhaWwudi5nYXZyaWxvdkBnbWFpbC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IGNoZWNrIG51bGwgcG9pbnRlciBiZWZvcmUg
YWNjZXNzaW5nIHdoZW4NCj4gc3dhcHBpbmcNCj4NCj4gQW0gMjQuMDcuMjMgdW0gMTU6MzYgc2No
cmllYiBBbGV4IERldWNoZXI6DQo+ID4gT24gU3VuLCBKdWwgMjMsIDIwMjMgYXQgMTA6NDPigK9Q
TSBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4NCj4gd3JvdGU6DQo+ID4+IEFkZCBh
IGNoZWNrIHRvIGF2b2lkIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBhcyBiZWxvdzoNCj4gPj4N
Cj4gPj4gWyAgIDkwLjAwMjI4M10gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBm
b3Igbm9uLWNhbm9uaWNhbA0KPiA+PiBhZGRyZXNzIDB4ZGZmZmZjMDAwMDAwMDAwMDogMDAwMCBb
IzFdIFBSRUVNUFQgU01QIEtBU0FOIE5PUFRJDQo+ID4+IFsgICA5MC4wMDIyOTJdIEtBU0FOOiBu
dWxsLXB0ci1kZXJlZiBpbiByYW5nZQ0KPiA+PiBbMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAw
MDAwMDAwMDAwN10NCj4gPj4gWyAgIDkwLjAwMjM0Nl0gID8gZXhjX2dlbmVyYWxfcHJvdGVjdGlv
bisweDE1OS8weDI0MA0KPiA+PiBbICAgOTAuMDAyMzUyXSAgPyBhc21fZXhjX2dlbmVyYWxfcHJv
dGVjdGlvbisweDI2LzB4MzANCj4gPj4gWyAgIDkwLjAwMjM1N10gID8gdHRtX2JvX2V2aWN0X3N3
YXBvdXRfYWxsb3dhYmxlKzB4MzIyLzB4NWUwIFt0dG1dDQo+ID4+IFsgICA5MC4wMDIzNjVdICA/
IHR0bV9ib19ldmljdF9zd2Fwb3V0X2FsbG93YWJsZSsweDQyZS8weDVlMCBbdHRtXQ0KPiA+PiBb
ICAgOTAuMDAyMzczXSAgdHRtX2JvX3N3YXBvdXQrMHgxMzQvMHg3ZjAgW3R0bV0NCj4gPj4gWyAg
IDkwLjAwMjM4M10gID8gX19wZnhfdHRtX2JvX3N3YXBvdXQrMHgxMC8weDEwIFt0dG1dDQo+ID4+
IFsgICA5MC4wMDIzOTFdICA/IGxvY2tfYWNxdWlyZSsweDQ0ZC8weDRmMA0KPiA+PiBbICAgOTAu
MDAyMzk4XSAgPyB0dG1fZGV2aWNlX3N3YXBvdXQrMHhhNS8weDI2MCBbdHRtXQ0KPiA+PiBbICAg
OTAuMDAyNDEyXSAgPyBsb2NrX2FjcXVpcmVkKzB4MzU1LzB4YTAwDQo+ID4+IFsgICA5MC4wMDI0
MTZdICA/IGRvX3Jhd19zcGluX3RyeWxvY2srMHhiNi8weDE5MA0KPiA+PiBbICAgOTAuMDAyNDIx
XSAgPyBfX3BmeF9sb2NrX2FjcXVpcmVkKzB4MTAvMHgxMA0KPiA+PiBbICAgOTAuMDAyNDI2XSAg
PyB0dG1fZ2xvYmFsX3N3YXBvdXQrMHgyNS8weDIxMCBbdHRtXQ0KPiA+PiBbICAgOTAuMDAyNDQy
XSAgdHRtX2RldmljZV9zd2Fwb3V0KzB4MTk4LzB4MjYwIFt0dG1dDQo+ID4+IFsgICA5MC4wMDI0
NTZdICA/IF9fcGZ4X3R0bV9kZXZpY2Vfc3dhcG91dCsweDEwLzB4MTAgW3R0bV0NCj4gPj4gWyAg
IDkwLjAwMjQ3Ml0gIHR0bV9nbG9iYWxfc3dhcG91dCsweDc1LzB4MjEwIFt0dG1dDQo+ID4+IFsg
ICA5MC4wMDI0ODZdICB0dG1fdHRfcG9wdWxhdGUrMHgxODcvMHgzZjAgW3R0bV0NCj4gPj4gWyAg
IDkwLjAwMjUwMV0gIHR0bV9ib19oYW5kbGVfbW92ZV9tZW0rMHg0MzcvMHg1OTAgW3R0bV0NCj4g
Pj4gWyAgIDkwLjAwMjUxN10gIHR0bV9ib192YWxpZGF0ZSsweDI3NS8weDQzMCBbdHRtXQ0KPiA+
PiBbICAgOTAuMDAyNTMwXSAgPyBfX3BmeF90dG1fYm9fdmFsaWRhdGUrMHgxMC8weDEwIFt0dG1d
DQo+ID4+IFsgICA5MC4wMDI1NDRdICA/IGthc2FuX3NhdmVfc3RhY2srMHgzMy8weDYwDQo+ID4+
IFsgICA5MC4wMDI1NTBdICA/IGthc2FuX3NldF90cmFjaysweDI1LzB4MzANCj4gPj4gWyAgIDkw
LjAwMjU1NF0gID8gX19rYXNhbl9rbWFsbG9jKzB4OGYvMHhhMA0KPiA+PiBbICAgOTAuMDAyNTU4
XSAgPyBhbWRncHVfZ3R0X21ncl9uZXcrMHg4MS8weDQyMCBbYW1kZ3B1XQ0KPiA+PiBbICAgOTAu
MDAzMDIzXSAgPyB0dG1fcmVzb3VyY2VfYWxsb2MrMHhmNi8weDIyMCBbdHRtXQ0KPiA+PiBbICAg
OTAuMDAzMDM4XSAgYW1kZ3B1X2JvX3Bpbl9yZXN0cmljdGVkKzB4MmRkLzB4OGIwIFthbWRncHVd
DQo+ID4+IFsgICA5MC4wMDMyMTBdICA/IF9feDY0X3N5c19pb2N0bCsweDEzMS8weDFhMA0KPiA+
PiBbICAgOTAuMDAzMjEwXSAgPyBkb19zeXNjYWxsXzY0KzB4NjAvMHg5MA0KPiA+Pg0KPiA+PiBG
aXhlczogYTI4NDhkMDg3NDJjICgiZHJtL3R0bTogbmV2ZXIgY29uc2lkZXIgcGlubmVkIEJPcyBm
b3INCj4gPj4gZXZpY3Rpb24mc3dhcCIpDQo+ID4+IFRlc3RlZC1ieTogTWlraGFpbCBHYXZyaWxv
diA8bWlraGFpbC52LmdhdnJpbG92QGdtYWlsLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogR3Vj
aHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4NCj4gUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4NCj4gSGFzIHRoaXMgYWxy
ZWFkeSBiZWVuIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0Pw0KPg0KPiBUaGFua3MsDQo+IENocmlz
dGlhbi4NCg0KTm90IHlldCwgQ2hyaXN0aWFuLCBhcyBJIGRvbid0IGhhdmUgcHVzaCBwZXJtaXNz
aW9uLiBJIHNhdyB5b3Ugd2VyZSBvbiB2YWNhdGlvbiwgc28gSSB3b3VsZCBleHBlY3QgdG8gcGlu
ZyB5b3UgdG8gcHVzaCBhZnRlciB5b3UgYXJlIGJhY2sgd2l0aCBmdWxsIHJlY2hhcmdlLg0KDQpS
ZWdhcmRzLA0KR3VjaHVuDQoNCj4gPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIHwgMyArKy0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBpbmRl
eCA3MTM5YTUyMmIyZjMuLjU0ZTMwODMwNzZiNw0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jDQo+ID4+IEBAIC01MTksNyArNTE5LDggQEAgc3RhdGljIGJvb2wNCj4gdHRtX2Jv
X2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKHN0cnVjdA0KPiA+PiB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sDQo+ID4+DQo+ID4+ICAgICAgICAgIGlmIChiby0+cGluX2NvdW50KSB7DQo+ID4+ICAgICAg
ICAgICAgICAgICAgKmxvY2tlZCA9IGZhbHNlOw0KPiA+PiAtICAgICAgICAgICAgICAgKmJ1c3kg
PSBmYWxzZTsNCj4gPj4gKyAgICAgICAgICAgICAgIGlmIChidXN5KQ0KPiA+PiArICAgICAgICAg
ICAgICAgICAgICAgICAqYnVzeSA9IGZhbHNlOw0KPiA+PiAgICAgICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsNCj4gPj4gICAgICAgICAgfQ0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAyLjI1LjENCj4g
Pj4NCg0K
