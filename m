Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3FB23409C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FAB6EA0D;
	Fri, 31 Jul 2020 07:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7B96E0D5;
 Fri, 31 Jul 2020 07:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFrZK7euAjUDN750amEaSAl77e1ie2CafTvyvNPHfPS6RSdPpScL1dx2KVdGOeHagIWG2t7gm0Uz0F2i5La65nXVAeRqKh6iwKGwsdw8RErP1864AdjNZepLqiKf3poAPuU3fCfxvn8kSt+QQVe+GhUvTyE1q8RHuW7IHQoQ1aSruDL3xkFH2GU9XmHAGq1zR0rnfcp7dHyeMX5Y+Ip70c3BOKZ96DmnDwdXpuvLJdRF1D1sskflxhaE0+kjmzmLqAMkrJ4t+snvu1dWh2+mSGSy/AiTu/VYxp8sy5ClGVFnPZGDMaQOVY9kLdaJhPRL06kN0qx8y6IY5Ya9MFqTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWrbLKteyzlg4pknpEMOnlAslKd+FILpEwfRydNqkeA=;
 b=CppWPI6LswwuMheKohOB447T8yFXNvJ4Nf1P05BohsvZYxNuonOwKp/gn0ddVpSGBOYmRBYEh/EUGfTi9gaG7ezEW10ScEH3wtVNzA2toh4IEGBoNtWAid7c+Jv0D6qv/omQjKViI/3v8mmK3z/3F/QcSjCsl5bdEiVAWShV2SvAbXqpcnFklXQv+WZe6fJ/wkF5yvDD/cDRtheFzJo3nScygW7wc3fRcQgcwhR3aAskyWKowJZt8G8ZvIh4zGIbv7Z/BrXbNUyZxLQACO+3Hc7wXZVrt6ma5p0UiZx7p2CczM68mdKYlE+ndOjr4EKQz6ehMu/Y2FCVo8dH1DdP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWrbLKteyzlg4pknpEMOnlAslKd+FILpEwfRydNqkeA=;
 b=bYqrkNSQz4NSS3x8FEF18/9dzxLvQrX87rv2nW7PufhPV5MkiDYP1oQk8nZfJORgb22TKZ/iP/8tEjkClZbHeVqgV5SDbRXw6h0HY9NxYI3UIkkoyRuILC9/2UwQR+ka0k29OgW+m3dYPUU+aq+pGQUdTxAAL+4OXm3OtB32GO8=
