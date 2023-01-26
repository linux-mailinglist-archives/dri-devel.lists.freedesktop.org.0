Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FE467CD57
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3DE10E90B;
	Thu, 26 Jan 2023 14:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7262210E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:13:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgGwb7fU0aTvEwhOEVg5DWmq1fGTyNwi1GFxh1iZTQ549LQEFzZnpRB5lbFux3nrDek99jK6FVpSSNS9nm1X4fIxAo7y4BP665jp+GKCstSfU+lTFMqQWE1p2t4bZK9W4ga/e4WV+P1mf5uo1wCjPR1jrQXiT4uphguzTyWyxEESQjsuWl7Z5SA4iK8c96ahRkdPmpmoaV0flkFuEHoIeKkX03q80hhBYnqNcqNLHeCoqp483JKh6gpRFYavSc3x6Nso2OIEJC7kutIN9XCQYEIgDhfnJu1BEu+iWSdPlcRrtv3Ga+U5TlP5CvMBcs/by/eJdFtxjQEha5Q9slrFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnw3j68gLUb7b0c177OOfcXrANHs+qYYI9hPcACKNmY=;
 b=G30zOfgrwJPsCKdo+fLjQud38HKM4bCz/orJXQA6+qLesCkx+JK6FJPrW1BP7XlcccDDZ5V5cl+7D7c2qljgRl2fjMvnsTRcfHFKP5GehjccwBxJ71fUoJ1YzNbH808Srd1tZuv06dUzKTWO46wHuMYBJzU579ktppeRxNvVRiPr8ytksOJF/QyZbx1tVTNDVlQRUXPDQX+IawkNnJt4cy2hr7wRJjuiqCqElSrBOBv9A6kCUAIwOTq73HQkXC21Qgw6cqBMEkN+S4QT5tPtz7/Y3jYPY5XkJNYiMIni4C8My+f+h2Pd8VVFDOn5Z0bHfE77Kci5AY24v3wOllA/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnw3j68gLUb7b0c177OOfcXrANHs+qYYI9hPcACKNmY=;
 b=oZDOnpvPIGRhBgjQxvbV+TyKPQ5qAlTcf/IQRFAVLqTDW39nSyOGmuNqL4WUCmS31W0GvpjKFrOHa3br0iMlLCrGPaJg1EYjlz0ZY8PTLUfr7A62XqukU9QWzJQwcaMu3eSep6tvanHWsFtmytHyozBblRX9ZDLlYZ/DfXAOdfw=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 14:13:11 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::ae3c:5792:8b56:6367]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::ae3c:5792:8b56:6367%6]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 14:13:10 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: RE: Amdgpu module is references even after unbinding the vtcon
Thread-Topic: Amdgpu module is references even after unbinding the vtcon
Thread-Index: AQHZL/3qFuikFL7M4Ua2BVa9dvF6Rq6vi9yAgADrDQCAACoygIAAF42AgAAHjoCAAAA2UA==
Date: Thu, 26 Jan 2023 14:13:10 +0000
Message-ID: <MW4PR12MB566730E74F7E1D33CA90D838F2CF9@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <6f234925-9934-53d7-ca9f-6b5bc6a67ee6@gmail.com>
 <BYAPR12MB3094B0D8166231D88609CA6998CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <0e985a2e-8bd8-c488-6a21-15a57fb1720a@gmail.com>
