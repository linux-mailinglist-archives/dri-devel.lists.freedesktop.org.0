Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BF87D84EB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 16:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D21E10E7FD;
	Thu, 26 Oct 2023 14:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233BF10E7FD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2f9jxCq49cluu4WTI1/jeOZC7Q7edbmUxSX7Q/eqHkEb+qy2dhDoSE6uPgy9jzdV3r3iwRNm+EPWjqt//x/OF+/JeKHgUajhJShuFd7nY/USwaDFFzZDjLpnczUpmNqiFdfGeeEBd90lK5ViL0BZ1b5Lw/PQ+EU/z3Cn/VzYlEveQi1MiBYu6HzGSXTlrkbE1cOfv9wFT6/VNFe0V2QjU7/R9hzcUN1zaoTsl0DzuIUg7XclXuv7FFWZkpLdQ48q+c6gNlrgSBeim8kn40Y/HDXrY/aBFgqbkhnKIIMK21IFN8S3OTF7F1+J3jodUHVfZIlugJ/FI4DTpJktHPaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8FZqoIqz6bh8UnZilM+3/wwlcHWhzY6cxIbpZ+F5G4=;
 b=RXAe3Gv1m2l8AaGuP0mJWS4USI2BZ/9M3Fq4bkUYkgv1RfxU3dhYSUMFykpyKVsPBpWRAhJH0W0KjKLsHUlYy+SGKH891lS40chsUtNfNCIguSHD2PZ8Qgytyg+Mdh2tI/KoY/d5oaO6+MINGQ8xviByStJeISVKrxnBR6g3FEpGVNRVDvlyHHrcj+WjqSO1ZlDoo+RPtd/1kq0gnaL/k+K4DtrDhsvFOiVOK1pPHJt3BwTCGtfdvdBjQLQOkiuDtDr/v4/WDqQx5gi10etXHvQf096C6ko6eVaTkBgF3/UMMFWt3SS7zUPCmcLl9uBjBRJFSsPjDjr6XNUPm5115A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8FZqoIqz6bh8UnZilM+3/wwlcHWhzY6cxIbpZ+F5G4=;
 b=iImrcn7CS8Yh+enQ88Uni4BXTBYB1TIByHJwrFXtUlvQ7ecY+j7MbW6CXpM/NXXkJLZgJEyDTfYuQ5Uij7+yLXJsYAlvLyjS/gW/1LNtj6U0db32hBcWb1ZQX+rTntXAQzNHNr5mqC0WMTclLztOz0AQzOd7GcISPgIYqRQOBQzNrMwFKlNsg7eTIG8goHSWMLQ1lrPefkcjdiTDq+mWEkyJV0PadKCxYF9L8gej810d96rxFkMHfAgvBU8ZwZXLPb6EeAMpmxn+VKm9FwqMQG/+BiKj2h+WB0KL6I9hY1CkguBCVBsuT2zC5jAvd0bEPpqJYhJol7by1yH1L9PjMg==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by DU0PR10MB6034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 14:37:41 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b6c1:537a:e6c2:8a25]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b6c1:537a:e6c2:8a25%4]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 14:37:41 +0000
