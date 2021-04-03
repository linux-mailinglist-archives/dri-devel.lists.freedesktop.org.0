Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4835331F
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 10:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41696E0F2;
	Sat,  3 Apr 2021 08:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA506E0F2;
 Sat,  3 Apr 2021 08:49:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNISa81dIr1uRbr5ZfaAZFXL6l5QF3Moaq2iiChBkqAoxGz3ltmr2K/R6Uhc6DNc1Lx55eKrrbIVf+rUYuvbAujDTtJYQ3pXIrN8y3PH7uouqFYLAbH8HbM3xWdErAvjklbARcWAMnjC31dKAOFbWfNJFzylHgT82kFFL9eWavlkmP63YKBbfpFKcpm1KTIuf66jm7BCXVMSRyfR0j0tASrAeYXWog6R81qGKxWEo1l7BS3MYV6TkysZC3OD2FCoA40aqH8GmVCGvQfqMkJapUdgCPgIVfvGdDR+XwCQJ3IF/bjy5xrN0eyXB/c5YdGpreyLQAQ1EfAaGhYypyd2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SycBJaaY29NM9aFWP0Yzk2K2eCVln17uWfGBBNy8y9c=;
 b=Dvc8EFdI0po1d0r6hovCTjeuJjkOGFxnGApOg5N9fmWyV1SQc9i+sEkh46MyAcLR/BXNRt+ZQqKB3kRdHRiMbbbIZ82Ek/hEQRMNaN2lbH6KzTUQGAp9QBT8OfokMryy/yVw4KNHdOeKES/MuCFHJw+5FC6SJQOIGTgpAYV6YgpeAKNAH2Sy5a3wi96IrljvbWgrXnuBK8NNK3gnCFs13hHKN1J1kfCveoExLEiCrxOjmZfRruAfwR9COLUuKJQ8b7tO4uD01crDh1AkhjfRMKXkei3TXR4Zl3ZgbFCZduF2UNMcgO5MMLyQngFggsIYBKfENhfT01sjWzHNRsSLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SycBJaaY29NM9aFWP0Yzk2K2eCVln17uWfGBBNy8y9c=;
 b=BB5kLRQ1HWnGS5Opb6+cbbr6vHyUA8IKifr70049nvxEVT9TcSgCSKGyhdfb1BsSLjQFazU0+SAVK5ImjduR3mThR5X1bNnz1gpBI16o/zO5Z9H4xbhP+/gq0K/r8sKkOo8LH/i4PAQDB26RGq1D+sp1Jd3SjnpBHCEVvBmnoCA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Sat, 3 Apr
 2021 08:49:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.029; Sat, 3 Apr 2021
 08:49:45 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix a potential sdma invalid access
To: Qu Huang <jinsdb@126.com>, alexander.deucher@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, airlied@redhat.com,
 ray.huang@amd.com, Mihir.Patel@amd.com, nirmoy.aiemd@gmail.com
References: <1617333527-89782-1-git-send-email-jinsdb@126.com>
 <9b876791-7fa4-46da-7aec-1d1bfde83f4e@amd.com>
 <84619284-d401-f018-d627-8e5dfef1ff1f@126.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fc8cf44b-e952-1c48-137a-77c35bbfbb24@amd.com>
