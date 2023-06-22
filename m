Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D9573A36F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0A310E575;
	Thu, 22 Jun 2023 14:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6C710E575
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEgsxjpnC8KeTW/nm/u8xHOQUApZuIPfVunTKhbXXG0K7TJt1/v+m65EBXqwp7gAGhcPlkNZsnGPiUjytSLVI7AY9bS6fhz1uPvAetEZ1VN//4KeKyGtxdcCFFo6xw4EcJyKW6NYawu9Xno1Gy9vtxLmXft40l9xn0/n4BV0DAMSb+REbh3NpYvsS/YjP32K5aHTZqv1K5KZLjEoqU1K4Yj4sa1CY1NvauGfR+vRjWGWVjoXiILRNpQANVOPLNHrdShD9AuzUFqAgB3QvcUrV7HAYEuqbg7l5LOc438DjL5ie+ai9xo9wo0B25VFeo7vSUtZ0WKPY4PMOgD8p0FLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aseU0DHgEyhwW5DqW4lRvrCgFROe5xJYNOb2Yvz5ifE=;
 b=JQlymjnziExHrNcRqEz24A/mi6qoVHqxdTo/U1ClBDfpbPR2ttyP5ahOKmnTeNeE/7c9o9FuG6tR4jiTesjy2Kf9XfASagtOTjmmfxSWWt893sw8ljoWVlNMALhPVMLQD64vG386pgOFywGzVk+g136tpbz5FxNT78f/2Zmnas09D2ntD2h3TcwhwhxSinfCsLmAjrfg9bSHRE1G258pqqLtPRRIXVWBNfrPssbvTmEJJt/WHdPt0yKvonApftS3iOKNcrE6NHKEq/7s/wwrmDIPrWYl37nKnm7TcVKeC0jsG+eO5ZHWGdIrR4gMof6H6ROROxpujeIcepqTpT2DuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aseU0DHgEyhwW5DqW4lRvrCgFROe5xJYNOb2Yvz5ifE=;
 b=NuoqcFhotQiaTwlSfPR81+CsnIR1DUKiatvFlZfUFQ/yzH/4qzizGV6yyrD475/XnsxKGCxzyVr6+dj/JWrfgyLIL6A7jFVCUIXxJHYq1v46JkUNFCc8rBfTkxhQL8gxa4P+kBBLjgFZBuhieTjQIl9W2XVLFujrBePR/jTcW38=
Received: from BL0PR12MB2532.namprd12.prod.outlook.com (2603:10b6:207:4a::20)
 by CH0PR12MB5385.namprd12.prod.outlook.com (2603:10b6:610:d4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:44:59 +0000
Received: from BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::81dd:ae36:d1e2:9a4]) by BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::81dd:ae36:d1e2:9a4%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 14:44:59 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: fix missing fence reserve in
 amdgpu_vm_sdma_commit
Thread-Topic: [PATCH 1/2] drm/amdgpu: fix missing fence reserve in
 amdgpu_vm_sdma_commit
Thread-Index: AQHZpF0/k5itoKtVsUu/oAnSec3mna+WcJiAgABsYBCAAAl2cA==
Date: Thu, 22 Jun 2023 14:44:59 +0000
Message-ID: <BL0PR12MB2532D1FAA32843C5D22D4AE9ED22A@BL0PR12MB2532.namprd12.prod.outlook.com>
References: <20230621162652.10875-1-Yunxiang.Li@amd.com>
 <20230621162652.10875-2-Yunxiang.Li@amd.com>
 <1c71ea03-af46-18eb-0698-9a1c771671c6@amd.com>
 <BL0PR12MB2532A14726F4BF29714B3571ED22A@BL0PR12MB2532.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB2532A14726F4BF29714B3571ED22A@BL0PR12MB2532.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=8517d1eb-d235-4f58-af79-1b4ac61ea131;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-22T14:07:31Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR12MB2532:EE_|CH0PR12MB5385:EE_