In-Reply-To: <0e985a2e-8bd8-c488-6a21-15a57fb1720a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-26T14:13:07Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c149571c-22c0-4cc8-946b-cee7aa459268;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|DM4PR12MB7503:EE_
x-ms-office365-filtering-correlation-id: 3afb5831-f679-4057-295a-08daffa7747d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pNvasPVenoHco13cYkVNc/2A1m6EwJUm74AnHWEiT5Xhmz/pr3EPgNoV4/L9MikRrAn8BM5rYI5YM7e1SkVIrMdCmV2CRpZFBPg23MduzpF5dJtxarQHf0zSa9eH76VPlqCjzgHCij0bUCEmPmD00/nY3aP4YVFeXmJZw8vje1y+8n67SSftVOcxB0MGWA7Tz0ECqMLO0cWLsyb5WftfQ0r+6oTyeMh0r2iUCnvycRpRYDFrbjYyXA9i/NGlmyHhxZBZ1zEh7q0Kem7x5tf61IgyIiRELiPKFFQy572pRs2enlTxi1RcNnpW77FjZLOtyo5G5fsLmqdJDe6aW7IjTtOrv9EuagQsHZ5q/MxdRF4bsNbdYTU3V2XireNMLzBDNTEvQ4J5pdfLtIBhYb4RnhUjqGvFoUhI+6xqhWzIXHAQU7xR9QkWpSxAqUVC2XU/1CQitGTaLhaWF9V0PlT4fo4MmREkfjVAAxP28v05nnPCwt1VmwCmio7M7qQFeq2AbKe58BRSHmJJa7qXPEKdMU2ZCbYaFtBfTIfjXZuKKtuP+u0IKEOn67W99nEKWTTjzA+5t4eNKg4VN6bXxx17bKqPjBglpUq7RSRexpmK5QyNz5VyEi1GfGDEHLv49JjApQQ2NvqA0+n13ca7XOAG2UUhxca7LZ14/8w3Ra2+kRi5up0fH0P2FxN0zUNJOI97E8cknyFk15pAKzg6Lufl88Ra/2KtgLYtyyZlF49d3SU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199018)(86362001)(53546011)(2906002)(5660300002)(33656002)(478600001)(71200400001)(966005)(122000001)(83380400001)(9686003)(6506007)(26005)(186003)(54906003)(8676002)(316002)(8936002)(66946007)(66556008)(66476007)(52536014)(66446008)(76116006)(64756008)(110136005)(38100700002)(4326008)(7696005)(55016003)(38070700005)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1ZSSStTcU5PT2IxV0xCVVp2QW40c2NKa0ZIblp3TDJIZFAybmhwZUNhZ3lt?=
 =?utf-8?B?OFg0OG9PbTFxVmJTbnNMMytXbkRhbGFJR3BIRGphek1GTGxEeVViaVNIb25E?=
 =?utf-8?B?anVwVFc5YkhNeWZvZkcza0I3c2o4QlhtckswNll1dXh3UmpDL0tRVnJwZzFo?=
 =?utf-8?B?aUM0Sk9OU1ozMkNhQ01JNjNiSkZ5YStvSE5VUjcyQTQrZnpMVXVLNk15cWY0?=
 =?utf-8?B?cm1IUXI4MWJiMTBCcm9ocmg4cjU0Q1hyZFAzekgyTFVMamVQVElRS05kTUxn?=
 =?utf-8?B?dkdWNXNPbitjOEJ3cmpMWDc3eTAyUW1kRUd2MHFKZ2x0bTRZV2dmYkR0Z05i?=
 =?utf-8?B?dzRveHFWSE1ZdVBPbSsrRmMyTzhMNzlkR1pvZ0NWUTQ2UGEyUnBSNGFIcFZp?=
 =?utf-8?B?L1ZJV0trNEY4Nlg0MDRjV2s0N1JPUE5vZEcxZVEvRkcxU3pyS205QUpOMDBL?=
 =?utf-8?B?OWpLSjlUQnZBMnltTEFlQ3BkYzRRMXYwdHlmOHBaeUpsdEhJS3dvRXU0RHU5?=
 =?utf-8?B?RGJpUnM4STZJU1k5Tkg3bUNlalRxY0s3djFEZzNocy9mTkxRdFlLek9uazI3?=
 =?utf-8?B?THlhMGFoVkN3Y0RTMTdpZFFZc0pZUEgrem1iUzVTSFB6a01aekRYc2Z2VUJ4?=
 =?utf-8?B?Z09EZlVXSFgyUFhMNWNHU1g5anJCODZ0MTFrbVFUU2VIY3pNM2FzakhDTGY2?=
 =?utf-8?B?dDAxRkNjRkptcUlrN21ZUW40RE5VbXhWR1VCaVJ0VktITmx5U1JIZllOVlh1?=
 =?utf-8?B?RFcrL1E0dmdYTnJmeW53c0o2eGsyZk5VaUtsMCtiNGNiY1pEeWkwNml6aFlm?=
 =?utf-8?B?cTFHVzc5UnBMWTN5MG5XOVFmbnNEMWYvckl2WVlCQzNpelVoUHl4eXVZRDBO?=
 =?utf-8?B?YS84QTlZcGhhNXVIcW4wKzVkNWFtNSt3R0k5WGJXNzFNK0RWdUFoaUJqZ1VB?=
 =?utf-8?B?bm9EN0FKcHhpOVlCbEZaNVRFMklXL3FqZm54VkJyM2tDKzRNbnNnM0g0YlZH?=
 =?utf-8?B?ZGtFVS9tN3NIU1loR1kyanQxSVBwVEhLUnBEa01yUHRxa2xmMGV5Sno3aHJO?=
 =?utf-8?B?aEVKemI5aVQ4QTRqdGhBVkxhVnc2alVlNXMwd2RUN3Zud2d2ZHlMNFBRNDJh?=
 =?utf-8?B?K1JEMzB4NVM3OGszNUtRdFBlWDRzS1dpWWZQb0ljTDFaTnBpY2lTaXd3M2xl?=
 =?utf-8?B?WG5ORFl6c1B6dUdnK3BFTXRCcjkvTmExdXVKRkZZYnFwRXEyNUg1cTdWRnY2?=
 =?utf-8?B?Nmp3bnJjalRLdWI2N3B5NGlmdUllWTdMNnNCTXNHdHJPVm5zMWl3cDIyV3FF?=
 =?utf-8?B?djFVSENRdUxnZk45akdtdktsOVUrWDR6M05QYWdjZG5Ec1Y0SXNSWklJTXd2?=
 =?utf-8?B?NER2VGd6UUtRZ3F1Y2U2emFhdjcrZlkyR1FaaUVLc0hodXlacW0zamkzZEF5?=
 =?utf-8?B?S09TVVpWZzZHSFZsVit5bFoyN05kRTVDNTlxMWpKUUlPRndOQnc0MDQ2ZGdL?=
 =?utf-8?B?OGRxcHVqN1N5TkJQdVpLQXdSa043M1AxQWovZzlWWGJDTE1laTk0RE83RGxC?=
 =?utf-8?B?cTVzaUs0WUhXQXh4eEFEVDZGY24weisrTFpTdlpsWlBDc0NlaVBmWlBxT0di?=
 =?utf-8?B?S1pLMWRNY0xtcEVqZFZRRUY1V3hwVDBGQXV1dUVIV011MDhvQjZiSk9HU0hj?=
 =?utf-8?B?d2xZcnNueHFJZVd3M1M5bHJFMjhFVmdRRGx4ZGF1cWtOSnc1QmFWVXY4UzdX?=
 =?utf-8?B?cnFWVWtTaWxLNzNyUE5yVFJVNCtYUCt5L3UxQlJBL1VzbE9PbGlpdFpSY2ZH?=
 =?utf-8?B?YWJ1ekIvd1NLOER0bWlTS0pZZldwR01JVkoyRldMVjdySkZrOTFsNks1UG50?=
 =?utf-8?B?anlYUW1yMXpqcGRydEM1K05BelV2c0pxZ2d3YVY2SmduZkM3TWZsNW85YjBE?=
 =?utf-8?B?Z24wdXVjNm91cW9mU3BzSlZvK3dNaW0yc0ZiamxIWG94R3IydmhtWW5yV3Zu?=
 =?utf-8?B?KzFNSElMVjF3MVN1Vmc4RS9Ed3drNGNndks0Ym54TEFROTM5R2d1RnI5Rkhk?=
 =?utf-8?B?TlM0NGVOZi8rVm8xM3pGYnBXdmJrYTYrQ3FWVnB3QnFPZnpZanA4d21HZU9B?=
 =?utf-8?Q?1Vkc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afb5831-f679-4057-295a-08daffa7747d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 14:13:10.4859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdxFINa5HRdkIOj0B+OGYxlR2ABRCXZhhVRJsCl11wEMCaTE3gp6ZNYGPA7mm7kC/86K8KzjNVs0QMSfvRB/gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkkgd291bGQgYWxzbyBoaWdobHkg