Date: Sat, 3 Apr 2021 10:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <84619284-d401-f018-d627-8e5dfef1ff1f@126.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5018:dba8:82e3:cfb7]
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5018:dba8:82e3:cfb7]
 (2a02:908:1252:fb60:5018:dba8:82e3:cfb7) by
 ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Sat, 3 Apr 2021 08:49:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ea7429e-3911-4332-3c66-08d8f67d6e2e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4550012C1B078064BD278AF383799@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HfqgX39JzwZ65F6aN2jAJVcZN75DPjhCLmu4CxOgw1p4+RqG0aMa5OCeV1OkievNNkiczxDqQw183VEOPipO+NcSxhqu4eCQG8JCiixw/aq+/8ucD73TmjPkPEJwUjBxzNzAAb+lnEAJvYw7A1iVfynyPfe7W+HL/vn887WaY5qRZtCLn3/oiQH6Zl+Zpq7kmdL8uVYSufP6To282E5461f6MmJeTlBOahA3mXOuL4fBYAZClT6bxeVxF4a/125AgvUumQW374mXI1Jo57il2K4sr90zTYMV4o7Yhpc3khKXXd/61SjrT0aUoVjVfQXQeEXEJ3U/sg/Y9hbDwklaQd9OHbBUg+LQCGg6Sy4FmFwasfaXrchtreOoLn8QmKVnAWKe3vkciTgB1QYdSFukdYTE9iHx/jMDPhkeHeN9f18cqPsl1UAaRNRhq4U6wIS+YDW938NrJu6hPpUWbX804zzQkbx1utTw11Sk9GdehAWEog1SNnjXbrUrBjTDh8mUtWpLcdTDxKIGkTzPdoCicB9NSRUTiRQKzkkOP89XogIjyhjMXUTo3/CESGAc8ck/LHxWdxHNDhyb1T1ib5sPMW2xlL3bUuMuEPUNLPaLXpiGzAqhpcrFadVsOK5b92l/bMGg0h++lpD/doy88XAjPF40+4vV/ilJFLboDYcqLBnKJOkv+jVwkHEz8rD7NLCK5hjZrLMqclcYo1qb4mXbBBARmFNPcqJJdGnJH66Lj+hzz4uY+Ue7pxS6i6LLWvsh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(8936002)(66946007)(36756003)(86362001)(7416002)(4326008)(5660300002)(66476007)(31686004)(66556008)(478600001)(2616005)(186003)(38100700001)(66574015)(31696002)(52116002)(6666004)(16526019)(2906002)(53546011)(8676002)(83380400001)(6486002)(316002)(525324003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTQ1OGRYNnhaTXhUNVZFZFdubERzY1IyK2FKUnJMMHQ0U2ZyME5BVFFIRTRF?=
 =?utf-8?B?WU5UK1hhOGFvZlYwQjBRbTROSkhxZTBydGRzaFlTdzdFdmhqUzVoRWxSNTE0?=
 =?utf-8?B?Q3FhRGptNERhT1F6b0dWSU9TVUpxb1hQSkRkOW9EdmgwMW5oRUVsdC9pRmUr?=
 =?utf-8?B?V3VNc2M5dEZXR3FvY1M4U0tHdWFuVmwyclR4clpnMmlzb2hBM0krd3lhQWY4?=
 =?utf-8?B?Z3FKSzRRUElnV1kxTzE1ekIzZXVGMFdCUkUyYW5kZ25WaEY5bEg4Rjc5bzNN?=
 =?utf-8?B?d0x1M0FwYzhTNnNmSlVYNnU0OXlYM0h0NWFkbTZiNWtoTTVzWDRMSmVGVmNT?=
 =?utf-8?B?VGR1MUM0MUJRQ1J4MnhlbkRhZldnNkpLQTl3Qnp0NXBZQWhWMmRKZE16Uis1?=
 =?utf-8?B?Vm5iZWJ5WVozOTJ1NkFGMmV3RW9kOWdYenNqWkhYWXNTVXFxd09XNUkwVzZW?=
 =?utf-8?B?Y0lIRXU0TGV1THY5UnJWZU5yQ0FPYlZMNXR5RlhPSWUvYUpmVksrVks1T3pJ?=
 =?utf-8?B?cXhLNEF2ZDdya2hLQXl6b2FObEMyMGxmcWR1QzQ1NC9CRUZ0VE9HdXU0OTFn?=
 =?utf-8?B?OVNCUS9kbVg2MndGbG9ycHhBYlo3U2dnKzRvR1FlWWhjM0FSZkZIcFRXc1FT?=
 =?utf-8?B?aFUvNGRINmQ1Uy9nemFKWXF2SFN5dzVCWTJZUXBPcFR2TlhzVkhvSnUrTnBx?=
 =?utf-8?B?UHFMUGFwem5pN0w4dVlkR3VndDJjVW1UdTBBMXBGMm02OHhRTW9xS0lPcXdN?=
 =?utf-8?B?NThNdVQxMVEwdWVDTlNNZnpjMU8vL2h4ell0Sk5JTnp6SEtKTG1hSVVDTUpS?=
 =?utf-8?B?dk15QmI3RE4zMlBpUkppYUJTbWdTVGtxWXV0SkpTbUVmdlE0SE0rUG9TY1pF?=
 =?utf-8?B?L3BmNVFEMTU4SlBCUFhiTU1ESnJMMCtKYkhrODFSZlIwRG9OL1NNeGxURHhF?=
 =?utf-8?B?R2pjeDFqR29ERCtsUnIrRDFHdTArN0x6L09RTW1xcWphajhqeERVZDJkVzN4?=
 =?utf-8?B?d05xT1YvSjJDSzJvMk8wOUMyc2JnT0pyaGxmcWxxZTFnYWp2b1BTeEZxWW15?=
 =?utf-8?B?YXBTQ1F6L2JDSDlZdUFQVVA1K2ZXZzdPUUxqUklJcDQybzhvblFTT3U0eHNt?=
 =?utf-8?B?bDhhUFphS0V5SVFxL0taMGRCNFhDWThadnpwTlYrbVF3aU1nTUhrVzVJNDNN?=
 =?utf-8?B?OEJlSWdCUEg2a01naFhXMEJFT3htQVNlcTh2U2RWVDAwaWVCLzBCamFjTk9R?=
 =?utf-8?B?eVMydGp4Z0YyN3B1NytHTWZXVlJxZDRvZkZqQXB4R2ljb3F4ZzhkY0tWSjFm?=
 =?utf-8?B?ODZHcVVmZkt4aXhQNm5uaWxDU1RuRG9LK2J0ZkNlaW5pTjFMVVB4Mld3NWM3?=
 =?utf-8?B?QmplZDRYTWVIYzlmVjV5MHZ0ejFDUm9kZ1c0WUdTN2pUQTJkd1BhN1k3WlFj?=
 =?utf-8?B?MnA0YUoxaWIrZDlzemNXNXpSajhTYVRWSWc0M252QlFTMWhhQjBWZmRmUHp3?=
 =?utf-8?B?ZVArUVUrOEs2SkpvSEhnYkpDTDR0NEJrdDdqakhiZDJRVC9DY3h3QVRER1ZR?=
 =?utf-8?B?dndxbE1HT1RsK1U4M3pmczFEZmpZalBMaUtuQy9KeW40M3hYVDZHWkVJZHE0?=
 =?utf-8?B?WG5NdTQ2ZFR5WEUyQ29ncnpJR01qMWxscGVCNXFWaHJqQW16OWZYci9Tajdu?=
 =?utf-8?B?cmorKytXbHJvOThJM1M0OTZ4SmttTkE4QjlibEhMU3p5UmV3OTVEVmFFc0R3?=
 =?utf-8?B?bVIxWEhuSm9BWDdzc2hMTlNSbWY3YXpDMEhHcUdyZmlSTFY0ZldhTEsyeVps?=
 =?utf-8?B?RGN0TjloR3htb2pRT2lBUi9qQjQ0eTBZNEp1SFlRalN6ZnBkcy9wU0tUSTA3?=
 =?utf-8?Q?vmFJgzT2Uug00?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea7429e-3911-4332-3c66-08d8f67d6e2e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2021 08:49:45.5462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZeiX1jLqUaoWwHsaHj7f1dptSeCCYR9FBblCxTGyMBssnXHNj6vMw75LwCnYz6W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUXUsCgpBbSAwMy4wNC4yMSB1bSAwNzowOCBzY2hyaWViIFF1IEh1YW5nOgo+IEhpIENocmlz
dGlhbiwKPgo+IE9uIDIwMjEvNC8zIDA6MjUsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEhp
IFF1LAo+Pgo+PiBBbSAwMi4wNC4yMSB1bSAwNToxOCBzY2hyaWViIFF1IEh1YW5nOgo+Pj4gQmVm
b3JlIGRtYV9yZXN2X2xvY2soYm8tPmJhc2UucmVzdiwgTlVMTCkgaW4gCj4+PiBhbWRncHVfYm9f
cmVsZWFzZV9ub3RpZnkoKSwKPj4+IHRoZSBiby0+YmFzZS5yZXN2IGxvY2sgbWF5IGJlIGhlbGQg
YnkgdHRtX21lbV9ldmljdF9maXJzdCgpLAo+Pgo+PiBUaGF0IGNhbid0IGhhcHBlbiBzaW5jZSB3
aGVuIGJvX3JlbGVhc2Vfbm90aWZ5IGlzIGNhbGxlZCB0aGUgQk8gaGFzIG5vdAo+PiBtb3JlIHJl
ZmVyZW5jZXMgYW5kIGlzIHRoZXJlZm9yZSBkZWxldGVkLgo+Pgo+PiBBbmQgd2UgbmV2ZXIgZXZp
Y3QgYSBkZWxldGVkIEJPLCB3ZSBqdXN0IHdhaXQgZm9yIGl0IHRvIGJlY29tZSBpZGxlLgo+Pgo+
IFllcywgdGhlIGJvIHJlZmVyZW5jZSBjb3VudGVyIHJldHVybiB0byB6ZXJvIHdpbGwgZW50ZXIK
PiB0dG1fYm9fcmVsZWFzZSgpLGJ1dCBub3RpZnkgYm8gcmVsZWFzZSAoY2FsbCBhbWRncHVfYm9f
cmVsZWFzZV9ub3RpZnkoKSkKPiBmaXJzdCBoYXBwZW4sIGFuZCB0aGVuIHRlc3QgaWYgYSByZXNl
cnZhdGlvbiBvYmplY3QncyBmZW5jZXMgaGF2ZSBiZWVuCj4gc2lnbmFsZWQsIGFuZCB0aGVuIG1h
cmsgYm8gYXMgZGVsZXRlZCBhbmQgcmVtb3ZlIGJvIGZyb20gdGhlIExSVSBsaXN0Lgo+Cj4gV2hl
biB0dG1fYm9fcmVsZWFzZSgpIGFuZCB0dG1fbWVtX2V2aWN0X2ZpcnN0KCkgaXMgY29uY3VycmVu
dCwKPiB0aGUgQm8gaGFzIG5vdCBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgTFJVIGxpc3QgYW5kIGlz
IG5vdCBtYXJrZWQgYXMKPiBkZWxldGVkLCB0aGlzIHdpbGwgaGFwcGVuLgoKTm90IHN1cmUgb24g
d2hpY2ggY29kZSBiYXNlIHlvdSBhcmUsIGJ1dCBJIGRvbid0IHNlZSBob3cgdGhpcyBjYW4gaGFw
cGVuLgoKdHRtX21lbV9ldmljdF9maXJzdCgpIGNhbGxzIHR0bV9ib19nZXRfdW5sZXNzX3plcm8o
KSBhbmQgCnR0bV9ib19yZWxlYXNlKCkgaXMgb25seSBjYWxsZWQgd2hlbiB0aGUgQk8gcmVmZXJl
bmNlIGNvdW50IGJlY29tZXMgemVyby4KClNvIHR0bV9tZW1fZXZpY3RfZmlyc3QoKSB3aWxsIHNl
ZSB0aGF0IHRoaXMgQk8gaXMgYWJvdXQgdG8gYmUgZGVzdHJveWVkIAphbmQgc2tpcHMgaXQuCgo+
Cj4gQXMgYSB0ZXN0LCB3aGVuIHdlIHVzZSBDUFUgbWVtc2V0IGluc3RlYWQgb2YgU0RNQSBmaWxs
IGluCj4gYW1kZ3B1X2JvX3JlbGVhc2Vfbm90aWZ5KCksIHRoZSByZXN1bHQgaXMgcGFnZSBmYXVs
dDoKPgo+IFBJRDogNTQ5MMKgwqAgVEFTSzogZmZmZjhlODEzNmUwNDEwMMKgIENQVTogNMKgwqAg
Q09NTUFORDogImdlbW1QZXJmIgo+IMKgICMwIFtmZmZmOGU3OWVhYTE3OTcwXSBtYWNoaW5lX2tl
eGVjIGF0IGZmZmZmZmZmYjI4NjM3ODQKPiDCoCAjMSBbZmZmZjhlNzllYWExNzlkMF0gX19jcmFz
aF9rZXhlYyBhdCBmZmZmZmZmZmIyOTFjZTkyCj4gwqAgIzIgW2ZmZmY4ZTc5ZWFhMTdhYTBdIGNy
YXNoX2tleGVjIGF0IGZmZmZmZmZmYjI5MWNmODAKPiDCoCAjMyBbZmZmZjhlNzllYWExN2FiOF0g
b29wc19lbmQgYXQgZmZmZmZmZmZiMmY2Yzc2OAo+IMKgICM0IFtmZmZmOGU3OWVhYTE3YWUwXSBu
b19jb250ZXh0IGF0IGZmZmZmZmZmYjJmNWFhYTYKPiDCoCAjNSBbZmZmZjhlNzllYWExN2IzMF0g
X19iYWRfYXJlYV9ub3NlbWFwaG9yZSBhdCBmZmZmZmZmZmIyZjVhYjNkCj4gwqAgIzYgW2ZmZmY4
ZTc5ZWFhMTdiODBdIGJhZF9hcmVhX25vc2VtYXBob3JlIGF0IGZmZmZmZmZmYjJmNWFjYWUKPiDC
oCAjNyBbZmZmZjhlNzllYWExN2I5MF0gX19kb19wYWdlX2ZhdWx0IGF0IGZmZmZmZmZmYjJmNmY2
YzAKPiDCoCAjOCBbZmZmZjhlNzllYWExN2MwMF0gZG9fcGFnZV9mYXVsdCBhdCBmZmZmZmZmZmIy
ZjZmOTI1Cj4gwqAgIzkgW2ZmZmY4ZTc5ZWFhMTdjMzBdIHBhZ2VfZmF1bHQgYXQgZmZmZmZmZmZi
MmY2Yjc1OAo+IMKgwqDCoMKgIFtleGNlcHRpb24gUklQOiBtZW1zZXQrMzFdCj4gwqDCoMKgwqAg
UklQOiBmZmZmZmZmZmIyYjg2NjhmwqAgUlNQOiBmZmZmOGU3OWVhYTE3Y2U4wqAgUkZMQUdTOiAw
MDAxMGExNwo+IMKgwqDCoMKgIFJBWDogYmViZWJlYmViZWJlYmViZcKgIFJCWDogZmZmZjhlNzQ3
YmZmMTBjMMKgIFJDWDogMDAwMDA2MGIwMDIwMDAwMAo+IMKgwqDCoMKgIFJEWDogMDAwMDAwMDAw
MDAwMDAwMMKgIFJTSTogMDAwMDAwMDAwMDAwMDBiZcKgIFJESTogZmZmZmFiODA3ZjAwMDAwMAo+
IMKgwqDCoMKgIFJCUDogZmZmZjhlNzllYWExN2QxMMKgwqAgUjg6IGZmZmY4ZTc5ZWFhMTQwMDDC
oMKgIFI5OiBmZmZmYWI3YzgwMDAwMDAwCj4gwqDCoMKgwqAgUjEwOiAwMDAwMDAwMDAwMDBiY2Jh
wqAgUjExOiAwMDAwMDAwMDAwMDAwMWJhwqAgUjEyOiBmZmZmOGU3OWViYWE0MDUwCj4gwqDCoMKg
wqAgUjEzOiBmZmZmYWI3YzgwMDAwMDAwwqAgUjE0OiAwMDAwMDAwMDAwMDIyNjAwwqAgUjE1OiBm
ZmZmOGU4MTM2ZTA0MTAwCj4gwqDCoMKgwqAgT1JJR19SQVg6IGZmZmZmZmZmZmZmZmZmZmbCoCBD
UzogMDAxMMKgIFNTOiAwMDE4Cj4gIzEwIFtmZmZmOGU3OWVhYTE3Y2U4XSBhbWRncHVfYm9fcmVs
ZWFzZV9ub3RpZnkgYXQgZmZmZmZmZmZjMDkyZjJkMSAKPiBbYW1kZ3B1XQo+ICMxMSBbZmZmZjhl
NzllYWExN2QxOF0gdHRtX2JvX3JlbGVhc2UgYXQgZmZmZmZmZmZjMDhmMzlkZCBbYW1kdHRtXQo+
ICMxMiBbZmZmZjhlNzllYWExN2Q1OF0gYW1kdHRtX2JvX3B1dCBhdCBmZmZmZmZmZmMwOGYzYzhj
IFthbWR0dG1dCj4gIzEzIFtmZmZmOGU3OWVhYTE3ZDY4XSBhbWR0dG1fYm9fdm1fY2xvc2UgYXQg
ZmZmZmZmZmZjMDhmN2FjOSBbYW1kdHRtXQo+ICMxNCBbZmZmZjhlNzllYWExN2Q4MF0gcmVtb3Zl
X3ZtYSBhdCBmZmZmZmZmZmIyOWVmMTE1Cj4gIzE1IFtmZmZmOGU3OWVhYTE3ZGEwXSBleGl0X21t
YXAgYXQgZmZmZmZmZmZiMjlmMmM2NAo+ICMxNiBbZmZmZjhlNzllYWExN2U1OF0gbW1wdXQgYXQg
ZmZmZmZmZmZiMjg5NDBjNwo+ICMxNyBbZmZmZjhlNzllYWExN2U3OF0gZG9fZXhpdCBhdCBmZmZm
ZmZmZmIyODlkYzk1Cj4gIzE4IFtmZmZmOGU3OWVhYTE3ZjEwXSBkb19ncm91cF9leGl0IGF0IGZm
ZmZmZmZmYjI4OWU0Y2YKPiAjMTkgW2ZmZmY4ZTc5ZWFhMTdmNDBdIHN5c19leGl0X2dyb3VwIGF0
IGZmZmZmZmZmYjI4OWU1NDQKPiAjMjAgW2ZmZmY4ZTc5ZWFhMTdmNTBdIHN5c3RlbV9jYWxsX2Zh
c3RwYXRoIGF0IGZmZmZmZmZmYjJmNzRkZGIKCldlbGwgdGhhdCBtaWdodCBiZSBwZXJmZWN0bHkg
ZXhwZWN0ZWQuIFZSQU0gaXMgbm90IG5lY2Vzc2FyaWx5IENQVSAKYWNjZXNzaWJsZS4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+IFF1Lgo+Cj4KPj4gUmVnYXJkcywKPj4gQ2hy
aXN0aWFuLgo+Pgo+Pj4gYW5kIHRoZSBWUkFNIG1lbSB3aWxsIGJlIGV2aWN0ZWQsIG1lbSByZWdp
b24gd2FzIHJlcGxhY2VkCj4+PiBieSBHdHQgbWVtIHJlZ2lvbi4gYW1kZ3B1X2JvX3JlbGVhc2Vf
bm90aWZ5KCkgd2lsbCB0aGVuCj4+PiBob2xkIHRoZSBiby0+YmFzZS5yZXN2IGxvY2ssIGFuZCBT
RE1BIHdpbGwgZ2V0IGFuIGludmFsaWQKPj4+IGFkZHJlc3MgaW4gYW1kZ3B1X2ZpbGxfYnVmZmVy
KCksIHJlc3VsdGluZyBpbiBhIFZNRkFVTFQKPj4+IG9yIG1lbW9yeSBjb3JydXB0aW9uLgo+Pj4K
Pj4+IFRvIGF2b2lkIGl0LCB3ZSBoYXZlIHRvIGhvbGQgYm8tPmJhc2UucmVzdiBsb2NrIGZpcnN0
LCBhbmQKPj4+IGNoZWNrIHdoZXRoZXIgdGhlIG1lbS5tZW1fdHlwZSBpcyBUVE1fUExfVlJBTS4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBRdSBIdWFuZyA8amluc2RiQDEyNi5jb20+Cj4+PiAtLS0K
Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDggKysr
KysrLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0
LmMKPj4+IGluZGV4IDRiMjliODIuLjgwMTg1NzQgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+Pj4gQEAgLTEzMDAsMTIgKzEzMDAsMTYgQEAg
dm9pZCBhbWRncHVfYm9fcmVsZWFzZV9ub3RpZnkoc3RydWN0Cj4+PiB0dG1fYnVmZmVyX29iamVj
dCAqYm8pCj4+PiDCoMKgwqDCoMKgIGlmIChiby0+YmFzZS5yZXN2ID09ICZiby0+YmFzZS5fcmVz
dikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfYW1ka2ZkX3JlbW92ZV9mZW5jZV9vbl9w
dF9wZF9ib3MoYWJvKTsKPj4+Cj4+PiAtwqDCoMKgIGlmIChiby0+bWVtLm1lbV90eXBlICE9IFRU
TV9QTF9WUkFNIHx8ICFiby0+bWVtLm1tX25vZGUgfHwKPj4+IC3CoMKgwqDCoMKgwqDCoCAhKGFi
by0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9WUkFNX1dJUEVfT05fUkVMRUFTRSkpCj4+PiAr
wqDCoMKgIGlmICghKGFiby0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9WUkFNX1dJUEVfT05f
UkVMRUFTRSkpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4KPj4+IMKgwqDCoMKg
wqAgZG1hX3Jlc3ZfbG9jayhiby0+YmFzZS5yZXN2LCBOVUxMKTsKPj4+Cj4+PiArwqDCoMKgIGlm
IChiby0+bWVtLm1lbV90eXBlICE9IFRUTV9QTF9WUkFNIHx8ICFiby0+bWVtLm1tX25vZGUpIHsK
Pj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfcmVzdl91bmxvY2soYm8tPmJhc2UucmVzdik7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiDCoMKgwqDCoMKg
IHIgPSBhbWRncHVfZmlsbF9idWZmZXIoYWJvLCBBTURHUFVfUE9JU09OLCBiby0+YmFzZS5yZXN2
LCAKPj4+ICZmZW5jZSk7Cj4+PiDCoMKgwqDCoMKgIGlmICghV0FSTl9PTihyKSkgewo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGFtZGdwdV9ib19mZW5jZShhYm8sIGZlbmNlLCBmYWxzZSk7Cj4+PiAt
LSAKPj4+IDEuOC4zLjEKPj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
