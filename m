Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879617FD64F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D91910E4DF;
	Wed, 29 Nov 2023 12:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE45A10E4DF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:07:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3ATAhsPm002943; Wed, 29 Nov 2023 12:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=WBMU2ExgIgrNLVLhp8hT69rb17OtEcn6R5iqXRf/TIs=; b=
 hQVszLPRsj0enxMEjivmFao9DAaUeOmjMD1oNsSgG4ZcWcKmTRJG1/oqu2okkR3a
 NKvUeBLvLJKEv1GStnW/tjbXX4NWxPQIDdGbUHzl3Gi4Gysuxmkl6PLf9Am+Hb9c
 6OGSrOTboXlKDJFjYB15EAuTqvOqn8zoU6u/GriqcdT2wzwm9A04c0qlhMJDxRYW
 DzD4QbfO9LhZfvbuybhctSCpXAzjTAvkvNRUuPIt2IUetgReTlxtvw1ICAuakw6J
 ER7opLJbaIfBzE6wZoQGrI/JbMNzhivhGUfDf1JDI3FMeUDtnqP4EIxwYdxayzEq
 7CRBdHBUT/ebgKrz29b/Og==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3unvk1r9fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 12:07:40 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 12:07:39 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 Nov 2023 12:07:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAHVWLeJVhsZqwr7qN1dDHCQZ+ANq218GKFoK3mHxaDS8PdS9pyITLMsG13kLal/sqx96nnr0d3GGoaIRBSXdjwdwyjZ7MrTJeKb6tf3vs82Zf/GpHWVzco0x0YKE4hfdq9FdPfq3aMOYIFZMzOtwP7Z2mq2hdfrOxbAf5FmpLmQaPO0/RfV9goD8R+NFNICXd+VPcXawalCD84QGqQNX9ZM4gUAO0Rg17IidxwBsMxKksr80ECQ8CxkIpGQk9OwM73+WJ7xP85elgnDUpCweLPJeuPaX/OnewaW2wKdiqwQyh09tkEOt7MvE7fnjep/U5UxNVLxb1arzVy4qgJuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBMU2ExgIgrNLVLhp8hT69rb17OtEcn6R5iqXRf/TIs=;
 b=G/0er3PsxNWyBa8kISwYHbtBtjNyiiTNVmLTDvdgoW8pdJmHNnmL7dGBazHdQSeGnk74Z3ZJlw3GL5mWDqUaAKWi5maNcKfWXH3IXdV3+CLzk6ZRJsN78W5aKdB2D1ZTljmcBgpt/Rd7nNnloQIbl1STTRArWAP0FoFAvNexJAmQI1pr5HpKoyHjc6IzakBe6G6TANFNQRnondUZ4SW0M+HrETewAe6Ho5v1eQQrlnb5S7ipfHJAl+1A79iKRueELvTyUw1Mzf0DV+eL8IaMdWcsIgEMTTN4jLyJGYYOnSEntEsqJ2cbEWBH6kFlAcvMTjYuvkWclhekHvx/fx4r6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBMU2ExgIgrNLVLhp8hT69rb17OtEcn6R5iqXRf/TIs=;
 b=fCWqvFrd8N94NfdBmJl8MoPQvtEs4UnLs34mAiFJzEb0Sqee3X0+Ytd/U6MkOFf/CFtsehLfQooVabPfUxKZuNSkXlCh6Z2iNYaechh6jBoWiXVzT8VmEUFrkGgi4cUrTwMF9TexfjT1tpTIzPAfM4XtwGjIohVB35+PTDWLLTI=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO3P265MB2298.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:105::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 12:07:37 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 12:07:37 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: Frank Binns <Frank.Binns@imgtec.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "arnd@kernel.org" <arnd@kernel.org>