cmVjb21tZW5kIHRoaXMgdG8gYmUgdGVzdGVkIHdpdGggYW5vdGhlciBjb21wb3NpdG9yIChMaWtl
IFdlc3Rvbi9Td2F5IGV0YykNCg0KUmVnYXJkcw0KU2hhc2hhbmsNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2Vu
QGdtYWlsLmNvbT4gDQpTZW50OiAyNiBKYW51YXJ5IDIwMjMgMTU6MTINClRvOiBTbGl2a2EsIERh
bmlqZWwgPERhbmlqZWwuU2xpdmthQGFtZC5jb20+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBT
aGFybWEsIFNoYXNoYW5rIDxTaGFzaGFuay5TaGFybWFAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBB
bWRncHUgbW9kdWxlIGlzIHJlZmVyZW5jZXMgZXZlbiBhZnRlciB1bmJpbmRpbmcgdGhlIHZ0Y29u
DQoNCkhpIERhbmlqZWwsDQoNCmNhbiB5b3UgYWxzbyBkb3VibGUgY2hlY2sgdGhhdCBHRE0vWCBp
cyBzdGlsbCBjYXBhYmxlIG9mIGFjcXVpcmluZyBhIERNQS1idWYgZmlsZSBkZXNjcmlwdG9yIGZv
ciB0aGUgYnVmZmVyIChlLmcuIHRoYXQgd2UgaGF2ZSBhIERNQS1idWYgaGFuZGxlIGZvciBpdCB3
aGlsZSB0aGV5IGFyZSBzdGFydGVkKS4NCg0KQW5kIHRoYXQgaGFuZG92ZXIgZnJvbSBmYmRldiB0
byBHRE0vWCBpcyBmbGlja2VyIGZyZWU/DQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KQW0gMjYu
MDEuMjMgdW0gMTQ6NDQgc2NocmllYiBTbGl2a2EsIERhbmlqZWw6DQo+IFtBTUQgT2ZmaWNpYWwg
VXNlIE9ubHkgLSBHZW5lcmFsXQ0KPg0KPiBIaSBDaHJpc3RpYW4sDQo+DQo+IEkgaGF2ZSB0ZXN0
ZWQgdGhlIHByb3Bvc2VkIHBhdGNoLCB0aGUgaXNzdWUgaXMgbm90IHJlcHJvZHVjaWJsZSBhbmQg
ZXZlcnl0aGluZyBlbHNlIHNlZW1zIHRvIHdvcmsgZmluZS4NCj4NCj4gQlIsDQo+IERhbmlqZWwN
Cj4NCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBDaHJpc3RpYW4gS8O2
bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4+IFNlbnQ6IFRodXJzZGF5
LCBKYW51YXJ5IDI2LCAyMDIzIDE6MjAgUE0NCj4+IFRvOiBTbGl2a2EsIERhbmlqZWwgPERhbmlq
ZWwuU2xpdmthQGFtZC5jb20+OyBUaG9tYXMgWmltbWVybWFubiANCj4+IDx0emltbWVybWFubkBz
dXNlLmRlPg0KPj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IGRyaS1kZXZlbCA8ZHJpLSANCj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47
IFNoYXJtYSwgU2hhc2hhbmsgDQo+PiA8U2hhc2hhbmsuU2hhcm1hQGFtZC5jb20+DQo+PiBTdWJq
ZWN0OiBSZTogQW1kZ3B1IG1vZHVsZSBpcyByZWZlcmVuY2VzIGV2ZW4gYWZ0ZXIgdW5iaW5kaW5n
IHRoZSANCj4+IHZ0Y29uDQo+Pg0KPj4gQW0gMjYuMDEuMjMgdW0gMTA6NDkgc2NocmllYiBTbGl2
a2EsIERhbmlqZWw6DQo+Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQo+Pj4N
Cj4+PiBIaSBUaG9tYXMsDQo+Pj4NCj4+PiBJIGhhdmUgY2hlY2tlZCB3aGF0IHlvdSBtZW50aW9u
ZWQuDQo+Pj4gV2hlbiBsb2FkaW5nIGFtZGdwdSB3ZSBjYWxsICBkcm1fY2xpZW50X2luaXQoKSBk
dXJpbmcgZmJkZXYgc2V0dXAgDQo+Pj4gWzFdLCB0aGUNCj4+IHJlZmNudCBmb3IgZHJtX2ttc19o
ZWxwZXIgaW5jcmVhc2VzIGZyb20gMyAtPiA0Lg0KPj4+IFdoZW4gd2UgdW5iaW5kIHZ0Y29uLCBy
ZWZjbnQgZm9yIGRybV9rbXNfaGVscGVyIGRyb3BzIDQgLT4gMywgYnV0IA0KPj4+IHRoZQ0KPj4g
ZHJtX2NsaWVudF9yZWxlYXNlKCkgWzJdIGlzIG5vdCBjYWxsZWQuDQo+Pj4gVGhlIGRybV9jbGll
bnRfcmVsZWFzZSgpIGlzIGNhbGxlZCBvbmx5IHdoZW4gdW5sb2FkaW5nIHRoZSBhbWRncHUgZHJp
dmVyLg0KPj4+DQo+Pj4gSXMgdGhpcyBleHBlY3RlZD8NCj4+IFllcywgdGhlIGNsaWVudCBjYW4n
dCBiZSByZWxlYXNlZCBiZWNhdXNlIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIA0KPj4gdnRjb24g
aXMgYm91bmQgdG8gdGhpcyBmYmRldiBhZ2Fpbi4NCj4+DQo+PiBQbGVhc2UgdGVzdCB0aGUgaGFu
ZGxlIHdvcmsgYXJvdW5kIEkndmUgc2VuZCBhcm91bmQgaW50ZXJuYWxseS4gQXQgDQo+PiBsZWFz
dCBmb3IgbWUgdGhhdCBhcHByb2FjaCBzZWVtcyB0byB3b3JrLg0KPj4NCj4+IFJlZ2FyZHMsDQo+
PiBDaHJpc3RpYW4uDQo+Pg0KPj4+IFRoZXJlIGlzIGEgY29tbWVudCBmb3IgZHJtX2NsaWVudF9y
ZWxlYXNlIHdpdGggcmVnYXJkcyB0byBmYmRldiA6DQo+Pj4gKiBUaGlzIGZ1bmN0aW9uIHNob3Vs
ZCBvbmx5IGJlIGNhbGxlZCBmcm9tIHRoZSB1bnJlZ2lzdGVyIGNhbGxiYWNrLiBBbiBleGNlcHRp
b24NCj4+PiAgICAqIGlzIGZiZGV2IHdoaWNoIGNhbm5vdCBmcmVlIHRoZSBidWZmZXIgaWYgdXNl
cnNwYWNlIGhhcyBvcGVuIGZpbGUgZGVzY3JpcHRvcnMuDQo+Pj4NCj4+PiBDb3VsZCB0aGlzIGJl
IHJlbGV2YW50IGZvciBvdXIgdXNlIGNhc2UsIGFsdGhvdWdoIGFzIA0KPj4+IEFwcGxpY2F0aW9u
L1gvR0RNIGFyZQ0KPj4gc3RvcHBlZCBhdCB0aGF0IHBvaW50IGFuZCBubyBmZCBzaG91bGQgYmUg
b3Blbi4NCj4+PiBUaGFuayB5b3UsDQo+Pj4gQlIsDQo+Pj4gRGFuaWplbA0KPj4+DQo+Pj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+IEZyb206IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMjUsIDIw
MjMgODo0OCBQTQ0KPj4+PiBUbzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1l
cmtlbkBnbWFpbC5jb20+DQo+Pj4+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5E
ZXVjaGVyQGFtZC5jb20+OyBTbGl2a2EsIERhbmlqZWwgDQo+Pj4+IDxEYW5pamVsLlNsaXZrYUBh
bWQuY29tPjsgZHJpLWRldmVsIA0KPj4+PiA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz47IFNoYXJtYSwgU2hhc2hhbmsgDQo+Pj4+IDxTaGFzaGFuay5TaGFybWFAYW1kLmNvbT4NCj4+
Pj4gU3ViamVjdDogUmU6IEFtZGdwdSBtb2R1bGUgaXMgcmVmZXJlbmNlcyBldmVuIGFmdGVyIHVu
YmluZGluZyB0aGUgDQo+Pj4+IHZ0Y29uDQo+Pj4+DQo+Pj4+IEhpIENocmlzdGlhbg0KPj4+Pg0K
Pj4+PiBBbSAyNC4wMS4yMyB1bSAxNToxMiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6DQo+Pj4+
PiBIaSBUaG9tYXMsDQo+Pj4+Pg0KPj4+Pj4gd2UgcmFuIGludG8gYSBwcm9ibGVtIHdpdGggdGhl
IGdlbmVyYWwgZmJjb24vZmJkZXYgaW1wbGVtZW50YXRpb24gDQo+Pj4+PiBhbmQgdGhvdWdoIHRo
YXQgeW91IG1pZ2h0IGhhdmUgc29tZSBpZGVhLg0KPj4+Pj4NCj4+Pj4+IFdoYXQgaGFwcGVucyBp
cyB0aGUgZm9sbG93aW5nOg0KPj4+Pj4gMS4gV2UgbG9hZCBhbWRncHUgYW5kIGdldCBvdXIgbm9y
bWFsIGZiY29uLg0KPj4+Pj4gMi4gZmJjb24gYWxsb2NhdGVzIGEgZHVtcCBCTyBhcyBiYWNraW5n
IHN0b3JlIGZvciB0aGUgY29uc29sZS4NCj4+Pj4+IDMuIEdETS9YL0FwcGxpY2F0aW9ucyBzdGFy
dCwgbmV3IGZyYW1lYnVmZmVycyBhcmUgY3JlYXRlZCBCT3MgDQo+Pj4+PiBpbXBvcnRlZCwgZXhw
b3J0ZWQgZXRjLi4uDQo+Pj4+PiA0LiBTb21laG93IFggb3IgR0RNIGl0ZXJhdGVkIG92ZXIgYWxs
IHRoZSBmcmFtZWJ1ZmZlciBvYmplY3RzIHRoZSANCj4+Pj4+IGtlcm5lbHMga25vd3MgYWJvdXQg
YW5kIGV4cG9ydCB0aGVtIGFzIERNQS1idWYuDQo+Pj4+PiA1LiBBcHBsaWNhdGlvbi9YL0dETSBh
cmUgc3RvcHBlZCwgaGFuZGxlcyBjbG9zZWQsIGZyYW1lYnVmZmVycyANCj4+Pj4+IHJlbGVhc2Vk
IGV0Yy4uLg0KPj4+Pj4gNi4gV2UgdW5iaW5kIHZ0Y29uLg0KPj4+Pj4NCj4+Pj4+IEF0IHRoaXMg
cG9pbnQgdGhlIGFtZGdwdSBtb2R1bGUgdXN1YWxseSBoYXMgYSByZWZlcmVuY2UgY291bnQgb2Yg
MCANCj4+Pj4+IGFuZCBjYW4gYmUgdW5sb2FkZWQsIGJ1dCBzaW5jZSBHRE0vWC9XaG9ldmVyIGl0
ZXJhdGVkIG92ZXIgYWxsIHRoZSANCj4+Pj4+IGtub3duIGZyYW1lYnVmZmVycyBhbmQgZXhwb3J0
ZWQgdGhlbSBhcyBETUEtYnVmIChmb3Igd2hhdGV2ZXIgDQo+Pj4+PiByZWFzb24NCj4+Pj4+IGlk
aykgd2Ugbm93IHN0aWxsIGhhdmUgYW4gZXhwb3J0ZWQgRE1BLWJ1ZiBhbmQgd2l0aCBpdCBhIHJl
ZmVyZW5jZSANCj4+Pj4+IHRvIHRoZQ0KPj4gbW9kdWxlLg0KPj4+Pj4gQW55IGlkZWEgaG93IHdl
IGNvdWxkIHByZXZlbnQgdGhhdD8NCj4+Pj4gSGVyZSdzIGFub3RoZXIgc3RhYiBpbiB0aGUgZGFy
ay4NCj4+Pj4NCj4+Pj4gVGhlIGJpZyBkaWZmZXJlbmNlIGJldHdlZW4gb2xkLXN0eWxlIGZiZGV2
IGFuZCB0aGUgbmV3IG9uZSBpcyB0aGF0IA0KPj4+PiB0aGUgb2xkIGZiZGV2IHNldHVwIChlLmcu
LCByYWRlb24pIGFsbG9jYXRlcyBhIEdFTSBvYmplY3QgYW5kIHB1dHMgDQo+Pj4+IHRvZ2V0aGVy
IHRoZSBmYmRldiBkYXRhIHN0cnVjdHVyZXMgZnJvbSB0aGUgQk8gaW4gYSBmYWlybHkgaGFja2lz
aCANCj4+Pj4gd2F5LiBUaGUgbmV3IHN0eWxlIHVzZXMgYW4gaW4ta2VybmVsIGNsaWVudCB3aXRo
IGEgZmlsZSB0byBhbGxvY2F0ZSANCj4+Pj4gdGhlIEJPIHZpYSBkdW1iIGJ1ZmZlcnM7IGFuZCBo
b2xkcyBhIHJlZmVyZW5jZSB0byB0aGUgRFJNIG1vZHVsZS4NCj4+Pj4NCj4+Pj4gTWF5YmUgdGhl
IHJlZmVyZW5jZSBjb21lcyBmcm9tIHRoZSBpbi1rZXJuZWwgRFJNIGNsaWVudCBpdHNlbGYuIFsx
XSANCj4+Pj4gQ2hlY2sgaWYgdGhlIGNsaWVudCByZXNvdXJjZXMgZ2V0IHJlbGVhc2VkIFsyXSB3
aGVuIHlvdSB1bmJpbmQgdnRjb24uDQo+Pj4+DQo+Pj4+IEJlc3QgcmVnYXJkcw0KPj4+PiBUaG9t
YXMNCj4+Pj4NCj4+Pj4gWzFdDQo+Pj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV8NCj4+Pj4gY2wNCj4+Pj4gaWVudC5j
I0w4Nw0KPj4+PiBbMl0NCj4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtXw0KPj4+PiBjbA0KPj4+PiBpZW50LmMjTDE2
DQo+Pj4+IDANCj4+Pj4NCj4+Pj4+IFRoYW5rcywNCj4+Pj4+IENocmlzdGlhbi4NCj4+Pj4gLS0N
Cj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+Pj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
Pj4+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkggTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCANCj4+Pj4gR2VybWFueSAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQo+Pj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==