Authentication-Results: lists.linuxfoundation.org; dkim=none (message not
 signed) header.d=none;lists.linuxfoundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3949.namprd12.prod.outlook.com (2603:10b6:208:167::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 07:57:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 07:57:56 +0000
Subject: Re: [Linux-kernel-mentees] [PATCH] drm/amdgpu: Prevent
 kernel-infoleak in amdgpu_info_ioctl()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200728192924.441570-1-yepeilin.cs@gmail.com>
 <30b2a31f-77c2-56c1-ecde-875c6eea99d5@gmail.com>
 <CADnq5_NXOiAc7q5gQqF_wwtJD1o6nHjXM4O3gY6EwAQe9iOtXw@mail.gmail.com>
 <8c5cf518-12d2-7495-7822-c7ebf8e61972@amd.com>
 <20200731065322.GA1518178@kroah.com>
 <690213fd-d3d2-2253-dcb2-367a65b34f38@amd.com>
 <20200731071052.GA1522097@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <13cbff82-bf19-d3eb-d757-95ed5c5bd6bf@amd.com>
Date: Fri, 31 Jul 2020 09:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731071052.GA1522097@kroah.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18 via Frontend
 Transport; Fri, 31 Jul 2020 07:57:50 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 02d2987c-704a-49c3-fd2f-08d835276f31
X-MS-TrafficTypeDiagnostic: MN2PR12MB3949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB394942040ACB82BFFCEEBD2B834E0@MN2PR12MB3949.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rnVnYbjHYA4MVQK7TeAZWqg1wtV4c/AJ1IX1xrHNw+fiyGer7qyobGZ7PTNxMcxxK4HC/HGt9o2zBQVCMgB/H+BlF5I3x76f4jWkXCIs9JWrwVB7UgE+LH/6sFcLiGE/ACl6BJV5Op+CzktCHH6hXfVhgXMwxFGhTzjNneo7aI8/D28XMeqaPdHI4RmDyM3EbNA8VG9zXyrHpXVVkFUPclD/amdki2jyANZjVql48v5XpCHM1+/Xwym0VfvOmYnK9eEmqeV9/AH5v/L6gRYqQKazN7Ps6PC5XCTelW4Ilu4sClHpvao+6ghL6LHnRYkyZFM4p+ztXPtkrJhs3aTKyI7XDwAHzCKjCoNo/Ifqu00v3qSWgJFT72AaJ/katGw5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(8676002)(66574015)(83380400001)(6486002)(54906003)(6916009)(4326008)(8936002)(31696002)(31686004)(316002)(36756003)(186003)(66476007)(6666004)(16526019)(5660300002)(53546011)(66556008)(52116002)(2906002)(478600001)(66946007)(2616005)(86362001)(7416002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3VhwE/KfFZRIE8qCWua7GiDyxvte6/8WXFWEuHQaGZtkdYIfkxYFYtl1R4Cq0ss/E0NkZaA4QT7r7chQznghCkz+MMS/HCq9cvB8ty5MGaboDBrAGce5NxY3TMzcF7MAAQYRBAl+PBpj1sXfref4C6pF1qVmdRSJ0x7wBIyirW/pLtk0icADvZ7Lr/B17cVB3HYDxxCgVeZ1d99O3TdSgR7gqwWiQgFXAHZq1Nii36SciNrNp0FwxTiRDB8iI3z4/GB5G6MeI70hQYV5n3VM6ma/WEyA9+xCYrfLmvbNPG3fJeyd6ByVrPFnPyu3jL4qbtjOnv8joPR+oXCYmGPjXptxfX5+Gdpa1c6DOEzl6nWxHVv29ZkpDSMLW5f+8es60SliQoSDi0Z8dqhAna1dHsWBkF/Ze6Rez+utW4lBmtFQLJSjk3ISFABUhKfFrPT76aGxij0NUqbcmYMoTgRpzMUpOtTRQaIVXqF4e1BcoJzDY8VgDGlT3oNX+Uq1qQyuEbZ29PRUr7IPIIShNMcY3qn7tpm9CpQ2+kWfSO415NR/Y5BCQXIjAdz6fET8or+OWX3pdJQmdyDpH0XPnPfmYk3CGeNWQnuS2MdLmj062BqlIAvDdsCmfVuVbzphads3EG3stn8xnMI+e2yJ5uD/LFs6FIIGAMEQzRWtnl1Tt+uUdKS9LmrOEFaRCBprgPVa/9JMxvgG7uleivNx+ynsnQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d2987c-704a-49c3-fd2f-08d835276f31
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 07:57:56.6534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzHgkFIC6V2J53SepUcPFzLGG5GshyxRG2BM+Pemq/Zk5j9LE9NGYJPHOTJ0bnBl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Trek <trek00@inbox.ru>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Leo Liu <leo.liu@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDk6MTAgc2NocmllYiBHcmVnIEtyb2FoLUhhcnRtYW46Cj4gT24gRnJp
LCBKdWwgMzEsIDIwMjAgYXQgMDg6NTc6NTNBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPj4gQW0gMzEuMDcuMjAgdW0gMDg6NTMgc2NocmllYiBHcmVnIEtyb2FoLUhhcnRtYW46Cj4+
PiBPbiBUaHUsIEp1bCAzMCwgMjAyMCBhdCAwNTowOTowN1BNIC0wNDAwLCBMdWJlbiBUdWlrb3Yg
d3JvdGU6Cj4+Pj4gT24gMjAyMC0wNy0yOSA5OjQ5IGEubS4sIEFsZXggRGV1Y2hlciB3cm90ZToK
Pj4+Pj4gT24gV2VkLCBKdWwgMjksIDIwMjAgYXQgNDoxMSBBTSBDaHJpc3RpYW4gS8O2bmlnCj4+
Pj4+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+PiBBbSAy
OC4wNy4yMCB1bSAyMToyOSBzY2hyaWViIFBlaWxpbiBZZToKPj4+Pj4+PiBDb21waWxlciBsZWF2
ZXMgYSA0LWJ5dGUgaG9sZSBuZWFyIHRoZSBlbmQgb2YgYGRldl9pbmZvYCwgY2F1c2luZwo+Pj4+
Pj4+IGFtZGdwdV9pbmZvX2lvY3RsKCkgdG8gY29weSB1bmluaXRpYWxpemVkIGtlcm5lbCBzdGFj
ayBtZW1vcnkgdG8gdXNlcnNwYWNlCj4+Pj4+Pj4gd2hlbiBgc2l6ZWAgaXMgZ3JlYXRlciB0aGFu
IDM1Ni4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIDIwMTUgd2UgdHJpZWQgdG8gZml4IHRoaXMgaXNzdWUg
YnkgZG9pbmcgYD0ge307YCBvbiBgZGV2X2luZm9gLCB3aGljaAo+Pj4+Pj4+IHVuZm9ydHVuYXRl
bHkgZG9lcyBub3QgaW5pdGlhbGl6ZSB0aGF0IDQtYnl0ZSBob2xlLiBGaXggaXQgYnkgdXNpbmcK
Pj4+Pj4+PiBtZW1zZXQoKSBpbnN0ZWFkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPj4+Pj4+PiBGaXhlczogYzE5M2ZhOTFiOTE4ICgiZHJtL2FtZGdwdTogaW5m
b3JtYXRpb24gbGVhayBpbiBhbWRncHVfaW5mb19pb2N0bCgpIikKPj4+Pj4+PiBGaXhlczogZDM4
Y2VhZjk5ZWQwICgiZHJtL2FtZGdwdTogYWRkIGNvcmUgZHJpdmVyICh2NCkiKQo+Pj4+Pj4+IFN1
Z2dlc3RlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IFBlaWxpbiBZZSA8eWVwZWlsaW4uY3NAZ21haWwuY29tPgo+Pj4+
Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPj4+Pj4+Cj4+Pj4+PiBJIGNhbid0IGNvdW50IGhvdyBtYW55IG9mIHRob3NlIHdlIGhhdmUg
Zml4ZWQgb3ZlciB0aGUgeWVhcnMuCj4+Pj4+Pgo+Pj4+Pj4gQXQgc29tZSBwb2ludCB3ZSBzaG91
bGQgcHJvYmFibHkgZG9jdW1lbnQgdGhhdCB1c2luZyAiPSB7fSIgb3IgIj0geyAwIH0iCj4+Pj4+
PiBpbiB0aGUga2VybmVsIGlzIGEgcmVhbGx5IGJhZCBpZGVhIGFuZCBzaG91bGQgYmUgYXZvaWRl
ZC4KPj4+Pj4gTW9yZW92ZXIsIGl0IHNlZW1zIGxpa2UgZGlmZmVyZW50IGNvbXBpbGVycyBzZWVt
IHRvIGJlaGF2ZSByZWxhdGl2ZWx5Cj4+Pj4+IGRpZmZlcmVudGx5IHdpdGggdGhlc2UgYW5kIHdl
IG9mdGVuIGdldCByZXBvcnRzIG9mIHdhcm5pbmdzIHdpdGggdGhlc2UKPj4+Pj4gb24gY2xhbmcu
ICBXaGVuIGluIGRvdWJ0LCBtZW1zZXQuCj4+Pj4gVGhlcmUgYXJlIHF1aXRlIGEgZmV3IG9mIHRo
b3NlIHVuZGVyIGRyaXZlcnMvZ3B1L2RybSwgZm9yICJhbWQvIiwgInNjaGVkdWxlci8iCj4+Pj4g
ZHJtKi5jIGZpbGVzLAo+Pj4+Cj4+Pj4gJGZpbmQgLiBcKCAtcmVnZXggIi4vZHJtLipcLmMiIC1v
ciAtcmVnZXggIi4vYW1kLy4qXC5jIiAtb3IgLXJlZ2V4ICIuL3NjaGVkdWxlci8uKlwuYyIgXCkg
LWV4ZWMgZWdyZXAgLW4gLS0gIiAqPSAqeyAqKHxOVUxMfDApICp9IiBce1x9IFwrIHwgd2MgLWwK
Pj4+PiAzNzQKPj4+PiAkXwo+Pj4+Cj4+Pj4gT3V0IG9mIHdoaWNoIG9ubHkgMTYgYXJlIG9mIHRo
ZSBub24tSVNPIEMgdmFyaWV0eSwgIj0ge30iLAo+Pj4+Cj4+Pj4gJGZpbmQgLiBcKCAtcmVnZXgg
Ii4vZHJtLipcLmMiIC1vciAtcmVnZXggIi4vYW1kLy4qXC5jIiAtb3IgLXJlZ2V4ICIuL3NjaGVk
dWxlci8uKlwuYyIgXCkgLWV4ZWMgZWdyZXAgLW4gLS0gIiAqPSAqeyAqfSIgXHtcfSBcKyB8IHdj
IC1sCj4+Pj4gMTYKPj4+PiAkXwo+Pj4+Cj4+Pj4gUGVyaGFwcyB0aGUgbGF0dGVyIGFyZSB0aGUg
bW9yZSBwcmVzc2luZyBvbmVzLCBzaW5jZSBpdCBpcyBhIEMrKyBpbml0aWFsaXplciBhbmQgbm90
IGEgSVNPIEMgb25lLgo+Pj4gSXQgb25seSBtYXR0ZXJzIHdoZW4gd2UgY2FyZSBjb3B5aW5nIHRo
ZSBkYXRhIHRvIHVzZXJzcGFjZSwgaWYgaXQgYWxsCj4+PiBzdGF5cyBpbiB0aGUga2VybmVsLCBh
bGwgaXMgZmluZS4KPj4gV2VsbCBvbmx5IGFzIGxvbmcgYXMgeW91IGRvbid0IHRyeSB0byBjb21w
dXRlIGEgQ1JDMzIsIE1ENSBvciBhbnkKPj4gZmluZ2VycHJpbnQgZm9yIGEgaGFzaCBmcm9tIHRo
ZSBieXRlcyBmcm9tIHRoZSBzdHJ1Y3R1cmUuCj4+Cj4+IFRoZW4gaXQgZmFpbHMgaG9ycmlibGUg
YW5kIHlvdSB3b25kZXIgd2h5IHRoZSBjb2RlIGRvZXNuJ3Qgd29ya3MgYXMKPj4gZXhwZWN0ZWQu
Cj4gVHJ1ZSwgYnV0IHRoZSBudW1iZXIgb2YgdGltZXMgSSBoYXZlIGV2ZXIgbmVlZGVkIHRvIGRv
IHRoYXQgdG8gYQo+IHN0cnVjdHVyZSBmb3IgYSBkcml2ZXIgaXMsIHVtLCBuZXZlci4uLgo+Cj4g
SWYgYSBzdHJ1Y3R1cmUgZXZlciBuZWVkcyB0byBoYXZlIHRoYXQgaGFwcGVuIHRvIGl0LCBJIHdv
dWxkIHN1cmUgaG9wZQo+IHRoZSBkZXZlbG9wZXIgd2FzIGF3YXJlIG9mIHBhZGRpbmcgZmllbGRz
LCBvdGhlcndpc2UsIHdlbGwsIHNvbWVvbmUKPiBuZWVkcyB0byB0YWtlIGF3YXkgdGhlaXIgQyBs
YW5ndWFnZSBjZXJ0aWZpY2F0aW9uIDopCgpXZWxsIGl0IGlzIHZlcnkgbGlrZWx5IHRoYXQgc3Rh
Y2sgYWxsb2NhdGVkIHN0cnVjdHVyZXMgaGF2ZSB0aGUgc2FtZSAKdmFsdWVzIGluIHRoZSBwYWRk
aW5nIGJ5dGVzIG1vc3Qgb2YgdGhlIHRpbWUuIFNvIHRoZSBwcm9ibGVtIGlzIHZlcnkgCnN1YnRs
ZSBhbmQgaGFyZCB0byBkZXRlY3QuCgpXZSd2ZSBzZWVuIGVub3VnaCBwcm9ibGVtcyB3aXRoIHRo
YXQgb3ZlciB0aGUgbGFzdCB+MTAgeWVhcnMgdGhhdCBJJ20gCmNsZWFybHkgaW4gZmF2b3Igb2Yg
YWRkaW5nIHNvbWV0aGluZyB0byBjaGVja3BhdGNoLnBsIHRvIHNwaWxsIG91dCBhIAp3YXJuaW5n
IGlmICI9IHsgfSIgaXMgdXNlZCBmb3IgemVybyBpbml0aWFsaXphdGlvbi4KCkFsdGVybmF0aXZl
bHkgc29tZSBvZiB0aGUgcGVvcGxlIHdobyBrbm93IGdjYy9jbGFuZyBiZXR0ZXIgdGhhbiBJIGRv
IApjb3VsZCBjb21lIHVwIHdpdGggYSB3YXJuaW5nIHRoYXQgeW91IHNob3VsZG4ndCBjYXN0IGEg
c3RydWN0dXJlIHdpdGggCnVuaW5pdGlhbGl6ZWQgcGFkZGluZyB0byB2b2lkKiBvciB1OCouCgpJ
IG1lYW4gS0FTQU4gaXMgYWxyZWFkeSBkb2luZyBhIGdyZWF0IGpvYiBkZXRlY3RpbmcgdGhhdCBr
aW5kIG9mIHN0dWZmLCAKYnV0IGZvciB0aGlzIHlvdSBzdGlsbCBuZWVkIHRvIGhpdCB0aGUgb2Zm
ZW5kaW5nIGNvZGUgcGF0aC4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+IHRoYW5rcywKPgo+IGdy
ZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
