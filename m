Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C0E7FFB38
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 20:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E7110E76E;
	Thu, 30 Nov 2023 19:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F3910E76E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 19:25:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU6QEV4S6549jMb8HqpeEG5anRXEtdxNdGKgLuunI0u68IK/BpiPCcsDTnaOGIcrW4wxsElht9jSQIJJfSiVZet77fTxpViK1N7TpRkWuMr6A9c6otzllxDcQSW/MjaxOFCDc19hZkddIQhtiAIVMDMyszMX2h+8MejlsGV1QZjm/CW+IV49wy65uDScB/+hqwytcfEL4vtx+r3zAMw8+uW5zhyVBsecN15Eyi7qEblPYLkAPJCs9ZhDErHj/vzGumFKhpKXFR9IRhjiHuADmDKydsTEsrziPWOMGDo7d3f/ZulS+KNvjlYBdbZSQjcaUuaUYrIFxn3Ew0+pzePWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8o4Oz3qvdidC1Z7tCSBrwzbRyF3Pk8W4tu4y6+NhXY=;
 b=CB/K9rxw9PHggCsiawM+2DLq4ZjL12ol3VL/iBSyHQguh1imkxGNV+xyOB4PCjPVlrvv95AF1h8ilEa8U8/llbvSxu3E2lfmRtrmaUyDBXshDli8fqwWKjtS6a6yjlnh4xezPHYBJYKJR9AJINR/8duyCZbj62jlTO71ui/aHDKvR4AXJo0lBs9HplDsrFv1ayVCvRpRU3nfkdOchXDxV24IPXXW2tnDUJK6z+xaj/tLWicTSBhZ2sqETQ23RmEzMrjRK8v1saF8KloXIBkfcGXY2h6JopR5c2n+q3gLumzq4jg58ZTDr7SF0l9uQChuBGy0P/9oTaZne5kriU/+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8o4Oz3qvdidC1Z7tCSBrwzbRyF3Pk8W4tu4y6+NhXY=;
 b=oCoyebxSdf4qVQ0uKMQEB0OMUjsmnNrKc/stBTgvX9CzpK9KAqRDejSniF4hUFxU15cVxS/QDVFe8qbqkdPpTIOP4QdodnVSyN7R1LBwXIHAM9EOscJaY3KKvgX2HuEv9h3pg9WofGY+MhR9gTrQCUU7IeYmN2iwgccvh8PhNLc41VjJqez2Vb6VfPfDo1JyAT9wX0k+WHZDGmmLA+ZOy/pln4CyQH1kN0nTLA16MAjd7vVxthTTXiqTM5vEIOj5qc9SYQdwoZP5atnq+A2vqBXS6UirG0CGNDYenLFB+JN33xtH2g4zUvY2lwZM+awrbZXldpj2nNnV0oCUJ6RC/w==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 19:25:34 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 19:25:34 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "lkp@intel.com" <lkp@intel.com>
Subject: Re: [drm-misc:for-linux-next-fixes 1/2]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1389: warning: Function
 parameter or member 'priv' not described in 'r535_gsp_msg_run_cpu_sequencer'
Thread-Topic: [drm-misc:for-linux-next-fixes 1/2]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1389: warning: Function
 parameter or member 'priv' not described in 'r535_gsp_msg_run_cpu_sequencer'