x-ms-office365-filtering-correlation-id: bcbe8853-7fe1-4eff-cca4-08db732f40f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KC5gwhaa7CN38296iY/URiqeIxCo15kahyuofzz2ehVQednYS6OQXkS2+YoApFvxA5lsJ5sz33JB3EVdjXnf9hoRryi6oVSOP3YWin3Rw1Pnk9SC4Cqr9uZ+7ujsF8ni3N4ygHJlAR0ooaYu3BNFumKVLFmyd8BOXosJQTpLBFJQaEkNNUzFxAdzOH9WNzqtdSl+lTzmng0RQ5b93xIQfcj64hsJ7BxXR4bsO8wOXB+V6LEOe48nVoz+z67A18ykjMUhTVdACZ1Kwt1E0WEby6XkwshWDZKLPRMtAzXb+W9lb8ZHhuMGkvGS7OLwQT3DNYrfli/Qh9ClweKvIHD0OMF/SlrDFTlmxYITDFrVGGMM67hqL27QsLrb2kp6PIZcoFfdIEbrw6iVmlrywx6P/DExGdJ2Xhkn6DUWhinmfugbmgljFW43ig/md4s9Ge1LGGT2UkqVhu4LsNUnLNjErkCyfY1D+7l1x58B4klAzsQGQKj86t50wTiDei19PFB4Uih8EYs0DFRaJLm2WBNRbixVO/OmFJ4Nf6L1xbABd9ZY0EnMUTOqiLWOCHcmJZ4c/2PqdozjpxX7Ye09ipzNiRVm/RZZ0h1IDQtZpQpUFSXtojym3tOaeu8sNl4Mccu7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(6636002)(66556008)(66476007)(66446008)(64756008)(316002)(66946007)(76116006)(122000001)(2940100002)(71200400001)(83380400001)(6506007)(52536014)(53546011)(86362001)(2906002)(7696005)(5660300002)(41300700001)(9686003)(55016003)(186003)(26005)(8936002)(33656002)(8676002)(110136005)(478600001)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGV5WVdmZCtzdS8yTWR1OW95bXhqTUhCcmhQaG1LcWdZT0ZsQkVPa3RwVkx5?=
 =?utf-8?B?YW8zRmdvaDVoTzdHZjhBQkZuc0p5YVZGWlN6Tkx5MWVXL0pjM2laZksyV3lW?=
 =?utf-8?B?VisrYmlObnRTcXRxdTJOMHFxZVM0U20xT01NZzNVUFBKeDlvM2hWYVhLdFRQ?=
 =?utf-8?B?cG8xY0xpekhJdVJEQnR1UEM3aGdsOU5SV2dJOWI0aTd3YXQxYWQ0OFJjSEM3?=
 =?utf-8?B?aTlQZm10ZFlzZnB1M0RlSTlFRkdDZStLSG10RGQySmpoZHVzTXNWcGlPQnVX?=
 =?utf-8?B?dHpjMVBobGlpVlhzeDZKdExxT3hIc2F0SGdnOTZCeGtmdC93MGtVN2l1RHJM?=
 =?utf-8?B?NTZpNHZBYWk3ZVBVZWhKeGk3VThpdkQzREVja1ZyZmpJMWdtc0FXUGdNR1JS?=
 =?utf-8?B?Mmx5ZWFiKzBYVDM4WndRMS8ycUdaalAvbit2Y2VuMFloT1JlcjlpN1ZlanNt?=
 =?utf-8?B?Ui9iUjJLamlRaTI2bjJyTHEyNVpaWW5XVFhwYUc4R05wMGpwRGhSV3prTUJH?=
 =?utf-8?B?TEJSd3I5NkNRUFErRkROSXlSNlZ4bnhndDNNbGtvOWtQOVh5bnFoS25MZHNL?=
 =?utf-8?B?R3NYVFlacUNiZDE5QVRhVG9FbjAreitUcmNYMmo1QjJuakppTjRBbTlteU1R?=
 =?utf-8?B?NHkwdFJha29rUTVNc1dURExYdXdzd1I0ZVRWUEFOdEUwN0txVkc3RzhWVWRa?=
 =?utf-8?B?WGpFVER2TGhGMDV4Q3E3ZnpDRmhWY0I0UzY2SkhaMGZicDErNnZ3b0FaTDJw?=
 =?utf-8?B?NHBjZ0k0UjVOTVk4RlY1Y0x0NkE5cWovbE9ycVMrZWRpRnRGT09tSHM1dkpp?=
 =?utf-8?B?R0htU2pKRkFBQTgyRExtVlhtUlZMMldiS01OOGYrRXhQMU56bnJLMVlsVjJP?=
 =?utf-8?B?T0t5NXF5ckRkdTlPL2FaVG1ZSGpHOXlpUklyMzZ5UE16N1hBaTczeHd0L2NZ?=
 =?utf-8?B?WkpvNENuWUNQN2RWQ29ldWQ5VTduMllLSlVpb0gzU2lnNnhITmg3NGNoVzdP?=
 =?utf-8?B?ZkU0NERPZE5lNkkvOWhDcEcvTE9SaUI3blhtUW9DTjY4MkFzWWt0c1l1NlZK?=
 =?utf-8?B?K0hkRkltYm9PdXVTLzNVcHl0bXdXbmRpcFErTFB5aVdQUmh4SnJXWWcvVlI4?=
 =?utf-8?B?OS9GM1JWWU02RGQ2UzA3TTdLSXNudWJTL1JEeWUwVEg5YTE1YTBiU2didmFo?=
 =?utf-8?B?U0VhV0w4bkJwM05LZkJ2ajIzM1czaEVOZU1Nc1lPV0R2U0NCTFhMVVJrTWVQ?=
 =?utf-8?B?cEluYnpkYmgwWVN3N0ZKUXdXdGZJcERqZDJvSDY1c0tuWHBOeDJrVG9xWVd5?=
 =?utf-8?B?V0ljZy9zRWx3SWVXNEQwMUt0aStPdnJLZUNqSVEyRXdIb1Z0QStIWHhKNXI1?=
 =?utf-8?B?WnYxcnZvWlRuaXR3TEFtbCtjNEpkeTRJcXZkOVo2dG9pRHU3QnlwRmh3VXda?=
 =?utf-8?B?NStVYUFodDF3MU9zWEJIaTI3VFZKSFdPbnQ0blNGYlhjWTBBNHVhNEtNYk5J?=
 =?utf-8?B?am52eDYwTDN2aU0vTFJoaGtWenl6OWhYRHlaQXJhUG85SnczOGxYUVFPMnh6?=
 =?utf-8?B?cmpRVlZmWXlYRnpyTWhtd1RaQXA1RkxYeTZLS2FTY0phemZwRnVITkFIR01S?=
 =?utf-8?B?MkZod0lWa3psNkRLOWxta2NvU01KZHVLL1JvQmN0Tk5SM3pUSUlzOVQ2blpm?=
 =?utf-8?B?TkoyR29pWUVBNGtod1J5VktOdlEwRHRQQmVPMEM0STcyYXZpUmF4YlhPdmNR?=
 =?utf-8?B?eGMvOGp4YkEzUzQzUTViS2FUb3NnOEllNzEvVlpVa0xmR1BJWko4TU1CeCtF?=
 =?utf-8?B?d0Y5N0owdnBrZEoyc3UxTjF2Q20vZkgxQlBTWTBxdU5qS3c3TEM1SlRRY21Z?=
 =?utf-8?B?REd2UXBNMldaVlZtT3k2QUdleG04V1R1YlM5dXVPaWxXeGJDRVlNUkxzUnpR?=
 =?utf-8?B?bDArT3lqS1dySXRXcUJMN0ZhYUtnVmZnenJpa1lLRlg1d3ZnNXRQZTcwVzAw?=
 =?utf-8?B?eXUzME9qcklZOCt3Mit6L1BJdHIraDk5TDZMT1VxTEdNT1pIUWtZTHBWNUY0?=
 =?utf-8?B?V0tzZjVNLzRDek52R09yV0duSkZ0YjlTeldBbzlxeVNoU0dSWHl5cFhHTXAr?=
 =?utf-8?Q?HbCE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbe8853-7fe1-4eff-cca4-08db732f40f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 14:44:59.3463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCoiNPBACqGmDJAfEqOKRTPU+qAzucr4YrVHPt9vGjgVsUanSJgFq1Cj6en8y+t21Z7iiMbNLr69vdECIU8r6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5385
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

