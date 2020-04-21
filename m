Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF11B2A82
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A086E09A;
	Tue, 21 Apr 2020 14:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C156E09A;
 Tue, 21 Apr 2020 14:54:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYlmDHfO0u1PKyMSBLX7TKAmYyqrv02DAWtMktwJPl+nzhUPS2sDBqkdoJvojYZmy0NgshE9JsbReIjJSeIHQuRhkA3kPrnUFAXvOaYhH9CvrhPzDg3CBoZhQdFvKcx8mw5FTpw7zGlpvgsDFKT6QuNJnz78H7KusueSJwkvHtLfvSaLkx+yqbV0l7sTRe7YWnadIdJVNxH8FJoVoZ9xQRVcdybYa5HWq8b0K5YflSSKq0MMy4w+5LdR0JJKcpqmCXte7oMZBqyE8Yewy3kFiWT8lrZm+1rnKd7zFZh6eckGthBDojnDhQk0vkKNX9JrOIHZ+wHdmZ+UBo2T+KdWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJaGMag7E/9msg3SpoiF8BjPkw91dGGcCCMm6BmDFhE=;
 b=TwxXVknDeNfEyZ9/IA8BxN7fVFsU1N1Uqk1mAynQyTvMv/eULmqy/CHF4kNawtT8jzesueBtXfQyryh98pzmDPIA8pYx3NC53zNq3KUT0jsT36C013RiykSVOsFBtwspnH2HMYOchvoM2lvQVrm2ThfesWudpAvbLmYqXriTCH8mn3o1yApBgipGA5oMhQZzy/GKRYib4gMP4CoohQxFj9IrzeXEJeu+hkWyYrr9gI7z5McPaiaXvE0W0+yOL1unV2INuegwhWr/oGa6ePSAV3rrk6aBlG06oFcgODY7dq/Q+uBOXALaFiR3w0QKKnAcSwyt7mcc2f7t+c8qvWmLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJaGMag7E/9msg3SpoiF8BjPkw91dGGcCCMm6BmDFhE=;
 b=fX12I1vy13B8BpmRnb2MBADjFdQIu965Rp+Uxjpp3ABmqqaRkf7xbVisElAPSh7FyCco7qQXqYFDJezkJe6nCKsmuRC02JgB5+e3J02TFLB782W6UpflcViOY5ImDdfS92awcuDrVaU6d6aIz3cqaSNIPVjO5rONSc1dTi7+wpw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4580.namprd12.prod.outlook.com (2603:10b6:5:2a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 14:53:59 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 14:53:59 +0000
Subject: Re: [PATCH] amdgpu: fixes memleak issue when init failed
To: =?UTF-8?B?6LW15Yab5aWO?= <bernard@vivo.com>
References: <ABgAqADYCC8xUvKN7bT8YKp1.3.1587476387645.Hmail.bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7fdc9db9-f259-e0de-646f-863e438d68ed@amd.com>
Date: Tue, 21 Apr 2020 16:53:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <ABgAqADYCC8xUvKN7bT8YKp1.3.1587476387645.Hmail.bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR03CA0075.eurprd03.prod.outlook.com
 (2603:10a6:207:5::33) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:207:5::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 14:53:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c3f561f-5b14-4f27-c145-08d7e603d29e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4580:|DM6PR12MB4580:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB45801D1FD1439EB5B0CB7E9783D50@DM6PR12MB4580.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(66556008)(2906002)(66476007)(5660300002)(6486002)(31696002)(66574012)(52116002)(478600001)(316002)(16526019)(2616005)(66946007)(53546011)(186003)(86362001)(6916009)(8936002)(6666004)(31686004)(36756003)(54906003)(81156014)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IsVUDdQFZQ4K2CsZiD+jT6Zgh259ofTGgfcBsms/dODW1HULaxyAlV5th3iOh6jtBMQniHImMcEV9EstyfEDJYwGzbjUx7Na7uEWwzg15VER3E96zdgS9g3yWPsbdsfDPY60We3yJHQOtgV3Ehd3j6AOZTuCUHpZnbyOtqLqG0HYt4UuKcxuRuFh/ZDvpzS6Q2dlJQGkDVhjMuBrNjc+Hv0m6mQxfCjDGwPgG3t63bWz3Ek2yBOT5AHM7xuZStP0M3jHM7h8srkOada4/qcWBCTmicEo6WtBKEAgED767KpMVnJaBMltPXSZ1BFxIi7QlV+nQqRciLZXoF+3qiud4tNa0jKCTjROnoMxusVBpjg+Fb+mJsD1LEnAl5B1hZk93pqhO2g2PHtIprDMYwwFbeJU7FgaRMfxmDYbUUA2PPFiqrZMs8m11MV0tPi6yTrL
X-MS-Exchange-AntiSpam-MessageData: DCALR6iSkLY4YsUweP+xFQ/mJMFKSxpViFBY2BIGqbx252SLeu9gclcXX/wZ9G75vdvr+aI11y83DuAkGgKvzTiX80259cEPevAjis9+RfvD1QlFcBd7Fk+P08+qMbauOFs0GUMcSpnB4zk7x52uetRnDp05vQhVC1IIGbl9Iwp+jHOL39CAr+40qfFFJSa7/NZHLu1Xi7dw15FUrB2ddhOas/NLO2Y77QpW1VjlawewMoK+3iEf9vJ/1QR3yp2EqJOlOdlKuuUyGz+1l3D2zDAKwL8oHoJI0B+mcMGn8Ru7dugoHfWaE907AoMmfnY6BT/U4GyAWlVBhPAK8802T3Mmj/5Qe2HmncuJNWJCDlOz+wvQoQm3jifJ3Ng1M9bNwzUQMLZI3e4J1J9M5zC9miDIaSlOktf+hK6aPacZlScJ/QBYDr1CR7QJ19uE6NZ+CR0k5fa0Xnw07w1K3sDi6+kFzzhDHTXX2E8jhSkWHHTt+kHrx8S8qEAv1A0tTt0JPM92dJZV1CNs9gDOjlSyDBmtUhZnbiWT7GH4hM3vwBfNaIlW0qbKuMqTN4Ee5k5+T/aGXKKWbKpYDKomSoahjgh+krx9ExiM5ADgJkotYY53kqTf45y4i79D7+ks2dFsgb7gUi+YwhnRweJ+Jc3ksbDtPf+UjXlwWQFizgziSn/IKNhvNe61gPBN5GZGcOPhgK/vs/9yB+0rWUdcPV9S/wHC1G/G/r1f3XUn4qufHmEw7BTDyNbRs29U8T6hxacP0Ivi2L4fFQTO915DjIYtmh7ZLEAISeG3sJ9TnvfLgj1MMVOLgcy/1X6d+RWGJW7EQMBbpM6YbbrqrqHkZpfaBWfwVNkivu/2O0ZmWXNlwXA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3f561f-5b14-4f27-c145-08d7e603d29e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 14:53:59.0986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI5QsZ2Ebpj7oxoedgsBllkx2XYVHIm/5ZrLpunFpSy6wSG/9RsNcqB1v/4aDR9M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4580
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Ori Messinger <Ori.Messinger@amd.com>,
 opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDQuMjAgdW0gMTU6Mzkgc2NocmllYiDotbXlhpvlpY46Cj4g5Y+R5Lu25Lq677yaIkNo
cmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g5Y+R6YCB5pel5pyf
77yaMjAyMC0wNC0yMSAyMTowMjoyNwo+IOaUtuS7tuS6uu+8miLotbXlhpvlpY4iIDxiZXJuYXJk
QHZpdm8uY29tPgo+IOaKhOmAgeS6uu+8mkFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4sIkRhdmlkIChDaHVuTWluZykgWmhvdSIgPERhdmlkMS5aaG91QGFtZC5jb20+LERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4sRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPixUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+LE9yaSBNZXNzaW5nZXIgPE9y
aS5NZXNzaW5nZXJAYW1kLmNvbT4sU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPixhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
LGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsb3BlbnNvdXJjZS5rZXJuZWxAdml2by5jb20K
PiDkuLvpopjvvJpSZTogW1BBVENIXSBhbWRncHU6IGZpeGVzIG1lbWxlYWsgaXNzdWUgd2hlbiBp
bml0IGZhaWxlZD5BbSAyMS4wNC4yMCB1bSAxNDowOSBzY2hyaWViIOi1teWGm+WljjoKPj4+IEZy
b206ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4gRGF0
ZTogMjAyMC0wNC0yMSAxOToyMjo0OQo+Pj4gVG86ICBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2
by5jb20+LEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4sIkRhdmlkIChD
aHVuTWluZykgWmhvdSIgPERhdmlkMS5aaG91QGFtZC5jb20+LERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4sRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPixUb20gU3QgRGVuaXMg
PHRvbS5zdGRlbmlzQGFtZC5jb20+LE9yaSBNZXNzaW5nZXIgPE9yaS5NZXNzaW5nZXJAYW1kLmNv
bT4sU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPixhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZyxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcKPj4+IENjOiAgb3BlbnNvdXJjZS5rZXJuZWxAdml2by5jb20KPj4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGFtZGdwdTogZml4ZXMgbWVtbGVhayBpc3N1ZSB3aGVuIGluaXQgZmFp
bGVkPkFtIDIxLjA0LjIwIHVtIDEzOjE3IHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+Pj4+PiBWUkFN
IG1hbmFnZXIgYW5kIERSTSBNTSB3aGVuIGluaXQgZmFpbGVkLCB0aGVyZSBpcyBubyBvcGVyYWN0
aW9uCj4+Pj4+IHRvIGZyZWUga3phbGxvYyBtZW1vcnkgJiByZW1vdmUgZGV2aWNlIGZpbGUuCj4+
Pj4+IFRoaXMgd2lsbCBsZWFkIHRvIG1lbWxlYWsgJiBjYXVzZSBzdGFiaWxpdHkgaXNzdWUuCj4+
Pj4gTkFLLCBmYWlsdXJlIHRvIGNyZWF0ZSBzeXNmcyBub2RlcyBhcmUgbm90IGNyaXRpY2FsLgo+
Pj4+Cj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+PiBPSywgZ2V0IGl0Lgo+Pj4gQnkgdGhlIHdheSwg
c2hvdWxkIGkgbW9kaWZ5IHRoaXMgcGF0Y2ggdG8ganVzdCBoYW5kbGUgPGtmcmVlKG1ncik+IGlu
IGVycm9yIGJyYW5jaCwgb3IgdGhhdCBpdCBpcyBhbHNvIHVubmVjZXNzYXJ5Pwo+PiBXaGF0IHlv
dSBjYW4gZG8gaXMgdG8gZHJvcCB0aGUgInJldHVybiByZXQiIGlmIGFueXRoaW5nIHdpdGggdGhl
IHN5c2ZzCj4+IG5vZGVzIGdvZXMgd3JvbmcgYW5kIGluc3RlYWQgcHJpbnQgdGhlIGVycm9yIGNv
ZGUuCj4gRW1tbSwgZm9yIHRoaXMgcGFydCwgaSBhbSBub3Qgc3VyZSwgbXkgbW9kaWZ5IGZpcnN0
IHByaW50IHRoZSBlcnJvciwgc2Vjb25lIHJlbGVhc2Ugbm90IGZyZWUgbWVtb3J5LAo+IGFuZCBs
YXN0IHJldHVybiBlcnJvciwgbWFrZSBldmVyeXRoaW5nIGNsZWFyIHRvIHRoZSBzeXN0ZW0uCj4g
SSB0aGluayBpdGBzIHRoZSBzYW1lIHdpdGggd2hhdCB5b3UgbWVudGlvbmVkLCBpcyB0aGVyZSBz
b21ldGhpbmcgdGhhdCBJIG1pc3VuZGVyc3Rvb2Q/CgpZZXMsIG1heWJlIGFuIGV4YW1wbGUgbWFr
ZXMgaXQgbW9yZSBjbGVhciB3aGF0IHRvIGRvIGhlcmUuIEN1cnJlbnRseSB3ZSAKcHJpbnQgYW5k
IGVycm9yIGFuZCByZXR1cm4gd2hlbiBzb21ldGhpbmcgd2l0aCB0aGUgc3lzZnMgZmlsZXMgZ29l
cyB3cm9uZzoKCmlmIChyZXQpIHsKIMKgwqDCoCBEUk1fRVJST1IoIkZhaWxlZCB0byBjcmVhdGUg
ZGV2aWNlIGZpbGUgbWVtX2luZm9fdnJhbV90b3RhbFxuIik7CiDCoMKgwqAgcmV0dXJuIHJldDsK
fQoKQnV0IHdoYXQgd2Ugc2hvdWxkIGRvIGluc3RlYWQgaXMganVzdCB0byBwcmludCBhbiBlcnJv
ciBhbmQgY29udGludWUgYW5kIAppbiB0aGUgZW5kIHJldHVybiBzdWNjZXNzIHN0YXR1czoKCmlm
IChyZXQpCiDCoMKgwqAgRFJNX0VSUk9SKCJGYWlsZWQgdG8gY3JlYXRlIGRldmljZSBmaWxlIG1l
bV9pbmZvX3ZyYW1fdG90YWwgCiglZClcbiIsIHIpOwoKLi4uCnJldHVybiAwOwoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKCj4KPj4gSXQncyByZWFsbHkgYW5ub3lpbmcgdGhhdCBsb2FkaW5nLCB1bmxv
YWRpbmcgYW5kIGxvYWRpbmcgdGhlIGRyaXZlcgo+PiBhZ2FpbiBzb21ldGltZXMgZmFpbHMgYmVj
YXVzZSB3ZSBoYXZlIGEgYnVnIGluIHRoZSBzeXNmcyBmaWxlcyBjbGVhbnVwLgo+Pgo+PiBXZSBj
ZXJ0YWlubHkgc2hvdWxkIGZpeCB0aG9zZSBidWdzIGFzIHdlbGwsIGJ1dCB0aGV5IGFyZSBqdXN0
IG5vdAo+PiBjcml0aWNhbCBmb3IgY29ycmVjdCBkcml2ZXIgZnVuY3Rpb25hbGl0eS4KPj4KPj4g
UmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Cj4+PiBSZWdhcmRzLAo+Pj4gQmVybmFyZAo+Pj4KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxiZXJuYXJkQHZpdm8uY29tPgo+Pj4+PiAt
LS0KPj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5j
IHwgMjQgKysrKysrKysrKysrKysrKy0tLS0KPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+Pj4+PiBpbmRleCA4MmEzMjk5ZTUzYzAu
LjRjNWZiMTUzZTZiNCAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPj4+Pj4gQEAgLTE3NSwzMCArMTc1LDQ0IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X3ZyYW1fbWdyX2luaXQoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4s
Cj4+Pj4+ICAgICAJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRy
X21lbV9pbmZvX3ZyYW1fdG90YWwpOwo+Pj4+PiAgICAgCWlmIChyZXQpIHsKPj4+Pj4gICAgIAkJ
RFJNX0VSUk9SKCJGYWlsZWQgdG8gY3JlYXRlIGRldmljZSBmaWxlIG1lbV9pbmZvX3ZyYW1fdG90
YWxcbiIpOwo+Pj4+PiAtCQlyZXR1cm4gcmV0Owo+Pj4+PiArCQlnb3RvIFZSQU1fVE9UQUxfRkFJ
TDsKPj4+Pj4gICAgIAl9Cj4+Pj4+ICAgICAJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYt
PmRldiwgJmRldl9hdHRyX21lbV9pbmZvX3Zpc192cmFtX3RvdGFsKTsKPj4+Pj4gICAgIAlpZiAo
cmV0KSB7Cj4+Pj4+ICAgICAJCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmls
ZSBtZW1faW5mb192aXNfdnJhbV90b3RhbFxuIik7Cj4+Pj4+IC0JCXJldHVybiByZXQ7Cj4+Pj4+
ICsJCWdvdG8gVklTX1ZSQU1fVE9UQV9GQUlMOwo+Pj4+PiAgICAgCX0KPj4+Pj4gICAgIAlyZXQg
PSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV91
c2VkKTsKPj4+Pj4gICAgIAlpZiAocmV0KSB7Cj4+Pj4+ICAgICAJCURSTV9FUlJPUigiRmFpbGVk
IHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1faW5mb192cmFtX3VzZWRcbiIpOwo+Pj4+PiAtCQly
ZXR1cm4gcmV0Owo+Pj4+PiArCQlnb3RvIFZSQU1fVVNFRF9GQUlMOwo+Pj4+PiAgICAgCX0KPj4+
Pj4gICAgIAlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVt
X2luZm9fdmlzX3ZyYW1fdXNlZCk7Cj4+Pj4+ICAgICAJaWYgKHJldCkgewo+Pj4+PiAgICAgCQlE
Uk1fRVJST1IoIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGZpbGUgbWVtX2luZm9fdmlzX3ZyYW1f
dXNlZFxuIik7Cj4+Pj4+IC0JCXJldHVybiByZXQ7Cj4+Pj4+ICsJCWdvdG8gVklTX1ZSQU1fVVNF
RF9GQUlMOwo+Pj4+PiAgICAgCX0KPj4+Pj4gICAgIAlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUo
YWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV92ZW5kb3IpOwo+Pj4+PiAgICAgCWlm
IChyZXQpIHsKPj4+Pj4gICAgIAkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gY3JlYXRlIGRldmljZSBm
aWxlIG1lbV9pbmZvX3ZyYW1fdmVuZG9yXG4iKTsKPj4+Pj4gLQkJcmV0dXJuIHJldDsKPj4+Pj4g
KwkJZ290byBWUkFNX1ZFUkRPUl9GQUlMOwo+Pj4+PiAgICAgCX0KPj4+Pj4gICAgIAo+Pj4+PiAg
ICAgCXJldHVybiAwOwo+Pj4+PiArCj4+Pj4+ICtWUkFNX1ZFUkRPUl9GQUlMOgo+Pj4+PiArCWRl
dmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192aXNfdnJhbV91
c2VkKTsKPj4+Pj4gK1ZJU19WUkFNX1VTRURfRkFJTDoKPj4+Pj4gKwlkZXZpY2VfcmVtb3ZlX2Zp
bGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdnJhbV91c2VkKTsKPj4+Pj4gK1JWQU1f
VVNFRF9GQUlMOgo+Pj4+PiArCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0
cl9tZW1faW5mb192aXNfdnJhbV90b3RhbCk7Cj4+Pj4+ICtWSVNfVlJBTV9UT1RBX0ZBSUw6Cj4+
Pj4+ICsJZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX21lbV9pbmZvX3Zy
YW1fdG90YWwpOwo+Pj4+PiArVlJBTV9UT1RBTF9GQUlMOgo+Pj4+PiArCWtmcmVlKG1ncik7Cj4+
Pj4+ICsJbWFuLT5wcml2ID0gTlVMTDsKPj4+Pj4gKwo+Pj4+PiArCXJldHVybiByZXQ7Cj4+Pj4+
ICAgICB9Cj4+Pj4+ICAgICAKPj4+Pj4gICAgIC8qKgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