Subject: Re: [PATCH 1/2] drm/imagination: avoid -Wmissing-prototype warnings
Thread-Topic: [PATCH 1/2] drm/imagination: avoid -Wmissing-prototype warnings
Thread-Index: AQHaIriYtZwRtwf+h0e+JwKOlPpznbCRM9eA
Date: Wed, 29 Nov 2023 12:07:37 +0000
Message-ID: <f541c6e55705ffb76e51dd906164c1a92bb87af2.camel@imgtec.com>
References: <20231129113825.2961913-1-arnd@kernel.org>
In-Reply-To: <20231129113825.2961913-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|LO3P265MB2298:EE_
x-ms-office365-filtering-correlation-id: 844a7a23-92d4-4480-c3ea-08dbf0d3c765
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fb+jqsor143U0aKvJ8ugIZxmI/+x4RFSDNUMOEWeaI3tMdmta4r+N45AUFQnoykRNcplq2LE8yndlVUMZFQuYT5TIjD1YzmpPlQj5ml5ek1V6/TkinhfvMsTm/uHZyVuj7DBw87pkKJnfABrn3na6jxoG+us3ZK/9cvKAl4GpVl2OADUvXiRWUb4GLVyAQRpnroO6Y0q+1x1CXQQeHczNTETb3GbG8WXGT5ItzF6gt+SbwrhAba2DE33t0F/lsrRnBSJbBM8kqKBE9Y8YSSSyOzOMF1U7iCx1QCj8dv0KBWiH7kXnJmHTuJsbJOtoQBbzWhAv5hq+ytJvqlQy8MhSZI3gYoUiMV2LT98dnymavOZMevyfv2SoWTbEcnxCPCTLmKfRqcguFGDh1noYiXaEV1cxMfAxyb1JXtE/z+/pUvaJRol3zrKCgulSlDdTSc5cVng0CrNUkB5ZQBkR3HH5EkL7uZVZvKIfe3wLTlWLX9YXDpL7Dt6UD6KhddL0cwSEzcPcqvOrwD89w0ISpnPdwIFRjf/lovn28/Gd85sXF5Q7nANv7hx6NzMyZvK2T7HUoJew+rJkIh0IylDk2O6PYbyzl1TRH9LNWU7OuQc7gdJ1ggCc3z1cH9qCdIN7PyBdIgBWPT+5vR8jGOfXg/9BeX14EX3HJcg4b5lFRn7opU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39850400004)(396003)(346002)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6512007)(83380400001)(38100700002)(8676002)(122000001)(54906003)(86362001)(316002)(5660300002)(7416002)(110136005)(76116006)(64756008)(66556008)(91956017)(66476007)(66446008)(66946007)(4326008)(4001150100001)(71200400001)(6506007)(2616005)(2906002)(478600001)(41300700001)(6486002)(8936002)(36756003)(38070700009)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzRwNVArNDFyamFYT21mVWpMTnBjazFwRTBmSWhoTU9GL0NQYlVFd3oxZXN3?=
 =?utf-8?B?TllWS1JYZU16bFVRd0dFU251QTNXZ0dRdUNtei9vcG4xMlVDQWtCZHlJOHM1?=
 =?utf-8?B?L09TUU1SUis0THhyd0pvSGs1aUFuUjhqSXMxd2lTZVRCSnhrN3ZLNk5BVDBZ?=
 =?utf-8?B?eTFKRHRWUENFMStnckhhdEdzVHpzZU9vQUUwYUZUdHR3T1NCaklKNFJXOW1x?=
 =?utf-8?B?bUEwS2ZUUk1Gc0xPUE5GajQwMlUwcG5BOVNqRnZJU0tXTnEyVzN0UjEwU1Z0?=
 =?utf-8?B?eElaaWt4YXNNUXdVaW1HNloyUEVMcEFZRFlWM1hUVmhheFpEMEdwa1FDK1VN?=
 =?utf-8?B?Vi90S1pHeDBXSW42ZktJWFlkQVo2QWpEbFo5TWdCNWtRYTZGbFNldXF3cytn?=
 =?utf-8?B?ZFdKMEgrbTBpeTlSUUZlU3dZd0xyTTlZcEsreFI3QU5yeDdzNVN4SnpvblRY?=
 =?utf-8?B?Q3NSeG9CK2FadUtXR3NLUDI4aXZ5V0M3L1dZQ1dHNDZONFZJQlRqNWowRGd4?=
 =?utf-8?B?R0F3WUhyODdBYVNpSVA5N2s5aHg2Vk5mWGFhRmorczIrK2RaSE1wbVB5ZFd0?=
 =?utf-8?B?eXEzQ0NFUERNYmF1aHA4MGEwVW9wd21jeHlONHl1Ym1kRWwxYy9tMXh5VmZ3?=
 =?utf-8?B?cGZPcU5mU3ZwbzEyNnBncnVsVVpJZG10aWJTRWJvTGhvZ09QaStOZzdTSGpU?=
 =?utf-8?B?RUVUOG1uZlZrTUNaU2tteXI3YkJoaDVZNlZUOEhYNnpKQXg5eE10Q3VzTjd1?=
 =?utf-8?B?R3JhNVRhSGlTWmZPa0hrWUZuVjVDMDB5ZU85WmZKZ2dsMDFJWEU0UHBkek4z?=
 =?utf-8?B?dnBoL3FXOUpLTlp2aTQvUklta0RCWGZHcEcyWGxoQ09uQ2FZc3pXcTZ3MFlI?=
 =?utf-8?B?RzRSYXhRakhLTmp2VmFUU3A4emtiQ2c2dlJhT1VBRTlSaDRKU0lKMHVOZ2xT?=
 =?utf-8?B?UzE0Q0pHQXB5VkVhajJoRUZ3VFpHWVhPdzkzOEFDTXowUHNZOWhEWFlPby81?=
 =?utf-8?B?TjljVVhYZVhiQk1LaUNCdU4xNElUak1PTXRudXB0QWpiY1doZTBlSURoTEJw?=
 =?utf-8?B?U0wyeFZFczg4MlRyQWZoQ29wNFJVdFZqdmp0MFB3WVpnNGVuOFNQU3F0NnMx?=
 =?utf-8?B?RHdzTFFPNUplU1dhREpGUEFxR2U5VDR5TDRlQk9LblNuWkd0YzJRYzBUMXRG?=
 =?utf-8?B?T0hRRUlWMmUxTmhuMWVNM0NUeHczZXBpZytma1JSNVk0cjRzWHBqUDFkNGFE?=
 =?utf-8?B?NEJvbFREejc5aEVTVDVGMEpjUStPMDIrbFBUR0VyWkVKQjlLZUNMSzhXZEZK?=
 =?utf-8?B?aFlVV2dVU0piUjVrYUg4UithMFBDRHkyU2Q3eTZiSTd2cWJTNU9hZWZyN3RN?=
 =?utf-8?B?eHJlaksvbHdUSEIyWmYvSGFRZkROOFAvUkVtK3dndERJTWRKVGZKUWJoK0Zy?=
 =?utf-8?B?aGZTM3VpSEtCc1hrSGcrSTYzY1RxWXc0R1BndkVqMnNZNG5CZTBIdmxqM0c0?=
 =?utf-8?B?YTdDNUdxa3BKeFpWb25JRWFmWnFzSnorUXFhbEtQbFZNMENZNjllQVpGS0gr?=
 =?utf-8?B?SVZKaEFKYU1DMHhOSEdadFlUSkxOU3Q4bENzR0pGRkRTVVptWHFLMzlmcGFr?=
 =?utf-8?B?RVBJWjlFQTlrVGxPaERBcnMrKzRnZUdqYlpSbGtkQnBWK0FRYmZDSUR5Z1N4?=
 =?utf-8?B?WExiSnBGcWxheHZsWG1KQW0xdGNqMkM3ZzNxZVRNRVdxc3hYUjcreGVFd2Z1?=
 =?utf-8?B?UHg0QnhFYmZPV3I5Q2pFSVVxdU4yQ1BQem9qUkkrUFlyN1RQY29FcHBtTEc3?=
 =?utf-8?B?Vitmb1FiQ2lER1l6OU1BNXcvcnJJQUxWRDVhbTFuNHlGZlFNQVI3MVNSZ1M0?=
 =?utf-8?B?VjF1REZJejM3ZG1EN2gxMkQ1REFwc01DRGtzYjZaNytQNU5Tb0tZUVpJaFhi?=
 =?utf-8?B?RFVvYTdjeEQxdnZFSlYyRkdGQStjZzhxYmYwc2dXMU9DQlpQSWgyb0dWdVJw?=
 =?utf-8?B?Wkg2WVpGTHpnSnE4MUFoWFRLMGk4R2p2NjdJUzdHenhuVUpjMHJpUHBoTEQz?=
 =?utf-8?B?a0N0ZXRCdTVDRWZyU1hCblRLTndTK1pmbjN5enRJb1JBYkVHb0kzSE1INEh4?=
 =?utf-8?B?WFpyU1NYTGpHTG5nN0NwT0dTMzFBQml1SlVieWtwMnJRS04wYm5pY01wNTk0?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CC251F5831EB6478337C1DB89C6C8F7@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 844a7a23-92d4-4480-c3ea-08dbf0d3c765
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 12:07:37.7069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3akSk29ampYA+pTohnX28vdnFAm3Kn+m/xcgfBW+kdVtZv8CbQ3rqDvmbHOGXnpiGpV6DPEIyiFKlcvZ4edSuE9VorE0BOV6jeqVfsy7PUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2298
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 54c8-Te_sJR5W7ysnRUSgYd3VCdgfIUG
X-Proofpoint-GUID: 54c8-Te_sJR5W7ysnRUSgYd3VCdgfIUG
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gQXJuZCwNCg0KVGhhbmtzIGZvciB0aGlzLiAgSG93ZXZlciwgSSBmaXhlZCB0aGVzZSBp
biBhIHBhdGNoIGEgZmV3IG1pbnV0ZXMgYmVmb3JlIHlvdSBzZW50DQp5b3Vycy4gIEknbSBub3Qg
c3VyZSB3aGF0IG5vcm1hbGx5IGhhcHBlbnMgaW4gdGhlc2UgY2lyY3Vtc3RhbmNlcywgYnV0IGFz
IG15IHBhdGNoIGhhcw0KdGhlIGtlcm5lbCByb2JvdCB0YWdzIGFuZCBhIGZldyBhZGRpdGlvbmFs
IGZpeGVzLCBJIHRoaW5rIHdlIHNob3VsZCBwcm9iYWJseSB1c2UgdGhhdA0Kb25lLg0KDQpUaGFu
a3MsDQpEb25hbGQNCg0KT24gV2VkLCAyMDIzLTExLTI5IGF0IDEyOjMzICswMTAwLCBBcm5kIEJl
cmdtYW5uIHdyb3RlOg0KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiAN
Cj4gVGhpcyB3YXJuaW5nIG9wdGlvbiBpcyBub3cgZW5hYmxlZCBieSBkZWZhdWx0LCBjYXVzaW5n
IGEgZmV3IGJ1aWxkIHJlZ3Jlc3Npb25zDQo+IGluIGNvbWJpbmF0aW9uIHdpdGggdGhlIG5ld2x5
IGFkZGVkIHB2ciBkcml2ZXI6DQo+IA0KPiBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZy
X2RldmljZS5jOjEzMDo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAncHZyX2Rl
dmljZV9wcm9jZXNzX2FjdGl2ZV9xdWV1ZXMnIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlc10N
Cj4gICAxMzAgfCB2b2lkIHB2cl9kZXZpY2VfcHJvY2Vzc19hY3RpdmVfcXVldWVzKHN0cnVjdCBw
dnJfZGV2aWNlICpwdnJfZGV2KQ0KPiAgICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4NCj4gZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9md19tZXRhLmM6
MzM6MTogZXJyb3I6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ3B2cl9tZXRhX2NyX3JlYWQz
MicgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQ0KPiAgICAzMyB8IHB2cl9tZXRhX2NyX3Jl
YWQzMihzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldiwgdTMyIHJlZ19hZGRyLCB1MzIgKnJlZ192
YWx1ZV9vdXQpDQo+ICAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fn5+DQo+IGRyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfdm0uYzo1NDI6NjogZXJyb3I6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3IgJ3B2cl9ncHV2bV9mcmVlJyBbLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNdDQo+ICAg
NTQyIHwgdm9pZCBwdnJfZ3B1dm1fZnJlZShzdHJ1Y3QgZHJtX2dwdXZtICpncHV2bSkNCj4gDQo+
IE1hcmsgcHZyX2RldmljZV9wcm9jZXNzX2FjdGl2ZV9xdWV1ZXMgYW5kIHB2cl9ncHV2bV9mcmVl
IHN0YXRpYyBhcyB0aGV5IGFyZSBvbmx5IHVzZWQNCj4gaW4gdGhlIGZpbGUgdGhleSBhcmUgZGVm
aW5lZCBpbiwgYW5kIGluY2x1ZGUgdGhlIGNvcnJlY3QgaGVhZGVyIGZvciB0aGUgcHZyX21ldGFf
Y3JfcmVhZDMyDQo+IGRlY2xhcmF0aW9uLg0KPiANCj4gRml4ZXM6IGVhZjAxZWU1YmEyOCAoImRy
bS9pbWFnaW5hdGlvbjogSW1wbGVtZW50IGpvYiBzdWJtaXNzaW9uIGFuZCBzY2hlZHVsaW5nIikN
Cj4gRml4ZXM6IGNjMWFlZWRiOThhZCAoImRybS9pbWFnaW5hdGlvbjogSW1wbGVtZW50IGZpcm13
YXJlIGluZnJhc3RydWN0dXJlIGFuZCBNRVRBIEZXIHN1cHBvcnQiKQ0KPiBGaXhlczogZmY1ZjY0
M2RlMGJmICgiZHJtL2ltYWdpbmF0aW9uOiBBZGQgR0VNIGFuZCBWTSByZWxhdGVkIGNvZGUiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmMgIHwgMiArLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9md19tZXRhLmMgfCAxICsNCj4gIGRyaXZlcnMv
Z3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYyAgICAgIHwgMiArLQ0KPiAgMyBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmMNCj4gaW5kZXggODQ5OWJlY2Y0ZmJiLi4wNDhlYmE3
NzZjZjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2
aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuYw0K
PiBAQCAtMTI3LDcgKzEyNyw3IEBAIHN0YXRpYyBpbnQgcHZyX2RldmljZV9jbGtfaW5pdChzdHJ1
Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gICAqIFRoaXMgaXMgY2FsbGVkIGFueSB0aW1lIHdl
IHJlY2VpdmUgYSBGVyBldmVudC4gSXQgaXRlcmF0ZXMgb3ZlciBhbGwNCj4gICAqIGFjdGl2ZSBx
dWV1ZXMgYW5kIGNhbGxzIHB2cl9xdWV1ZV9wcm9jZXNzKCkgb24gdGhlbS4NCj4gICAqLw0KPiAt
dm9pZCBwdnJfZGV2aWNlX3Byb2Nlc3NfYWN0aXZlX3F1ZXVlcyhzdHJ1Y3QgcHZyX2RldmljZSAq
cHZyX2RldikNCj4gK3N0YXRpYyB2b2lkIHB2cl9kZXZpY2VfcHJvY2Vzc19hY3RpdmVfcXVldWVz
KHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBwdnJfcXVldWUg
KnF1ZXVlLCAqdG1wX3F1ZXVlOw0KPiAgCUxJU1RfSEVBRChhY3RpdmVfcXVldWVzKTsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZndfbWV0YS5jIGIvZHJp
dmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9md19tZXRhLmMNCj4gaW5kZXggMTE5OTM0YzM2
MTg0Li5jMzliZWI3MGMzMTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5h
dGlvbi9wdnJfZndfbWV0YS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9w
dnJfZndfbWV0YS5jDQo+IEBAIC00LDYgKzQsNyBAQA0KPiAgI2luY2x1ZGUgInB2cl9kZXZpY2Uu
aCINCj4gICNpbmNsdWRlICJwdnJfZncuaCINCj4gICNpbmNsdWRlICJwdnJfZndfaW5mby5oIg0K
PiArI2luY2x1ZGUgInB2cl9md19tZXRhLmgiDQo+ICAjaW5jbHVkZSAicHZyX2dlbS5oIg0KPiAg
I2luY2x1ZGUgInB2cl9yb2d1ZV9jcl9kZWZzLmgiDQo+ICAjaW5jbHVkZSAicHZyX3JvZ3VlX21l
dGEuaCINCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYw0KPiBpbmRleCAyYWFiNTM1
OTRhNzcuLjMwZWNkN2Q3MDUyZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
dm0uYw0KPiBAQCAtNTM5LDcgKzUzOSw3IEBAIHB2cl9kZXZpY2VfYWRkcl9hbmRfc2l6ZV9hcmVf
dmFsaWQoc3RydWN0IHB2cl92bV9jb250ZXh0ICp2bV9jdHgsDQo+ICAJICAgICAgIChkZXZpY2Vf
YWRkciArIHNpemUgPD0gUFZSX1BBR0VfVEFCTEVfQUREUl9TUEFDRV9TSVpFKTsNCj4gIH0NCj4g
IA0KPiAtdm9pZCBwdnJfZ3B1dm1fZnJlZShzdHJ1Y3QgZHJtX2dwdXZtICpncHV2bSkNCj4gK3N0
YXRpYyB2b2lkIHB2cl9ncHV2bV9mcmVlKHN0cnVjdCBkcm1fZ3B1dm0gKmdwdXZtKQ0KPiAgew0K
PiAgCWtmcmVlKHRvX3B2cl92bV9jb250ZXh0KGdwdXZtKSk7DQo+ICB9DQo=