From: "Jonas Mark (BT-FS/ENG1-GRB)" <Mark.Jonas@de.bosch.com>
To: "dianders@chromium.org" <dianders@chromium.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: drm/panel: panel-simple power-off sequencing
Thread-Topic: drm/panel: panel-simple power-off sequencing
Thread-Index: AdoIGZn+78j/WD9uTEuaO26ZQdjdBA==
Date: Thu, 26 Oct 2023 14:37:41 +0000
Message-ID: <DU0PR10MB7076C5C33C4F3E9097E372E7ADDDA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|DU0PR10MB6034:EE_
x-ms-office365-filtering-correlation-id: 8fcdf1b2-d7ff-4498-fc13-08dbd6311bd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DqSvTwRdQ15yWliWc66ceMVnpvHFZNHGhS54hFxxHDVjJh1jlAiUCLCCKjWn+pXkjkW5PI0lIE+bu08w1BVv1OIPbmvpWRCPO9dJ6qLyCdg0dzFV3r+iYp8dlsbvVKQ5rJ292Spw94LOJwnlR+vZ4AMQ/OzMXcfSkgGZV3RGN5OFXIQoSMt/K1X4fF4tCzmqIuj0hsUd5BS9ryTvEb59DDU9CIfdrloDI2y2wt+/x3OQoGB9nPgc4aAPpiKDDF4MRWaVrPNXbWvjATQ0nUlNUDvzZoMQ4stlAk6t+trlnCcFbfZeMcTMan9UPRoV3i4vnntskoO/2bJEauVBNGXE322Y61/pO5bGxWbTf9RMqAx//awAmp4z/qlvJXC4KXZrZGE62JXTz5bMS5RCSKt6/sgaFRuk3SS8qKQ23a70Q64AID5GN/oKLDy9SUZcFcAUJE9T0bLYrGYN+5j4RyQ4YIljKcD9eWfo/SyDnC5KSOvNJjeUxTdaUxUGhgrhuezBwZ3JMk32ES1ojET77Jcnek2bxd1X8xYglwNEJLs+M9IX5+rBB4W46PTpojgmXbb2/dowiFWF0mDXH9Y6XXv83bxkx1bLMovGg1FIfPJjnD4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(33656002)(41300700001)(55016003)(4326008)(8676002)(8936002)(5660300002)(52536014)(15974865002)(86362001)(2906002)(38100700002)(478600001)(66574015)(9686003)(82960400001)(107886003)(26005)(122000001)(71200400001)(83380400001)(54906003)(6506007)(7696005)(64756008)(316002)(66556008)(66476007)(66446008)(66946007)(76116006)(110136005)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW9WOVZGenJLZ2ZqczRNM3RpOEJFMDVJY0V5MGV4cjhqb1dxTHl2VTlMcmJi?=
 =?utf-8?B?bUIvRHpkclk2NkZKT1VWS052cjJYK2NENEZNSjJycDB5SCtRWHovdEVVcXZK?=
 =?utf-8?B?dmoxSmZDYzAvYWZuM0ZJOU5LTUtpN0prV1dLa0VzdWsyYVhuamRKRzMwT3BO?=
 =?utf-8?B?VDcxTFRPZ0t2eXM4SVpTN3dPUzVraWpaUXhKemFnelZsQ2k4SVZHSS9aZDdE?=
 =?utf-8?B?ZHN3dmYvMGZ2VmtZbllkZmFhNitYK1plR0xxa0hFa3h1NmV2Uy9qa0xNQUds?=
 =?utf-8?B?TWdOdDBKNnhyMzBVOVdjY0xiYjlKNHlkRHNPQStGNWpIWEdzK01vNktaRGQw?=
 =?utf-8?B?dkJhaEdleEVpU2k0d25qVU5lM2hudENCNjhJWTc4aUZpS2lxSSttSHRQeEdw?=
 =?utf-8?B?UlY5RUlydmRPZ1FVN0I5bkZqYmpSQU9wUEtQajB4cElraUl4a3NPdkVFdFJq?=
 =?utf-8?B?R1NqQ3NJdWpBU0tPSFNEVFNUUVJxMGdTSDZtT1dvOFc5MG51dHVuL3c0T3VJ?=
 =?utf-8?B?bTkxcyt6TEMraFMxZzNyYmh5Q003OEVKUVlQWWJtZ3cwTjBpbDJxelBLTzVw?=
 =?utf-8?B?ak1laW9PUXpZSDVWQ1ZGZmpvWmt0blRaMEordkNHY29UNEdkQ0pqTnNweERr?=
 =?utf-8?B?T3plY2R0cnlna1pjUGVLNjBFdE8vMGczd29hcCs5SUJnMVB1c2RWNjNqbFc3?=
 =?utf-8?B?cDhuZHFVd2lNMHBmR01uV1hVdm82RmJPNjZkUkNDRUMrUEZvQUYrb2tqb2xS?=
 =?utf-8?B?QmJKT1cwc3VTenhYbmpBUm9iVGRlUmtPTmxFMXJtM09PekkxWCsrTklVSlBi?=
 =?utf-8?B?aXdnZklCS2Q5bSt1VUFNWWdjaytxZXpNbDVlQWx6bDhjREF5d3dMYS91amdH?=
 =?utf-8?B?V0JpOXN3NWk1dngxKzNkclZYN0VOTktSRVFyNE9kVDhnWFJZYnUydks0UDd2?=
 =?utf-8?B?aDhqb0lHV1JFQmRWejJEUjRFWlBZOFZaNVpwcFBBMnlvUjRMSGdIU3A3bCsy?=
 =?utf-8?B?RTlVanZVUzFDWUttVTFBaEZ0MDl1NlduU0xKVUVYeUZFaVJNMCtMZ1M3dmN2?=
 =?utf-8?B?NVp5K2RzMW84TkZEbmZTbVFRbjNTNFkzZGsxQWtyNWlrNFRNQlN5QzJpUURp?=
 =?utf-8?B?ZHczcW5ITURiQUVuZHZkSlErTWMzU0pSRUNNYkxOeVdtSTNFWmFzbjUzekcx?=
 =?utf-8?B?aG5zVFJFaEJzbTd6VWwvRUllQ3BsWFNUSytLYk1qTDAxSElRN3M5TDVpWG9P?=
 =?utf-8?B?dmxLTWVrUnFDb2NSQVRBbnlRdW1rMWI4SWczSGNjb3NqazJxbmRucG5IUjd5?=
 =?utf-8?B?bUUwcW95aFR3cm0ydURCTTN1cVJDN2gzcS81aXlEejNNK2hEaEs3Y0o2NHJS?=
 =?utf-8?B?Qk1hZmhJeklDOWFhME5TSW9CcXZiYTNyR3VCZjVqUFhZa2VQZS9xaWNlajd5?=
 =?utf-8?B?NFpVSzUrTk9jMStsMlFxNGlIc3N3R0p5djduUm5JeEV4OG1lWnJibnJTcUFG?=
 =?utf-8?B?MnFWNUVlS2pNOGdwRTkrNUxOaGx0Qk93ZUZMQ3JGZFVQc0lTYzQ4c0J1ampm?=
 =?utf-8?B?VG9MblBjTENvTEZISEV4b04wckZMeEJrTklsdlV6Njd0c0l1b0hEM2VtWWxl?=
 =?utf-8?B?N1ZTaWtnOHFYVXd0em56UnowZ0tsWjRVM2o0OGNya2RGL1hablBpbFhoK3ZJ?=
 =?utf-8?B?c3krSDJNL3FKUGpLOHl2Z0F6OHdoWXlhZW5ETnJycG91MEVSaC9aSGZiMzdx?=
 =?utf-8?B?ck5DQTQxLzc1WU40NUNnRlQrTUxrVkJiR1BabG9UWkowaGEzcWk5RlFnODFu?=
 =?utf-8?B?Vkl2a2dOVjZKR0ZhZmZlbVJiOVpxZWZvSnUybHMwY3Rqb3ZZVVZMdWVycXdJ?=
 =?utf-8?B?QW9Vdm11VkhEaTdBdnZDczhUN3BZd2xiRXhvM05FdVVKRmd0azhDNlEyL3Bt?=
 =?utf-8?B?TTJPSXB5ck5TbnJOZmMraGVUZFdTdUNZakhKUzlPNnRwQUpFT3RuM1E0bmIr?=
 =?utf-8?B?YlRHb1FUUkd1WWpKeXdTN3JIQjdmeTVqU2FMVVJ5MFlMd0NUcE1WdlltOWR5?=
 =?utf-8?B?ejlmWGNMQWpvN0FLdk5Ja1ZBWVg2a3NEZ1U5VzRmVmlGVmZucXJma1VvNXd0?=
 =?utf-8?Q?2UuQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcdf1b2-d7ff-4498-fc13-08dbd6311bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 14:37:41.1783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoCOTkzASxRtNFtCr9FtmVDEG+CL8yHcCGTPT3SiXWMB2CFoZM6HrrZM0r5WhenMReTIxM4CB+FxO4ZZvWeA/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6034
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
Cc: "Simoes Ricardo \(BT-FS/ENG1.1-Ovr\)" <Ricardo.Simoes@pt.bosch.com>, "Jonas
 Mark \(BT-FS/ENG1-GRB\)" <Mark.Jonas@de.bosch.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCldlIGhhdmUgYSBwYXJhbGxlbCBMQ0QgcGFuZWwgd2hpY2ggaXMgZHJpdmVuIGJ5IHBh
