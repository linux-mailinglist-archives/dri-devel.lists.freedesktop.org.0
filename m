Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51D32CE65B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 04:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D36E12B;
	Fri,  4 Dec 2020 03:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980536E120;
 Fri,  4 Dec 2020 03:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2PU/U0+BmbQIXbN6YxNXNoxPiArtfC3Lws1yIPi/T2ZoTlTL7dOhA6VR6pe1C/DzF1L1aUTbSWT8OGQBqrIYNOFFOROxKieyp9YL83N5pY8kzdTpRSpq60Lk+yH1yaVEcuER3aocWlgwWCqbQIxnXfPvcbec5+BZPLylBfNoGyjgz1pXQHojgQEVt5/lfIUxiMWRLsms66dFvsRT6igZEYhQSCO1b7mqpC7HO/U1NT7zpj8BBJ9gv2DEjQPmIcovIZxq4VzwEN4v30nl3Z7NQIFnzKD8rUmqEW8m1ZcZO43R48mwpYoPVF0zNOnwWWAwYtrXBf1BA+qP2BkeKBZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDawzgcYl4VQbdJ5p12nou78aCKhgbXnaGyfrvCtLWQ=;
 b=W5bXV8porXfq5tvPA5YMZQT2V4FMw1ltLMR2yYert/QUQsDMeM/6zuOlXbx43oMKGF54eUPIgz+6+w4+PCHTt3mcr2LbJmZB3x6stmKz8xBlehTqrgFz/2/r26dQABT4+2w0xvd2LojPd5bThT91qB1j2JM1ii3aN8YgO6uQoFLIuf5HvPny/Bfqgz8RrtumXPBGmZW42BoWuEI/ZgubfgPBI9BQA3gW7N3VzTg+m/2TGGOZR6y3XbfTezyyxCdQbv+vtb3QvwcDECnwYRhR2jx3HSmx6fqltaXdSF+Dv6sEtcNEI/79iTgqvwM9U8499Q8BdGoFfyyak9Gx6FPTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDawzgcYl4VQbdJ5p12nou78aCKhgbXnaGyfrvCtLWQ=;
 b=2xDM01Y30fhEoX0XY4zkTd3JK0T6c+E2TyD7hbByYaKhZ6T+9D3NRdqEqhiAXzrCUtIFTVHU60FDs4U4tok0mGtTai3tjpLp1vVBgJdKKJxdDvo9pjJoEjEcRlsPc+Oqi/09d+LTU1A9zD58JCZqlAyqaHpyjg4ASwiJtS6Cb/w=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 03:17:39 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 03:17:39 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/scheduler: Essentialize the job done callback