Thread-Index: AQHaI53TzfBRXVtibE6he19orvXeJLCTPr4A
Date: Thu, 30 Nov 2023 19:25:34 +0000
Message-ID: <431641b77b49be1d52bdd5e302310f6e9ad97b37.camel@nvidia.com>
References: <202311302252.rJ0uF9t0-lkp@intel.com>
In-Reply-To: <202311302252.rJ0uF9t0-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|IA1PR12MB6236:EE_
x-ms-office365-filtering-correlation-id: 08b61c49-3aae-4b93-3309-08dbf1da203b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WcrD94vIo7OUI96x3ViWk7AcYi1zoJkItrMp4eO9lBZT0wtw1W8eDt8L2n5ayA6UaScHDLKtNDKYrb+nqN7ptn1YrD0NFIXmKwhFZKfUgAr/2vyVfeH/RULrGMe3CvG2P5FME1l2JzapnpfS1lhdWkjELyMP6YZXw1r/YXKg41Z26IPtppTjOJLHOl+GFLwzv3O/oiH71a8dxBh5smkLmtBiF1g9J++rIc/a7pjA4B1IKMKR/x3X715tLI8ekT7qLlI2Et/wvlhxb7KZw9JLwkuescSbN9oy4klZrbNHHYl4nwn0JbK6G7P+XvlAYG+Hzew7I+t5cv9a4fYtelnixvqMX2F8LrH9+9Pancqqsn01RuJfZj6RY7VTecfK5qRH+kCe/nSB+I3Ep3RV+LqMXMcAL8L9qi/X+OarOOm+OqZVSh+yq/GWE0wf+xw6dvhTVuucze2kbjGtV7m2ViBonR/NqetyCsRQu4Fq+PxUH22G9fz2gs5pbXXGzSggv/4ZRqnfeNMl6CPPUB1KFIieSaKrVrV6yUnNZqDlDn/O6CUsei6JONzsC/RFGFsRRrlcn5MSlP+WzrRPk1C/YFBKlc/rQYuhssYQ0e7/W3yEPTqWvjAWl8Jv+FWuBuCYIfgnfovZW3tm/SAJPaddWaAAMhBgaN7TJhbE1F7xl9+FGEcQLVSR/D/Kva+CfkoVP+giJnC+v81ZjLZ9mJ73IBDR5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(6506007)(38070700009)(122000001)(71200400001)(4744005)(5660300002)(36756003)(2906002)(6512007)(4001150100001)(86362001)(38100700002)(83380400001)(2616005)(26005)(41300700001)(91956017)(966005)(6486002)(54906003)(66946007)(8676002)(66476007)(76116006)(478600001)(66556008)(8936002)(66446008)(4326008)(316002)(64756008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEx1SDBuVDZjejVmTlNFK1RXdnh0ZUlVRWFlVGt5MlUyYzFJSmxJelFXQ3Nh?=
 =?utf-8?B?RkV5NTQwL1VxcHFSeXdMekF1OVZRZmdzTTZOaWJvTGRNRWVvUGswczBzd1oy?=
 =?utf-8?B?SDhNZTF3NE8vd1RIZG1Ed2UvSTFpQUYrTVFIT0xjMXFZWFlVZGFVTTE5UkFZ?=
 =?utf-8?B?V0Y2QjZwaHdHMk5KZlN2aENvbHppTUp2RXhscXlaTzE0SHBCMlY5UjFwUWdE?=
 =?utf-8?B?cHBXdFZiS0xPQ1ppQlRySmZua25neWt4UUYzamN6TnJFUFdubGFia1NlTEhS?=
 =?utf-8?B?KzhVMDQzUE9iS2JrcWlUUjYxaUVaNHlLaDBxWWM1WGJ6bFV2NVZDTDA0amY5?=
 =?utf-8?B?VjRSTkhvZmgrQm13dXlmb3h1aWhwRHJtRGNsd1kwakpiN0ZHL3haRHVNc1VV?=
 =?utf-8?B?SWdyRGZNVmhyZGVFeVg5amt4Y0RaSUpBRkFHTXRYYkEyQjZNcCsrM2w4a0wr?=
 =?utf-8?B?dFNFWXA2ZnZPaWlKckJmUnIxTTNGS1hnZDFjZTNBTVFUMjlsRkhRTWlPZUMx?=
 =?utf-8?B?M1g4Y2RIVFV0dlhBcCt5ZEZwa2xCRVpGT21WQnNSQzJJVndnNVEwbjhEclFX?=
 =?utf-8?B?OW1UUHdienNTV3M0S3lxeStNN0JpNzFzbXJHa1FNTWlBZGJuZTZSUklaTm5R?=
 =?utf-8?B?V3VJOXhtVFNCSU9GTVU0Y21KT0c1MG04bC9lZEo4aTFTUlVpSlJpNzlNZDIx?=
 =?utf-8?B?SWJLQjJPNithS21sdFZXTFZTN0NTNDlGZkZQQmxXVnBwWHE4K0R5NDhhSjNi?=
 =?utf-8?B?VDF3ZVF6anNsc1lBWklueHIyeEJkTWZwZGZveGlxTmxLdi92ZjhYSUhQOEJx?=
 =?utf-8?B?Y0tHZUNVTVFadktsVTk1ZDQ5YS94QytmdlRqUDloRlVaWlE2a0pubUxlQWhU?=
 =?utf-8?B?VlorZEtQaGhFc3VSanZjaFlOcE9mcmlSRks3a3BiQVRFZ20wZmNKNTgvVXVZ?=
 =?utf-8?B?eHZ0ZDB1NVVLR2VuQXEvekpEWVVMbzJaalFHbWlTeGcxYzJkSEtoOHNhcUlW?=
 =?utf-8?B?MWJjTVF5dk5BRHhUYWl0UVFLMlNCTmg4eVQ4OGh5NkZxYTdtdWs4V0R5b2N0?=
 =?utf-8?B?ZlBkcnd1b2oyOGx0R3RLWThPUWU5SXRVRjVmNUlSaFQ0L3VmaWFZTEZRNExU?=
 =?utf-8?B?YlgrcEQrc004ekY4QmF3MjYrNzNlc25VRDhOWDZGWTk4VXRHMlVDZnNvQjdG?=
 =?utf-8?B?NWUrWitaTFF2MHdNZmoxelhLL1hlQlI0UGZFSTZWY2wrZ3I0SEI3Rmh5L0ZZ?=
 =?utf-8?B?SWFOdGlZM1FqQTdiRlpqbk5hRHcyOEV0R2F0bUZ4TlAxbkgxZXVUeXBrSXZt?=
 =?utf-8?B?aStabkIrSnVIelhXb3dxY1kzUGVWcElNeUNXRW1OdlJlcjhXTXloaGNRR2Rt?=
 =?utf-8?B?Q0szLzRWYzNtY1VLYmNkSW85STRBZnFjaTNjT0QweXpuczRYYlJnMHhBNEkv?=
 =?utf-8?B?Q3NrWmZ5OWFqa0pSZ2kvY1c4dVNESUhobkgxM0IvNk5FL2ZjbEtWSW8xRzZm?=
 =?utf-8?B?QXZnYlZLTUw5Ly85UERLckhUSEplZWZQRXE2Wlc2bGV1bHdHUmFNeDZtRU9G?=
 =?utf-8?B?VkVFUkREQzV6bFl6OTNKVHZXSE8vZGMzc09aRWFWazZGRVkxVy9rbm9wVVNV?=
 =?utf-8?B?cDZTSFNLRnNFNk1ja2dMSU8yVENGQ0JpMjQyRGtuVWpsSjA0TXp0ZGRLeGw4?=
 =?utf-8?B?TmtZK2JmS2w3VU9aaGZqSmdvbGdLQ3lOMk9GcnJuRHBhYnVibFIwNkxxMDY2?=
 =?utf-8?B?ZWYzdllPWGRFcldpcmdteUY5L3NkTFlUR29PbHZZRUcwLzdtVldpREUyMVVo?=
 =?utf-8?B?QTRvL3RFVnpwQmxPRFhpbU8xdGJkdWV3NUxHSnlhTHp3aytaSG1EN2p4dEJI?=
 =?utf-8?B?QTZTdi96Y25STFNLb1ExcjJwaDFvV0Z2TFlieGpKTk1tdjJzNk9Hd0lvd3Zu?=
 =?utf-8?B?UCtiVHpqLzdYcS9ZSS85VWZPTG92YVlVNVE4andEOUV2MG10K0tqekk5a2xx?=
 =?utf-8?B?Ly9IaHNBWDRENmc5NElvazVGMGRURFpzY2NRdjErQ0ZicFVYOUR3TVc4eGpx?=
 =?utf-8?B?bHd1YUhwd2tYbTdQSDFxRlE0QjJDTk53WGdZeUVseE9pdGNVaEJ5MXJGc01L?=
 =?utf-8?Q?sqLQxdobskzJrGWxy2Rrbzk7A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96F38CF92BFB0C43A45757CDFC528439@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b61c49-3aae-4b93-3309-08dbf1da203b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 19:25:34.8955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WG6OyNPjhahgRJDli1BmZ3NCuR0Wy8iU7gIy6wBbfUhwrzN062YExmyoeC8fzpCf8Z0MqQXj7qwGo+5d4PPmWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236
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
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTMwIGF0IDIyOjU4ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGku
ZS4gbm90IGp1c3QgYSBuZXcNCj4gdmVyc2lvbiBvZg0KPiB0aGUgc2FtZSBwYXRjaC9jb21taXQp
LCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvb2Uta2J1aWxkLWFsbC8yMDIzMTEzMDIyNTIuckowdUY5dDAtDQo+ID4gbGtwQGludGVsLmNv
bS8NCj4gDQo+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KDQpTbyBp
ZiBJIGRvY3VtZW50IGEgZnVuY3Rpb24gd2l0aCBrZXJuZWxkb2MsIEkgbmVlZCB0byBkb2N1bWVu
dCBhbGwgb2YgdGhlDQpwYXJhbWV0ZXJzPw0K
