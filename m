Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF3394047
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 11:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698736E3C1;
	Fri, 28 May 2021 09:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298776E34B;
 Fri, 28 May 2021 09:47:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ1ARocrLXMOn0mAHrTZ8jy54nFc/dcdhq7Q6MV3Nv8msFlf1ZGFLzbnankpCX/srhVBboY/o6B3HqQs6Re/0Y+ct9cWfyADQnN+0TtvUVdRxpZhXF8bz7sRgBXNGd1PjnYepipmlsr7tLqrwTPWAg0+NUqR/KhdLPVzI3rLmZN0yt4nzDU8yfV8HFMEMU62fb8/3VDur3fMlmBwg6mWfDoyabPyT11IrHL+VExhjPFh2a7AfszmECSMQ0ZTtsoJLGnnXGp/rlt5c2IOujM4XzZ37px5Dx+3HV6k27K77fJGSwy1Wcq84kgOyH1C4ejkk+k1hC+ii6HbsPIdlSJeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/wcby+t+zMSKcuedqEDWtrxSCQecR85EnoYGVAurRw=;
 b=N67HuruzZYyYT+XZeV8J4zyIQH+g07I6kvltof0/F6y4Lon5t5Hvci63obBCEcnnBBYDziL0m11kMc3ev0OKpGfQy47Xl7ErmiXq5wLGbGdVuPJ4DzWvSYyeXOxyOKATqW4+Uq7jwPyfdV6PXTLB+ZoCsQaHWf3VEamQ4Ym6JMKEjKR4m7nndzM8ZIUltx8ajy15tjabVzzzRZUwxzIMTuhL3gohLBg1q5b0ja+foJGZN9ABqZ7AWOp1Z/BHyRkJdRuYxprUa7f6zQAgAakol5ln7y5WfFe5MaQpoPNtfAyi/7xjeDArUHOBw27qGrl1V6X6gTykNsunKNrSvJGWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/wcby+t+zMSKcuedqEDWtrxSCQecR85EnoYGVAurRw=;
 b=JLgyNu/xPCMxKLdWVd5U9ICFjM8lP/FPDLnsvFcQpvt99Sj/DqwbFsLCfDMeUpJfQh4eV9PzlXV942//OqEDC9w18JmJBXbbpEB4E8NwwYDpExSa/b2Ed274fwoVSO0NAXzzl4+iwrmGRs2osZzvp7233Ga/XJpABH1h1aSPuSw=
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM6PR12MB4513.namprd12.prod.outlook.com (2603:10b6:5:2ad::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Fri, 28 May 2021 09:47:33 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::a4b1:38b7:ec94:8003]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::a4b1:38b7:ec94:8003%8]) with mapi id 15.20.4173.021; Fri, 28 May 2021
 09:47:33 +0000
From: "Yu, Lang" <Lang.Yu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: stop bookkeeping of temporary GTT
 allocation
Thread-Topic: [PATCH 2/2] drm/amdgpu: stop bookkeeping of temporary GTT
 allocation
Thread-Index: AQHXUpf9PQ4MN+fgUU+PeYLsfjiDkKr3OA+AgAFl4jA=
Date: Fri, 28 May 2021 09:47:33 +0000
Message-ID: <DM6PR12MB4250A3267C2472E9F4170F0EFB229@DM6PR12MB4250.namprd12.prod.outlook.com>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <20210527013051.4302-2-Lang.Yu@amd.com>
 <8539c291-85e8-7530-af23-505cda7871f9@amd.com>