Date: Thu,  3 Dec 2020 22:17:20 -0500
Message-Id: <20201204031722.24040-4-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.404.ge67fbf927d
In-Reply-To: <20201204031722.24040-1-luben.tuikov@amd.com>
References: <20201204031722.24040-1-luben.tuikov@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:610:4e::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:610:4e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 03:17:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8eed7273-b642-4bbf-02e0-08d898032747
X-MS-TrafficTypeDiagnostic: DM6PR12MB4043:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4043A76F2AE0BC17A1817E4799F10@DM6PR12MB4043.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oLc/Cm7sm+ZN+acfL3prDA18X4UpDWPMxiyz6ZRqPEJyBxx8sr1SWcuoWT3+OEPImNhA2dkfIWryujrl9tYQbrUkwNOt2EOx6fg+N7iSMszyKZm87UwbUFCEgoL33sA6gJQILVk1oTufvsU7pB4Mb3WR6F+CPgyQgN9iIJAPGdVrqrlujtC1fpfLThhU2DNsLFGsdqSmRtjru1ua8Kqvl38gmqowfcVETfGuieRGraWg72Kjb3d6o4FFvanFX5zLqzAJDlcJAydju5jzuaXxnSQwvcvpUm7gcESBDK2AdeWtFo0e5h3tYsBpdBNOjmTz93PI7hD1cIpBoC/JgggxyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(16526019)(5660300002)(66946007)(956004)(1076003)(6486002)(2906002)(66556008)(66476007)(4326008)(6666004)(2616005)(83380400001)(186003)(36756003)(8676002)(86362001)(8936002)(26005)(44832011)(54906003)(7696005)(66574015)(52116002)(478600001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y3dKaGdoQ04zYnczQUkrZHpWL1ZPSGtmS3NUR1hVYzRFZHFPcndVZ0VMeHVB?=
 =?utf-8?B?WHBmWGlwemhxWnBaV0tEcEhhcjJoWW5QUk9LV0dHNC9pNmFEajBsNHRiUDBW?=
 =?utf-8?B?djBKR2dGd2xNdmlzQmQyNlV0Tmx1Mzgyb2JUZ2dNaHdtY3dYUHRCcVU5Z3Y3?=
 =?utf-8?B?L2R2ZmZDdHdpQXRpNjdScHNpVFJSRmlUSUkxMWhUWmZpSzFaNy9SdDRBUGhV?=
 =?utf-8?B?S2Rwcm1Panp4UHRXR3ZXSm50cDJlUTZrVFFyWEE4QStQQWV5b0MzV25VdlpI?=
 =?utf-8?B?aHBDRU5mc25lTDdEcVpYSXA1T0VHRVhTN2FrV205aDI2ZmF1Nmlha3hjdzdV?=
 =?utf-8?B?aVVtYjRqRVJVUkcxS3VMcFNJZFJKWUY3aXhTQ3dDZVIybGFldXJrcHc4YzNu?=
 =?utf-8?B?OFNRaFA1enlaWUk2N3E3K2R2SHFXS21PTENEOFp2cy9ONU45MFV6TUVTYTRJ?=
 =?utf-8?B?aFpwVmlrbG9DT0c4VURPTXFVNTlJSGt2NUhRQW5obFE1SThSNURrSzRndFl0?=
 =?utf-8?B?ZG42RndscEVTWDhBTzZVWnVic2tDemVGTEN6SG9GbFZYNmw2RTdUZi91alhH?=
 =?utf-8?B?UU9ZWWloZERIMG1CdVZiU3BpRnZPeGR1L1hDSC9laVVkU25oNHZzakVXSWto?=
 =?utf-8?B?cWZkQUtQalYzZ1ZtMS9jRmkwWWtkeVBXdEJHRmZCL0M4WEx1UVNobUFWbzN4?=
 =?utf-8?B?T1ZLanlqSExDNXZIZTNXakdUR0htV3BicEhNVzJNa2Q4Y1hvaGRacXVNVGJw?=
 =?utf-8?B?ZHlDbUxQckt5Q1psUGZmOGNTUTZIRnlmR2xlamphVkR3QlhMTHFTZ05hRlNV?=
 =?utf-8?B?M0NGMDF1Nk9hS3U3TmV5WG5JZ3NtTWsxRHp3VWFWYWtrck0ySzNmeHBJWXdZ?=
 =?utf-8?B?TE9ZK0s2UzNMblpDQnMwQXhCYnplRnQ0U2ZaZ1VRWHIyTEl4WWlUcGJPU24r?=
 =?utf-8?B?VlRJQzZPalo2VDZjRGMxUUZKTTRETzJNb3pBd2RBNmpHQnRyTndEY094K0FN?=
 =?utf-8?B?WmIxWEMzaFFFTWtVUVJxcEJ0UDZrZlBnajJUdFc3aEdBbkZodVBGMldYZWx3?=
 =?utf-8?B?RHVNRVBqVnpnWjk2bUVtL0pxMHdIakV2andFRk5SWnozQ0RmYUhhQmZXYnd6?=
 =?utf-8?B?d3AvSVVHV1R4MVlrMGhEZjdJZzljZ1pOTUdBVDBveUJQL2d0bUxTYWRhMjZv?=
 =?utf-8?B?NUZLV0xlOXRnN2dHN0NrSTFidHVEbU1qZDZuSldRWFdUMHlYcU50dUFJemY2?=
 =?utf-8?B?TDc1d1h5czNXdHJvTGlOY242bWZlOHB1Q21GMnpEcURjV2lFMTc0NnhUUnNo?=
 =?utf-8?Q?8LDyjAq8NNI4mcAyR0HHC05tiVQHS1jSUo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eed7273-b642-4bbf-02e0-08d898032747
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 03:17:38.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+rzOmwaScgtuNM3mUsQYz4n43FeEYiDIJqV4xjArLhTFXD5SzcJPtAANodrG9C2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGpvYiBkb25lIGNhbGxiYWNrIGlzIGNhbGxlZCBmcm9tIHZhcmlvdXMKcGxhY2VzLCBpbiB0
d28gd2F5czogaW4gam9iIGRvbmUgcm9sZSwgYW5kCmFzIGEgZmVuY2UgY2FsbGJhY2sgcm9sZS4K
CkVzc2VudGlhbGl6ZSB0aGUgY2FsbGJhY2sgdG8gYW4gYXRvbQpmdW5jdGlvbiB0byBqdXN0IGNv
bXBsZXRlIHRoZSBqb2IsCmFuZCBpbnRvIGEgc2Vjb25kIGZ1bmN0aW9uIGFzIGEgcHJvdG90eXBl
Cm9mIGZlbmNlIGNhbGxiYWNrIHdoaWNoIGNhbGxzIHRvIGNvbXBsZXRlCnRoZSBqb2IuCgpUaGlz
IGlzIHVzZWQgaW4gbGF0dGVyIHBhdGNoZXMgYnkgdGhlIGNvbXBsZXRpb24KY29kZS4KClNpZ25l
ZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+ClJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpDYzogQWxleGFu
ZGVyIERldWNoZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+CkNjOiBBbmRyZXkgR3JvZHpv
dnNreSA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA3
MyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlv
bnMoKyksIDMzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMKaW5kZXggYjY5NGRmMTJhYWJhLi4zZWI3NjE4YTYyN2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jCkBAIC02MCw4ICs2MCw2IEBACiAjZGVmaW5lIHRvX2RybV9zY2hl
ZF9qb2Ioc2NoZWRfam9iKQkJXAogCQljb250YWluZXJfb2YoKHNjaGVkX2pvYiksIHN0cnVjdCBk
cm1fc2NoZWRfam9iLCBxdWV1ZV9ub2RlKQogCi1zdGF0aWMgdm9pZCBkcm1fc2NoZWRfcHJvY2Vz
c19qb2Ioc3RydWN0IGRtYV9mZW5jZSAqZiwgc3RydWN0IGRtYV9mZW5jZV9jYiAqY2IpOwotCiAv
KioKICAqIGRybV9zY2hlZF9ycV9pbml0IC0gaW5pdGlhbGl6ZSBhIGdpdmVuIHJ1biBxdWV1ZSBz
dHJ1Y3QKICAqCkBAIC0xNjIsNiArMTYwLDQwIEBAIGRybV9zY2hlZF9ycV9zZWxlY3RfZW50aXR5
KHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxKQogCXJldHVybiBOVUxMOwogfQogCisvKioKKyAqIGRy
bV9zY2hlZF9qb2JfZG9uZSAtIGNvbXBsZXRlIGEgam9iCisgKiBAc19qb2I6IHBvaW50ZXIgdG8g
dGhlIGpvYiB3aGljaCBpcyBkb25lCisgKgorICogRmluaXNoIHRoZSBqb2IncyBmZW5jZSBhbmQg
d2FrZSB1cCB0aGUgd29ya2VyIHRocmVhZC4KKyAqLworc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pv
Yl9kb25lKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pvYikKK3sKKwlzdHJ1Y3QgZHJtX3NjaGVk
X2ZlbmNlICpzX2ZlbmNlID0gc19qb2ItPnNfZmVuY2U7CisJc3RydWN0IGRybV9ncHVfc2NoZWR1
bGVyICpzY2hlZCA9IHNfZmVuY2UtPnNjaGVkOworCisJYXRvbWljX2RlYygmc2NoZWQtPmh3X3Jx
X2NvdW50KTsKKwlhdG9taWNfZGVjKCZzY2hlZC0+c2NvcmUpOworCisJdHJhY2VfZHJtX3NjaGVk
X3Byb2Nlc3Nfam9iKHNfZmVuY2UpOworCisJZG1hX2ZlbmNlX2dldCgmc19mZW5jZS0+ZmluaXNo
ZWQpOworCWRybV9zY2hlZF9mZW5jZV9maW5pc2hlZChzX2ZlbmNlKTsKKwlkbWFfZmVuY2VfcHV0
KCZzX2ZlbmNlLT5maW5pc2hlZCk7CisJd2FrZV91cF9pbnRlcnJ1cHRpYmxlKCZzY2hlZC0+d2Fr
ZV91cF93b3JrZXIpOworfQorCisvKioKKyAqIGRybV9zY2hlZF9qb2JfZG9uZV9jYiAtIHRoZSBj
YWxsYmFjayBmb3IgYSBkb25lIGpvYgorICogQGY6IGZlbmNlCisgKiBAY2I6IGZlbmNlIGNhbGxi
YWNrcworICovCitzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX2RvbmVfY2Ioc3RydWN0IGRtYV9m
ZW5jZSAqZiwgc3RydWN0IGRtYV9mZW5jZV9jYiAqY2IpCit7CisJc3RydWN0IGRybV9zY2hlZF9q
b2IgKnNfam9iID0gY29udGFpbmVyX29mKGNiLCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgY2IpOwor
CisJZHJtX3NjaGVkX2pvYl9kb25lKHNfam9iKTsKK30KKwogLyoqCiAgKiBkcm1fc2NoZWRfZGVw
ZW5kZW5jeV9vcHRpbWl6ZWQKICAqCkBAIC00NzMsMTQgKzUwNSwxNCBAQCB2b2lkIGRybV9zY2hl
ZF9zdGFydChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLCBib29sIGZ1bGxfcmVjb3Zl
cnkpCiAKIAkJaWYgKGZlbmNlKSB7CiAJCQlyID0gZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhmZW5j
ZSwgJnNfam9iLT5jYiwKLQkJCQkJCSAgIGRybV9zY2hlZF9wcm9jZXNzX2pvYik7CisJCQkJCQkg
ICBkcm1fc2NoZWRfam9iX2RvbmVfY2IpOwogCQkJaWYgKHIgPT0gLUVOT0VOVCkKLQkJCQlkcm1f
c2NoZWRfcHJvY2Vzc19qb2IoZmVuY2UsICZzX2pvYi0+Y2IpOworCQkJCWRybV9zY2hlZF9qb2Jf
ZG9uZShzX2pvYik7CiAJCQllbHNlIGlmIChyKQogCQkJCURSTV9FUlJPUigiZmVuY2UgYWRkIGNh
bGxiYWNrIGZhaWxlZCAoJWQpXG4iLAogCQkJCQkgIHIpOwogCQl9IGVsc2UKLQkJCWRybV9zY2hl
ZF9wcm9jZXNzX2pvYihOVUxMLCAmc19qb2ItPmNiKTsKKwkJCWRybV9zY2hlZF9qb2JfZG9uZShz
X2pvYik7CiAJfQogCiAJaWYgKGZ1bGxfcmVjb3ZlcnkpIHsKQEAgLTYzNSwzMSArNjY3LDYgQEAg
ZHJtX3NjaGVkX3NlbGVjdF9lbnRpdHkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkK
IAlyZXR1cm4gZW50aXR5OwogfQogCi0vKioKLSAqIGRybV9zY2hlZF9wcm9jZXNzX2pvYiAtIHBy
b2Nlc3MgYSBqb2IKLSAqCi0gKiBAZjogZmVuY2UKLSAqIEBjYjogZmVuY2UgY2FsbGJhY2tzCi0g
KgotICogQ2FsbGVkIGFmdGVyIGpvYiBoYXMgZmluaXNoZWQgZXhlY3V0aW9uLgotICovCi1zdGF0
aWMgdm9pZCBkcm1fc2NoZWRfcHJvY2Vzc19qb2Ioc3RydWN0IGRtYV9mZW5jZSAqZiwgc3RydWN0
IGRtYV9mZW5jZV9jYiAqY2IpCi17Ci0Jc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iID0gY29u
dGFpbmVyX29mKGNiLCBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgY2IpOwotCXN0cnVjdCBkcm1fc2No
ZWRfZmVuY2UgKnNfZmVuY2UgPSBzX2pvYi0+c19mZW5jZTsKLQlzdHJ1Y3QgZHJtX2dwdV9zY2hl
ZHVsZXIgKnNjaGVkID0gc19mZW5jZS0+c2NoZWQ7Ci0KLQlhdG9taWNfZGVjKCZzY2hlZC0+aHdf
cnFfY291bnQpOwotCWF0b21pY19kZWMoJnNjaGVkLT5zY29yZSk7Ci0KLQl0cmFjZV9kcm1fc2No
ZWRfcHJvY2Vzc19qb2Ioc19mZW5jZSk7Ci0KLQlkbWFfZmVuY2VfZ2V0KCZzX2ZlbmNlLT5maW5p
c2hlZCk7Ci0JZHJtX3NjaGVkX2ZlbmNlX2ZpbmlzaGVkKHNfZmVuY2UpOwotCWRtYV9mZW5jZV9w
dXQoJnNfZmVuY2UtPmZpbmlzaGVkKTsKLQl3YWtlX3VwX2ludGVycnVwdGlibGUoJnNjaGVkLT53
YWtlX3VwX3dvcmtlcik7Ci19Ci0KIC8qKgogICogZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiAt
IGZldGNoIHRoZSBuZXh0IGZpbmlzaGVkIGpvYiB0byBiZSBkZXN0cm95ZWQKICAqCkBAIC04MDks
OSArODE2LDkgQEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkKIAkJaWYg
KCFJU19FUlJfT1JfTlVMTChmZW5jZSkpIHsKIAkJCXNfZmVuY2UtPnBhcmVudCA9IGRtYV9mZW5j
ZV9nZXQoZmVuY2UpOwogCQkJciA9IGRtYV9mZW5jZV9hZGRfY2FsbGJhY2soZmVuY2UsICZzY2hl
ZF9qb2ItPmNiLAotCQkJCQkJICAgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKTsKKwkJCQkJCSAgIGRy
bV9zY2hlZF9qb2JfZG9uZV9jYik7CiAJCQlpZiAociA9PSAtRU5PRU5UKQotCQkJCWRybV9zY2hl
ZF9wcm9jZXNzX2pvYihmZW5jZSwgJnNjaGVkX2pvYi0+Y2IpOworCQkJCWRybV9zY2hlZF9qb2Jf
ZG9uZShzY2hlZF9qb2IpOwogCQkJZWxzZSBpZiAocikKIAkJCQlEUk1fRVJST1IoImZlbmNlIGFk
ZCBjYWxsYmFjayBmYWlsZWQgKCVkKVxuIiwKIAkJCQkJICByKTsKQEAgLTgyMCw3ICs4MjcsNyBA
QCBzdGF0aWMgaW50IGRybV9zY2hlZF9tYWluKHZvaWQgKnBhcmFtKQogCQkJaWYgKElTX0VSUihm
ZW5jZSkpCiAJCQkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIFBUUl9F
UlIoZmVuY2UpKTsKIAotCQkJZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKE5VTEwsICZzY2hlZF9qb2It
PmNiKTsKKwkJCWRybV9zY2hlZF9qb2JfZG9uZShzY2hlZF9qb2IpOwogCQl9CiAKIAkJd2FrZV91
cCgmc2NoZWQtPmpvYl9zY2hlZHVsZWQpOwotLSAKMi4yOS4yLjQwNC5nZTY3ZmJmOTI3ZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
