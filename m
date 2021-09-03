Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D823FFA9D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 08:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162E06E849;
	Fri,  3 Sep 2021 06:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3B86E849;
 Fri,  3 Sep 2021 06:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qh/djx2uEfbd/JAlzisckY6qx6tHKOX5ulIbf89Vvv85bAyjpjuk8+jdh87Yfc7e0rZdm0U5gcfE4Y+1f1or7aXZzOrxm1Oz61o1aUNI5Qo/8+KqJRR/18+GnYns1yjCWH74tFcmrZZE8AnpvqSh7sxPfPcheknni7y7/Ic3WUWKppWfSMcZwVZ+f8aa2pAvilDpagMPSepdbaGdboOfwNxhNo3j5MI7nDJH6zBAoC/ePbc5NJuNySrwSlFEnudw9WoycemNKwu/aD3y47BGDl1yFloVcM7rHwoDoWwFyhQR6YPkGMEycFsYqQ0IlupJkSuBE74sYHBNGnffGqMxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Tp/M/clNcWko/ApIkLoUXtgBRyNM+pXRMeVdnD/Ck6o=;
 b=VJQPqZUvUx1iKFyA8WQZgvlrN/iDE8zaqzapWqIOPsy6iMzlee2pM655jiymbd93oVmmq9R1geAbj4sgzi6JjAgqD7DyIMuQQscuk11AOf+7LXAh4dKWlLp5tXn4mI/ZhZ7PyJD5dps8jR9FicEJeg15GCOMjGuYlTtCsKkBj7wFdrkf8stalRyjmYlDDb3BwjbiAAU73EsEmLNgeC9MTw7ndmfMKIFXF27iUom6RzuU88SejrL/0zzUGx3dpc21EmHa1axUsQbs0bmdcZgDKmKCbyXhaezQLbFdy23tmDdn29j4A4mrANeJ8s336WFO7MMWnUdMxzeG0SE4hkr/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp/M/clNcWko/ApIkLoUXtgBRyNM+pXRMeVdnD/Ck6o=;
 b=JjS3kp3lXmZbaZTkpP7KKbgSShaBKbrfQ3s4OUuWDX7bBFyYRjxIgJQ0MbI9CyOPQvbXbpkqcuVxYQqEpeaF2WBAfQJXyxbU8D7fHpfbtgM2UMmXkkm6zLXHLlg1QZAvrPUflfdhl4Qg1aTr4ccFY+bQRtWSep4cxAyq/V64Q0M=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5039.namprd12.prod.outlook.com (2603:10b6:5:38a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Fri, 3 Sep 2021 06:49:55 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 06:49:55 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: amd-gfx <amd-gfx-bounces@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/amdpgu: Use VRAM domain in UVD IB test    
Thread-Topic: [PATCH 2/2] drm/amdpgu: Use VRAM domain in UVD IB test    
Thread-Index: AQHXoI/nSfVQHdsoy0mdoJw6k5ntZA==
Date: Fri, 3 Sep 2021 06:49:55 +0000
Message-ID: <88539BB5-333A-4019-A411-D09859291404@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1f.0.191110
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75974e69-22c3-4cd6-9e07-08d96ea709cf
x-ms-traffictypediagnostic: DM4PR12MB5039:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5039DCB72335D446453897F687CF9@DM4PR12MB5039.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:64;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k72q4GJUdfMMABc+VqrdtPSAq4G0ZMxA/mG82I4Mnf0873QQe/mf127zvEessJnNOrcZgOo5i7UDqebvKYNM/b/+XvP98JJYLTm9BTuJxZGxJDEjpCqIXY34qvgGUp4ylZ4V3mmButrycYtmw4HifkDJN8Zw27a8dhHsTWDa7dGMGOo51rgZu4rgDMU4zbU0upDST6m/KeHH46tHX3fAwVM6EIcKRlIx3NxrPQg3l2RrrkIOhk+Yg+e2SouRx64zindzg8xI3wyYvsoz6qj8S2vFEtEqNMIwgSsr04oHI5HHLOjF3NTzAwj4iZ8uq665RFCTvlbICR5HjmZDnq9RwmrrHW032IAQYjADtzAqR3rZZkvDqQ+/0fFlQvVQJeAKYYZRqMeJ88zud5VqJijWDOgxurbSDSDhRLVBdp5Is+2WoTEUSoBZhdow5k+PCodh1N9JYdLWAA0e/n6P9l0cGycKlsZ8vlsURyJE44tMICR0kzZyogh/IJ/OjIJJYmkqbZZm3sojcExzTXckGzc9Trp6nuZc2+iJAkEzhGR1uhaQZQ93LnUx4ECpSg7DMfshwRtUVYyMks7MlgZykelLZUIu1wFBD21ci3KZwO3ob9CSbYPLRbwXfQvwBYNIXtZqGcNQwCooQUGCxPSJgyCncOJ4OyxLLHBgZSJjwxJftQ6gSB7QMQtnolU7mTuMsFm0a/FbMZ/3fEhZOGBBGdJOVI2/mcBB917Jh4uwLXsYwR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(2906002)(91956017)(478600001)(5660300002)(33656002)(86362001)(4744005)(26005)(6506007)(122000001)(186003)(38100700002)(8936002)(8676002)(38070700005)(71200400001)(54906003)(83380400001)(110136005)(76116006)(66946007)(66446008)(66556008)(66476007)(316002)(64756008)(2616005)(6512007)(36756003)(6486002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWRNRTVaQ21xSzd4aEhxTmJXWHpmaElRb01jSXQ5OHFVNHhuRU91TmhCMDFN?=
 =?utf-8?B?OFNNdXRnK3NiSVJuNEtpYkNOTmd2UytEZWYxNTRuN0haT3FnYlNuaHMwWUt6?=
 =?utf-8?B?QmJUSkhhbnpLVHlOR1hhQXJ0UC9kTmt4NjlrZmdyK3ZabVUySjIrU0wvMU45?=
 =?utf-8?B?SzVXMU1RT01DYThtNlgxazg4WmJDcUN0S1N4SFZpRGlDcWpOc3k5R3JCL3hH?=
 =?utf-8?B?QVpvSGNIb2drVUwvaDNhOERaaGZKYnpqRCtJTnV0UXEyRFpoUE9zSmpROVlH?=
 =?utf-8?B?SlE1RzVvd2UybThhdEZwb0ZOb0U3a1lFcnF6NEgwVDBkeVFZVGJvWmEzeUVj?=
 =?utf-8?B?ejRISFoyTXBBLzZaNEVGY1lSZGRHT085bWZZcjVZMjVwWkI0bGY5M0J1YXov?=
 =?utf-8?B?T2VBZkU1eTJSN3ZPMlUyazdBTDFOT1lMSGx1Uk1SRml4V2xDbktBWnQzMXhN?=
 =?utf-8?B?bUVPaitCL0Q4L1NFdVJscWRQZEFPd1h0QjYvWWJZY2FTVGRpWlI3S2c2UGhJ?=
 =?utf-8?B?eEUwUkpwdkVNUWF6TkgxaVhaZ0FmOFJITWVQQ1RVZjRJWDErVTVLK3dmOXQr?=
 =?utf-8?B?dDAxUUR4bDRzS05jTXRoTUdsWU5OYlVLUjNONjJid0NWRTNGcFRUa3NVaU52?=
 =?utf-8?B?NTZmZGprUjdxeVZEQVZMN2plVENxaUZid2xnUzVYcFJ6RkNCSXhLREdud1RD?=
 =?utf-8?B?cFQ2M0k4TGw3VFY5NTJVa3ArdjBoN3NmTFl3TGVEMFBWT3NVN1dlZ0RFRlQ2?=
 =?utf-8?B?d1NGQzBWZmZoV1gxY1d0eGZvazA3RWFTTG5JZzg5dmEyNU51OUJXMlJqWGh6?=
 =?utf-8?B?RncvR1VpcmF4MGMrYmFWZ1NtdzdTODBoTGlUYzlkc3NCWUZ4dHY0d2ZrTm05?=
 =?utf-8?B?djN0WnR0enIycUs2NFRqbTlOWWp4MGRpUytiRjhtQytlMVBtTG55WGRMUnJE?=
 =?utf-8?B?eE1lRU50cEJKNWM0aEMxdUJrU05YWmllYUpxVkhYMUdrRHNkWFdrRGh6MXBm?=
 =?utf-8?B?TEE3RWxPRDRvcjd1NHVNRzdFTzd3ZkdzRjJGMWNQZmJNamJDNFRhOHNwNEhR?=
 =?utf-8?B?eElEYmJSUCtVTjBuMWcyVDJQMGlIcEtTQlNpZGdhUGlESHV4Ukh4ZlpScUJh?=
 =?utf-8?B?Z3p6bmtkZTJTdVlRRG5zZ1VvbGdnNlFOZmZRSy9FRXd0WkxlZXpjZlBQNy95?=
 =?utf-8?B?KzVudklZenpMcGIwbEhMSzNCUEF4K252OENtN0U2U0FjL2g2bXBta1NEUG9h?=
 =?utf-8?B?QVBNMGNKTTNLdDNnVmd5UlJQSnM5eEc0SW00NGY0alpyS1lLQ2pHTytEaHE3?=
 =?utf-8?B?dzZBTWpNQXZjZFNZVll5OEoyUXJQMG1GcjFuM0l5Zy8wbERUc2hPUVFOZndQ?=
 =?utf-8?B?MzQ4ZmNDTTREUlhHeHFwanE3V29EMnRKZjNabmFkYktSZnZNNDUzd0xjb20z?=
 =?utf-8?B?YXlHT1A4Y01OcnlqUW1MUjZBcXV0RzZGWmlVMDFRNUM2ZVEyQ1dhQVAvZ0tU?=
 =?utf-8?B?c1Vwb1c1Y1V1M2RPZ2Eva1dWdk9EajM4WktRQWhiQmY3UUNFWkhlL2d2NUVP?=
 =?utf-8?B?RnJFaHQ2WUNrNTZVMmRFaktWdUVmOFJuUmxPS3JTT0FnN3JDcUUyOUVINTJw?=
 =?utf-8?B?RTBCZnNqY29wbjdFL0d0bmxzTFNKWFJSeHFhSGxrODRQWGxmVFdsZzVUS3d4?=
 =?utf-8?B?OEVXZEdFOGxTQjUvenlsUVhtbGtadi9iak14d3h4bFl6d0VyVHRCSTdxaWF0?=
 =?utf-8?Q?BUaLFnBn12k1W9jlY9/jJMlCQc21Jir3d7JM8d7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCC4D92C766BD34B8EBE59D798DA3632@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75974e69-22c3-4cd6-9e07-08d96ea709cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2021 06:49:55.1168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4jwBxyxh+e8kKQ5VjsRIARN1YYjUGZAI407xyOWHnPKCNjXEiwM+pj4QJUUQ1Nc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5039
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

TGlrZSB2Y2UvdmNuIGRvZXMsIHZpc2libGUgVlJBTSBpcyBvayBmb3IgaWIgdGVzdC4NCkFuZCBp
biBpYiB0ZXN0IHN0YWdlLCBWUkFNIGlzIHN1ZmZpY2llbnQuDQoNClNpZ25lZC1vZmYtYnk6IHhp
bmh1aSBwYW4gPHhpbmh1aS5wYW5AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91dmQuYyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdXZkLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dXZkLmMNCmluZGV4IGQ0NTFjMzU5NjA2YS4uMWMwOTliNzlkMTJjIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmMNCkBAIC0xMTc4LDcgKzExNzgsNyBAQCBpbnQgYW1k
Z3B1X3V2ZF9nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90
IGhhbmRsZSwNCiAJaW50IHIsIGk7DQogDQogCXIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2VydmVk
KGFkZXYsIDEwMjQsIFBBR0VfU0laRSwNCi0JCQkJICAgICAgQU1ER1BVX0dFTV9ET01BSU5fR1RU
LA0KKwkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLA0KIAkJCQkgICAgICAmYm8sIE5V
TEwsICh2b2lkICoqKSZtc2cpOw0KIAlpZiAocikNCiAJCXJldHVybiByOw0KQEAgLTEyMTAsNyAr
MTIxMCw3IEBAIGludCBhbWRncHVfdXZkX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwNCiAJaW50IHIsIGk7DQogDQogCXIgPSBhbWRncHVf
Ym9fY3JlYXRlX3Jlc2VydmVkKGFkZXYsIDEwMjQsIFBBR0VfU0laRSwNCi0JCQkJICAgICAgQU1E
R1BVX0dFTV9ET01BSU5fR1RULA0KKwkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLA0K
IAkJCQkgICAgICAmYm8sIE5VTEwsICh2b2lkICoqKSZtc2cpOw0KIAlpZiAocikNCiAJCXJldHVy
biByOw0KLS0gDQoyLjI1LjENCg0KDQo=