In-Reply-To: <8539c291-85e8-7530-af23-505cda7871f9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-28T09:47:30Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=be7992ab-0f87-4618-b6c4-df586a8727ec;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1642707d-24b8-498c-2163-08d921bd9e41
x-ms-traffictypediagnostic: DM6PR12MB4513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4513447C11D4272E4BB6338BFB229@DM6PR12MB4513.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DbeO3ZZ/sx18d6VjOahElCgrzrL6F3GY1WOfs2EuXr7afGxG3L46lvCTOHPVzZKvgvP0F9H9ou45GSy5KSLUjJKDZLbsS2hOYCI9EU+I/uslFcNPRIL0tDu908QmITVnZZKMPYjzvhmKRJMWQkG+rahirs8YTEeI1XCbu7s0if5atk8v9N/YnugjX+qzgkxsYXZamF+xHogwwSQrnWhrpCh9tqz+WRnLDMCWuNAM1Mj8h/gO4sHGEO/jlUFTE4QJaCf/Ilzr9Alk6tzClZ2lEEOOyo5pwiUHOXpnr+af4mI8wSi5bVJQezRdzYfA5A+E9gKM0XiZ1gFNcZcaPYPSYEMZ67bxFNIiVp0DPTwt9g1bi8zGMQTfkNtHzc8HlViOp05M59ieBPLsQvAIowjKhFKEQHkNJQ1zKUNhVZWQmi89Lz2nhCNSKlhES23UXpQdQejeXR1swdRQOJkH9cH77+4KCZBL8WexYoi2MDmK7LX6qxW7cgG0/x6dEKockpWXP2b40XcILJz4wMGYXbmwkj+SALDz3qMMK3nwULBFLIFCrDb7V/1R0yHqu0FNu5kBB8tVr4CHimEgSnAyyA9aQaY+0qbgLskcX8283wDl7qQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(64756008)(66556008)(7696005)(66476007)(6506007)(8936002)(66946007)(5660300002)(52536014)(9686003)(186003)(86362001)(450100002)(66446008)(33656002)(76116006)(122000001)(38100700002)(55016002)(478600001)(2906002)(83380400001)(4326008)(316002)(71200400001)(26005)(54906003)(8676002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MzJoTFp2SERaZkhCNXkwSXRxWHlXV2tyMHVZd2JJUWxCbytzWVBaY1hKRWlK?=
 =?utf-8?B?NkJpSXNqR253ZkJSNUZQZlNHTG92V0ZCM1ExMEUrenRCbVNscG1IZnhTU1Rm?=
 =?utf-8?B?T0tkTkYycS9wcVMzaE96WjAzcmw5SzQrZUxuZHF5TjFEUThDbG53V3pRckox?=
 =?utf-8?B?bnJORDlvUUpBTWRGOHpheGIrdmNRbVM3b1J4T082eHRGM0h0RzNrZWQ0d3Vi?=
 =?utf-8?B?K3ZadTZ0NFVLaHBDeUhEK2ZRZWY4ZDV2MmIrTDY0akxlVitZZCtMYWxMVlND?=
 =?utf-8?B?Snk4REJOWEhKQk9IZGM2ZWJObjcyRVJicm5kUGVtMS9uYTJROGNiV25pUytC?=
 =?utf-8?B?elUxbjZZRnJsUERINS83dm9pZ0RCQXZNOVBpTGR2cUN3dDNXUmpjU3FKdS9N?=
 =?utf-8?B?Q3ZhMDhGZUY1SmpydjlZeVBBaElWMzM2bXVZK1FRTnFqK3JObjEyTEdsOGwx?=
 =?utf-8?B?RGpqSGthZXFoQ0xlcEZiaVlVdW9zblIraHRVWkxXb2k3UmlOMTlyVlpIVnFP?=
 =?utf-8?B?M04xRHJuS2JhMnpLVXdBSHBCS0cyaFAyM2JiRU1mSGZzelk1Q0NxVkVOb3RJ?=
 =?utf-8?B?U0tIMlZ4UjFUU1VSOEp4ZksxSlhNSmhESThBUEh2WEJTVVR3NDlST1VLRkNB?=
 =?utf-8?B?UHNWTDQ4bVRyK0YrS3E3eC9ZbG1JbGpjcnZDdXJqMHFlUTFGNlVTRWdtSTJi?=
 =?utf-8?B?L0NSNHpyaFB0dVR2ZXB3MUR0MERUR040NmJSbjlwOU1WMlB0SnhxWTBjYjhN?=
 =?utf-8?B?OVovczliUGg0ZElrWVNQZzZ6TVJqTldvN2ErMkdsWkM3azk0cWY3QUJBN3Uz?=
 =?utf-8?B?NWJKTURpZTdzYlNXL0pCSGw5OStxZWZzdTQ5eHVOQWNpK2RyZFExMytJa2Np?=
 =?utf-8?B?eDFjVFU4VmMxR3FQbXc5RGRhUE03azR6RGxURm93Zjl5R2NoM1pYdkt5TEY0?=
 =?utf-8?B?cmI5d2dteWNIRGk4UklhWDNlRjBZdmh4RVN3dXAvWkxkZ3pjWXE2andFOWNu?=
 =?utf-8?B?dUtybEFmK3F3OGlLUWtPakNUUTBsUU9oWXFDdHlWWXgweFNHN1ppU2RJVnl2?=
 =?utf-8?B?b3hPcnU3UzgxbFJmQ3Jpc0FLUkdidUlyU1p2dU04Mm5WVXk2YzF2eWtmV0NC?=
 =?utf-8?B?ZjREOTFIZHdNUTdBYWxDMmxVZnVPQ05oTk8vU0tmdDVtaG4xei9Ba3Y3NlRM?=
 =?utf-8?B?N3BHZnZOMlUwbFNNUmF2MGErblVOdDM3YXEvR0lkVzUyd3U0ZXlaT3p1OHRG?=
 =?utf-8?B?NktMYkFvZFo3U0lBNzVQUHd6R3pmMnB4RzU0Y2VlT0pjVVBjekFnTDRPL0RW?=
 =?utf-8?B?VXJRL2ppSzZKOHR0OWVLa3VEQ0gwSUczY2o5V0NIeFdhMWgwMnRReGcyWVpt?=
 =?utf-8?B?Y0VERXI1Y3B4TEY4SHI2U2NOenZ1dU5CVWtSek1IRlZRci95WFpYbFdRNmVS?=
 =?utf-8?B?RVdjdEFUUFB4QW05SkRSKzlPMU9LVUN5bGZuYnlWWEhNVVlZZ29zT0RLVi9q?=
 =?utf-8?B?OTdPbjV5b0xWSit5cVF6amovYitHTmZabk1SeVNtRVhkc2cyMkpKQ2U2anJj?=
 =?utf-8?B?UVE1eFpiS3VFNDBGUmk0S0hXSWRMUHZVV29zUkpjcHo5VGg2REdyWW1mUXBa?=
 =?utf-8?B?Q0c3NU1vQUF3ZW53a1Znb0FyYXpRdEdwTDZLaXVIZVpHZzVDZjZET01IdUgy?=
 =?utf-8?B?SjVvRndTV0YyYktZbGRNQWs3d2liUkhqSmxLQldtSUxHbWJqbktnN05TSXRh?=
 =?utf-8?Q?eqp8Exu/SJRPq2Zoqs0b6VYvU+i7wNFhPoa84tw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1642707d-24b8-498c-2163-08d921bd9e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 09:47:33.5447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ebK+G0Hkvgd4kBtErQPoUAvaVSvQnfZ9992UzJGE09O1XBCb8MxWRDsF7lOTXbtWBtUZSQJMTzAb0TnnVz8+Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4513
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQpJbmxpbmUuDQoNCj4tLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFt
ZC5jb20+DQo+U2VudDogVGh1cnNkYXksIE1heSAyNywgMjAyMSA3OjUxIFBNDQo+VG86IFl1LCBM
YW5nIDxMYW5nLll1QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LQ0KPmRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBIdWFuZywgUmF5IDxSYXkuSHVh
bmdAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcg0KPjxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPjsgT2xzYWssIE1hcmVrIDxNYXJlay5PbHNha0BhbWQuY29tPg0KPlN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBzdG9wIGJvb2trZWVwaW5nIG9mIHRlbXBvcmFyeSBHVFQN
Cj5hbGxvY2F0aW9uDQo+DQo+UHV0dGluIE1hcmVrIG9uIENDLg0KPg0KPkFtIDI3LjA1LjIxIHVt
IDAzOjMwIHNjaHJpZWIgTGFuZyBZdToNCj4+IFRvIGltcHJvdmUgYnVmZmVyIG1pZ3JhdGlvbiBw
ZXJmb3JtYWNlLCBzdG9wIGJvb2trZWVwaW5nIG9mIHRlbXBvcmFyeQ0KPj4gR1RUIGFsbG9jYXRp
b24sIGluY2x1ZGluZyBhbGxvY2F0aW9uIGZvciBCTyBldmljdGVkIGZyb20gVlJBTSBhbmQNCj4+
IGJvdW5jZSBidWZmZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGFuZyBZdSA8TGFuZy5ZdUBh
bWQuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
dHRfbWdyLmMgfCAxNiArKysrKysrKysrLS0tLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgfCAgNCArKystDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2d0dF9tZ3IuYw0KPj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ3R0X21nci5jDQo+PiBpbmRleCA4ODYwNTQ1MzQ0Yzcu
LjMyZmVkZDQ5NWM3ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9ndHRfbWdyLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9ndHRfbWdyLmMNCj4+IEBAIC0xMTEsMTQgKzExMSwxNSBAQCBzdGF0aWMgaW50IGFtZGdw
dV9ndHRfbWdyX25ldyhzdHJ1Y3QNCj50dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLA0KPj4gICAJ
c3RydWN0IGFtZGdwdV9ndHRfbm9kZSAqbm9kZTsNCj4+ICAgCWludCByOw0KPj4NCj4+IC0Jc3Bp
bl9sb2NrKCZtZ3ItPmxvY2spOw0KPj4gLQlpZiAoKCZ0Ym8tPm1lbSA9PSBtZW0gfHwgdGJvLT5t
ZW0ubWVtX3R5cGUgIT0gVFRNX1BMX1RUKSAmJg0KPj4gLQkgICAgYXRvbWljNjRfcmVhZCgmbWdy
LT5hdmFpbGFibGUpIDwgbWVtLT5udW1fcGFnZXMpIHsNCj4+ICsJaWYgKCEobWVtLT5wbGFjZW1l
bnQgJiBUVE1fUExfRkxBR19URU1QT1JBUlkpKSB7DQo+PiArCQlzcGluX2xvY2soJm1nci0+bG9j
ayk7DQo+PiArCQlpZiAoYXRvbWljNjRfcmVhZCgmbWdyLT5hdmFpbGFibGUpIDwgbWVtLT5udW1f
cGFnZXMpIHsNCj4+ICsJCQlzcGluX3VubG9jaygmbWdyLT5sb2NrKTsNCj4+ICsJCQlyZXR1cm4g
LUVOT1NQQzsNCj4+ICsJCX0NCj4+ICsJCWF0b21pYzY0X3N1YihtZW0tPm51bV9wYWdlcywgJm1n
ci0+YXZhaWxhYmxlKTsNCj4NCj5BZnRlciBzbGVlcGluZyBhIG5pZ2h0IG92ZXIgdGhhdCBJIHRo
aW5rIHdlIG5lZWQgdG8gdGFsayBhYm91dCB0aGlzIHBhcnQgaGVyZSBvbmNlDQo+bW9yZS4NCj4N
Cj5XaGlsZSB0ZW1wb3JhcnkgR1RUIGFsbG9jYXRpb25zIGNhbiB0ZW1wb3JhcnkgZXhjZWVkIHRo
ZSBHVFQgbGltaXRhdGlvbiB3ZQ0KPnN0aWxsIG5lZWQgdG8gYWNjb3VudCB0aGVtIGluIHRoZSBj
YXNlIHRoZSBldmljdGlvbiBpcyBpbnRlcnJ1cHRlZCBmb3Igc29tZSByZWFzb24uDQo+DQo+SW4g
b3RoZXIgd29yZHMgd2hhdCBjYW4gaGFwcGVuIGlzIHRoYXQgd2Ugd2FudCB0byBtb3ZlDQo+VlJB
TS0+R1RULT5TWVNURU0sIGJ1dCBHVFQtPlNZU1RFTSBuZXZlciBoYXBwZW5zIGJlY2F1c2UgaXQg
aXMNCj5pbnRlcnJ1cHRlZCBpbiB0aGUgd2FpdCAodGhhdCdzIHVuZm9ydHVuYXRlbHkgcmF0aGVy
IGxpa2VseSkuDQo+DQo+VG8gc29sdmUgdGhpcyBJIHRoaW5rIHdlIHNob3VsZCBkbyB0aGUgZm9s
bG93aW5nOg0KPjEuIENoYW5nZSBtZ3ItPmF2YWlsYWJsZSBpbnRvIG1nci0+dXNlZCAoZS5nLiBp
bnZlcnQgdGhlIHZhbHVlKS4NCj4yLiBBbHdheXMgYWNjb3VudCBhbGwgR1RUIEJPcyB0byB0aGUg
dXNlZCBzcGFjZS4NCj4zLiBPbmx5IHdoZW4gaXQgaXMgbm90IGEgdGVtcG9yYXJ5IGFsbG9jYXRp
b24gYmFpbCBvdXQuDQo+DQo+VGhpcyB3YXkgdGVtcG9yYXJ5IGFsbG9jYXRpb25zIGFyZSBhY2Nv
dW50ZWQgZm9yLCBidXQgd2Ugc3RpbGwgYWxsb3cNCj5tZW1vcnkgZXZpY3Rpb25zIHRvIGhhcHBl
biB1bmRlciBwcmVzc3VyZS4NCj4NCj5XaGlsZSBhdCBpdCB5b3UgY291bGQgYWxzbyBkcm9wIHRh
a2luZyB0aGUgc3BpbmxvY2sgdG8gY2hlY2sgdGhlIGF0b21pYywNCj50aGF0IGlzIHByZXR0eSBt
dWNoIHVubmVjZXNzYXJ5Lg0KPg0KPlJlZ2FyZHMsDQo+Q2hyaXN0aWFuLg0KPg0KW1l1LCBMYW5n
XSBIaSBDaHJpc3RpYW4sDQoNClllcywgaXQgY2FuIGFjdHVhbGx5IGhhcHBlbiB0aGF0IHRoZSBC
TyB3YXMgZXZpY3RlZCBmcm9tIFZSQU0gdG8gR1RUIGRvbWFpbiwNCmJ1dCB3YXMgbm90IG1vdmVk
IGZvcndhcmQgdG8gU1lTVEVNIGRvbWFpbi4gSXQgcmVzaWRlcyBpbiBHVFQgZG9tYWluIA0Kd2Fp
dGluZyBmb3IgbmV4dCB0aW1lIHZhbGlkYXRpb24gb3IgZXZpY3Rpb24gb3IgZGVzdHJ1Y3Rpb24u
DQoNCkl0IGlzIHJlYXNvbmFibGUgdGhhdCB3ZSBjb3VudCBhbGwgR1RUIGFsbG9jYXRpb24uIA0K
MSwgSSBmaW5kIGlmIHRoZSB0ZW1wb3JhcnkgR1RUIEJPIHdhcyBub3QgY291bnRlZCBidXQgdXNl
ZCBmb3IgY29tbWFuZCBzdWJtaXNzaW9uLCANCnRoZW4gd2UgY2FuIHVzZSBtb3JlIEdUVCBtZW1v
cnkgdGhhbiBHVFQgbGltaXQgZm9yIGNvbW1hbmQgc3VibWlzc2lvbi4gSXMgdGhhdCB5b3VyIGNv
bmNlcm4/IA0KMiwgT3IgaWYgd2UgZG9uJ3QgY291bnQgdGVtcG9yYXJ5IEdUVCBhbGxvY2F0aW9u
LCB0aGF0IHdpbGwgbWVzcyB1cCBndHQgbWFuYWdlci4NCg0KSW4gb3RoZXIgd29yZHMsIGlmIHdl
IGRvbid0IGNvdW50IGl0IHdoZW4gaXQgcmVzaWRlcyBpbiBHVFQgZG9tYWluLCB3aGF0IGlzIHRo
ZSBjb25zZXF1ZW5jZT8gDQpXb3VsZCBsaWtlIHRvIGtub3cgeW91ciBjb25jZXJuLiBBY3R1YWxs
eSBpdCBpcyBjb3VudGVkIGJ5IHR0bV9wYWdlc19hbGxvY2F0ZWQuIA0KDQpJZiB3ZSB1c2UgInVz
ZWQiIGluc3RlYWQgb2YgImF2YWlsYWJsZSIgaW4gZ3R0IG1hbmFnZXIsIHRoZSB1c2VkIHNpemUg
bWF5IGV4Y2VlZCBtYW4gc2l6ZS4NCldlIHNob3VsZCBhbHNvIGRlYWwgd2l0aCBndHQgbWdyIGRl
YnVnIGludGVyZmFjZS4NCg0KUmV3b3JrIHRoZSBsb2dpYyBsaWtlIHRoaXMgd2l0aCB5b3VyIGlk
ZWE6DQoJDQoJaWYgKChhdG9taWM2NF9hZGRfcmV0dXJuKG1lbS0+bnVtX3BhZ2VzLCAmbWdyLT51
c2VkKSA+IG1hbi0+c2l6ZSkgJiYNCgkJIShtZW0tPnBsYWNlbWVudCAmIFRUTV9QTF9GTEFHX1RF
TVBPUkFSWSkpIHsNCgkJCWF0b21pYzY0X3N1YihtZW0tPm51bV9wYWdlcywgJm1nci0+dXNlZCk7
DQoJCQlyZXR1cm4gLUVOT1NQQzsNCgl9DQoNClJlZ2FyZHMsDQpMYW5nDQoNCj4+ICAgCQlzcGlu
X3VubG9jaygmbWdyLT5sb2NrKTsNCj4+IC0JCXJldHVybiAtRU5PU1BDOw0KPj4gICAJfQ0KPj4g
LQlhdG9taWM2NF9zdWIobWVtLT5udW1fcGFnZXMsICZtZ3ItPmF2YWlsYWJsZSk7DQo+PiAtCXNw
aW5fdW5sb2NrKCZtZ3ItPmxvY2spOw0KPj4NCj4+ICAgCWlmICghcGxhY2UtPmxwZm4pIHsNCj4+
ICAgCQltZW0tPm1tX25vZGUgPSBOVUxMOw0KPj4gQEAgLTE3OCw2ICsxNzksOSBAQCBzdGF0aWMg
dm9pZCBhbWRncHVfZ3R0X21ncl9kZWwoc3RydWN0DQo+dHRtX3Jlc291cmNlX21hbmFnZXIgKm1h
biwNCj4+ICAgCQlrZnJlZShub2RlKTsNCj4+ICAgCX0NCj4+DQo+PiArCWlmIChtZW0tPnBsYWNl
bWVudCAmIFRUTV9QTF9GTEFHX1RFTVBPUkFSWSkNCj4+ICsJCXJldHVybjsNCj4+ICsNCj4+ICAg
CWF0b21pYzY0X2FkZChtZW0tPm51bV9wYWdlcywgJm1nci0+YXZhaWxhYmxlKTsNCj4+ICAgfQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMNCj5iL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4gaW5kZXgg
YzBhZWYzMjcyOTJhLi4xMjlkMzkzOTI4NTkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4gQEAgLTE1Miw5ICsxNTIsMTEgQEAgc3RhdGljIHZvaWQg
YW1kZ3B1X2V2aWN0X2ZsYWdzKHN0cnVjdA0KPnR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4+ICAg
CQkJYWJvLT5wbGFjZW1lbnRzWzBdLmxwZm4gPSAwOw0KPj4gICAJCQlhYm8tPnBsYWNlbWVudC5i
dXN5X3BsYWNlbWVudCA9ICZhYm8tDQo+PnBsYWNlbWVudHNbMV07DQo+PiAgIAkJCWFiby0+cGxh
Y2VtZW50Lm51bV9idXN5X3BsYWNlbWVudCA9IDE7DQo+PiArCQkJYWJvLT5wbGFjZW1lbnRzWzFd
LmZsYWdzIHw9DQo+VFRNX1BMX0ZMQUdfVEVNUE9SQVJZOw0KPj4gICAJCX0gZWxzZSB7DQo+PiAg
IAkJCS8qIE1vdmUgdG8gR1RUIG1lbW9yeSAqLw0KPj4gICAJCQlhbWRncHVfYm9fcGxhY2VtZW50
X2Zyb21fZG9tYWluKGFibywNCj5BTURHUFVfR0VNX0RPTUFJTl9HVFQpOw0KPj4gKwkJCWFiby0+
cGxhY2VtZW50c1swXS5mbGFncyB8PQ0KPlRUTV9QTF9GTEFHX1RFTVBPUkFSWTsNCj4+ICAgCQl9
DQo+PiAgIAkJYnJlYWs7DQo+PiAgIAljYXNlIFRUTV9QTF9UVDoNCj4+IEBAIC01MzgsNyArNTQw
LDcgQEAgc3RhdGljIGludCBhbWRncHVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QN
Cj4qYm8sIGJvb2wgZXZpY3QsDQo+PiAgIAkJCWhvcC0+ZnBmbiA9IDA7DQo+PiAgIAkJCWhvcC0+
bHBmbiA9IDA7DQo+PiAgIAkJCWhvcC0+bWVtX3R5cGUgPSBUVE1fUExfVFQ7DQo+PiAtCQkJaG9w
LT5mbGFncyA9IDA7DQo+PiArCQkJaG9wLT5mbGFncyB8PSBUVE1fUExfRkxBR19URU1QT1JBUlk7
DQo+PiAgIAkJCXJldHVybiAtRU1VTFRJSE9QOw0KPj4gICAJCX0NCj4+DQo=