W1B1YmxpY10NCg0KSG1tLCBzZWVtcyBhbGwgdGhlIHN0YWNrIHRyYWNlIEkgZ2V0IG5vdyBhcmUg
ZnJvbSBhbWRncHVfZ2VtX3ZhX2lvY3RsLCBzbyBJIHN1cHBvc2UgdGhlIGlzc3VlIGlzIG9ubHkg
b24gdGhhdCBwYXRoIG5vdywgdGhlIGdhbmcgc3VibWl0IHBhdGNoIGZpeGVkIGl0IGZvciBhbWRn
cHVfY3NfaW9jdGwuDQoNClRlZGR5DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBMaSwgWXVueGlhbmcgKFRlZGR5KQ0KU2VudDogVGh1cnNkYXksIEp1bmUgMjIsIDIwMjMgMTA6
MTINClRvOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPg0KU3ViamVjdDogUkU6IFtQQVRDSCAxLzJdIGRybS9hbWRncHU6
IGZpeCBtaXNzaW5nIGZlbmNlIHJlc2VydmUgaW4gYW1kZ3B1X3ZtX3NkbWFfY29tbWl0DQoNCklm
IEkgdGFrZSBvdXQgdGhpcyByZXNlcnZlIGFuZCB0aGUgY2hhbmdlIHRoYXQgbWFrZXMgZG1hX3Jl
c3ZfcmVzZXJ2ZV9mZW5jZXMgbmVzdGFibGUsIEkgZ2V0IGEgQlVHIGluIHRoZSBhZGRfZmVuY2Us
IHNvIHdlIG1pZ2h0IGJlIG1pc3NpbmcgYSByZXNlcnZlIHNvbWV3aGVyZSBlbHNlIHRoZW4uDQoN
ClRlZGR5DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLb2VuaWcsIENocmlz
dGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KU2VudDogVGh1cnNkYXksIEp1bmUgMjIs
IDIwMjMgMzozOQ0KVG86IExpLCBZdW54aWFuZyAoVGVkZHkpIDxZdW54aWFuZy5MaUBhbWQuY29t
PjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxB
bGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGRybS9h
bWRncHU6IGZpeCBtaXNzaW5nIGZlbmNlIHJlc2VydmUgaW4gYW1kZ3B1X3ZtX3NkbWFfY29tbWl0
DQoNCkFtIDIxLjA2LjIzIHVtIDE4OjIzIHNjaHJpZWIgWXVueGlhbmcgTGk6DQo+IFdoZW4gYW1k
Z3B1X2JvX2ZlbmNlIGlzIGNvbnZlcnRlZCB0byBkbWFfcmVzdl9hZGRfZmVuY2UsIHRoZSByZXNl
cnZlDQo+IHdhcyByZW1vdmVkIGluIHRoYXQgcHJvY2Vzcywgc28gcHV0dGluZyBpdCBiYWNrLg0K
DQpUaGUgc2xvdHMgZm9yIHRoaXMgYXJlIHJlc2VydmVkIGluIGFtZGdwdV92bV9nZXRfcGRfYm8o
KToNCg0KICAgICAgICAgLyogVHdvIGZvciBWTSB1cGRhdGVzLCBvbmUgZm9yIFRUTSBhbmQgb25l
IGZvciB0aGUgQ1Mgam9iICovDQogICAgICAgICBlbnRyeS0+dHYubnVtX3NoYXJlZCA9IDQ7DQoN
ClRoZSBwcm9ibGVtIGhlcmUgaXMgcmF0aGVyIHRoYXQgd2UgZGlkbid0IHRvb2sgdGhlIGdhbmcg
c3VibWl0IGludG8gYWNjb3VudC4gU2VlIG15IHBhdGNoIGVhcmxpZXIgdGhpcyB3ZWVrIEkndmUg
Q0NlZCB5b3Ugb24uDQouDQo+DQo+IEZpeGVzOiA0MjQ3MDg0MDU3Y2YgKCJkcm0vYW1kZ3B1OiB1
c2UgRE1BX1JFU1ZfVVNBR0VfQk9PS0tFRVAgdjIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBZdW54aWFu
ZyBMaSA8WXVueGlhbmcuTGlAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bV9zZG1hLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm1fc2RtYS5jDQo+IGluZGV4IDM0OTQxNmUxNzZhMS4uZjU5MGI5Nzg1M2Q5IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMNCj4gQEAgLTEy
MCw2ICsxMjAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9zZG1hX2NvbW1pdChzdHJ1Y3QgYW1k
Z3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnAsDQo+ICAgICAgIHN0cnVjdCBhbWRncHVfaWIgKmliID0g
cC0+am9iLT5pYnM7DQo+ICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZzsNCj4gICAgICAg
c3RydWN0IGRtYV9mZW5jZSAqZjsNCj4gKyAgICAgaW50IHI7DQo+DQo+ICAgICAgIHJpbmcgPSBj
b250YWluZXJfb2YocC0+dm0tPmRlbGF5ZWQucnEtPnNjaGVkLCBzdHJ1Y3QgYW1kZ3B1X3Jpbmcs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NoZWQpOw0KPiBAQCAtMTM1LDYgKzEzNiw5
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3NkbWFfY29tbWl0KHN0cnVjdCBhbWRncHVfdm1fdXBk
YXRlX3BhcmFtcyAqcCwNCj4gICAgICAgICAgICAgICBzd2FwKHAtPnZtLT5sYXN0X3VubG9ja2Vk
LCB0bXApOw0KPiAgICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQodG1wKTsNCj4gICAgICAgfSBl
bHNlIHsNCj4gKyAgICAgICAgICAgICByID0gZG1hX3Jlc3ZfcmVzZXJ2ZV9mZW5jZXMocC0+dm0t
PnJvb3QuYm8tPnRiby5iYXNlLnJlc3YsIDEpOw0KPiArICAgICAgICAgICAgIGlmIChyKQ0KPiAr
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHI7DQoNClRoYXQgaXMgc2ltcGx5IGlsbGVnYWwg
YW5kIHdvdWxkIHBvdGVudGlhbGx5IGxlYWQgdG8gbWVtb3J5IGNvcnJ1cHRpb24uDQoNClJlZ2Fy
ZHMsDQpDaHJpc3RpYW4uDQoNCj4gICAgICAgICAgICAgICBkbWFfcmVzdl9hZGRfZmVuY2UocC0+
dm0tPnJvb3QuYm8tPnRiby5iYXNlLnJlc3YsIGYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIERNQV9SRVNWX1VTQUdFX0JPT0tLRUVQKTsNCj4gICAgICAgfQ0KDQo=