bmVsL3BhbmVsLXNpbXBsZS4gVGhlIHBvd2VyLW9mZiBzZXF1ZW5jZSBzcGVjaWZpZWQgaW4gdGhl
IGRhdGFzaGVldCByZXF1aXJlcyB0aGF0IHRoZSBlbmFibGUtZ3BpbyBtdXN0IGJlIGRlYXNzZXJ0
ZWQgZm9yIGEgbnVtYmVyIG9mIFZTWU5DIGN5Y2xlcyBiZWZvcmUgc2h1dHRpbmcgZG93biBhbGwg
b3RoZXIgY29udHJvbCBzaWduYWxzLiBTZWUgdGhlIGRpYWdyYW0gYmVsb3c6DQogICAgICAgICAg
ICAgICAgICAgICAgICBfXyAgX18gIF9fICBfXyAgX18gICAgDQpDTEssIFZTWU5DLCBERSwgSFNZ
TkM6ICBfXz48X18+PF9fPjxfXz48X19cX19fX19fX19fX19fX19fX19fX19fDQogICAgICAgICAg
ICAgICAgICAgICAgICBfX19fX18NCmVuYWJsZS1ncGlvICAgICAgICAgIDogICAgICAgIFxfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KU28gZmFyLCBpbiBrZXJuZWwgNS40IHdl
IHJlbGllZCBvbiB0aGUgdW5wcmVwYXJlIGRlbGF5IHRpbWUgZm9yIG1ha2luZyBzdXJlIHRoYXQg
dGhlIGVuYWJsZS1ncGlvIHRpbWluZyByZXF1aXJlbWVudHMgYXJlIGZ1bGZpbGxlZC4gVGhhdCBp
cywgdGhlDQpwYW5lbF9zaW1wbGVfdW5wcmVwYXJlKCkgd291bGQ6DQoNCjEuIERlYXNzZXJ0IHRo
ZSBlbmFibGUtZ3Bpbw0KMi4gU3dpdGNoIG9mZiB0aGUgdm9sdGFnZSByZWd1bGF0b3INCjMuIFdh
aXQgZGlzcGxheV9kZXNjLmRlbGF5LnVucHJlcGFyZSBtaWxsaXNlY29uZHMNCg0KQWZ0ZXJ3YXJk
cyB0aGUgSVBVIHdhcyBzaHV0ZG93biwgYW5kIGFsbCB0aGUgY29udHJvbCBzaWduYWxzIHN0b3Bw
ZWQuIA0KDQpCdXQgd2l0aCB0aGUgYmVsb3cgY29tbWl0czoNCg0KIC0gMzIzNWIwZjIwYTBhNDEz
NWU5MDUzZjExNzRkMDk2ZWZmMTY2ZDBmYiAgDQogICAiZHJtL3BhbmVsOiBwYW5lbC1zaW1wbGU6
IFVzZSBydW50aW1lIHBtIHRvIGF2b2lkIGV4Y2Vzc2l2ZSB1bnByZXBhcmUgLyBwcmVwYXJlIiAN
CiAtIGU1ZTMwZGZjZjNkYjE1MzQwMTljNDBkOTRlZDU4ZmQyODY5ZjkzNTkgDQogICAiZHJtOiBw
YW5lbDogc2ltcGxlOiBEZWZlciB1bnByZXBhcmUgZGVsYXkgdGlsbCBuZXh0IHByZXBhcmUgdG8g
c2hvcnRlbiBpdCINCg0KVGhlIGVuYWJsZS1ncGlvIGlzIG5vdyBkZWFzc2VydGVkIGluIHBhbmVs
X3NpbXBsZV9zdXNwZW5kKCksIHdoaWNoIGlzIGNhbGxlZCBzb21lIHRpbWUgYWZ0ZXIgdGhlIGRp
c2FibGVtZW50IG9mIGNvbnRyb2wgc2lnbmFscyBhcmUgc3RvcHBlZDoNCiAgICAgICAgICAgICAg
ICAgICAgICAgIF9fICBfXyAgX18gIF9fICBfXyAgICANCkNMSywgVlNZTkMsIERFLCBIU1lOQzog
IF9fPjxfXz48X18+PF9fPjxfX1xfX19fX19fX19fX19fX19fX19fX18NCiAgICAgICAgICAgICAg
ICAgICAgICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fDQplbmFibGUtZ3BpbyAgICAgICAg
ICA6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxfX19fX19fX19fX19fDQoNCldpdGggdGhl
IGxhdGVzdCBwYW5lbC1zaW1wbGUsIGlzIHRoZXJlIGEgd2F5IHdoaWNoIGFsbG93cyB1cyB0byBk
ZWFzc2VydCBlbmFibGUtZ3BpbyBiZWZvcmUgdGhlIGNvbnRyb2wgc2lnbmFscyBzdG9wPw0KDQpN
aXQgZnJldW5kbGljaGVuIEdyw7zDn2VuIC8gQmVzdCByZWdhcmRzDQoNCk1hcmsgSm9uYXMNCg0K
QnVpbGRpbmcgVGVjaG5vbG9naWVzLCBQYW5lbCBTb2Z0d2FyZSBGaXJlIChCVC1GSVIvRU5HMS1H
cmIpDQpCb3NjaCBTaWNoZXJoZWl0c3N5c3RlbWXCoEdtYkggfCBQb3N0ZmFjaCAxMSAxMSB8IDg1
NjI2IEdyYXNicnVubiB8IEdFUk1BTlkgfCB3d3cuYm9zY2hzZWN1cml0eS5jb20NClRlbC4gKzQ5
IDg5IDYyOTAtMTIzMyB8IFRlbGVmYXggKzQ5IDg5IDYyOTAtMjgxMjMzIHwgTWFyay5Kb25hc0Bk
ZS5ib3NjaC5jb20NCg0KU2l0ejogU3R1dHRnYXJ0LCBSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJp
Y2h0IFN0dXR0Z2FydCBIUkIgMjMxMTgNCkF1ZnNpY2h0c3JhdHN2b3JzaXR6ZW5kZXI6IENocmlz
dGlhbiBGaXNjaGVyOyBHZXNjaMOkZnRzZsO8aHJ1bmc6IFRob21hcyBRdWFudGUsIFBldGVyIEzD
tmZmbGVyLCBIZW5yaWsgU2llZ2xlDQoNCg==
