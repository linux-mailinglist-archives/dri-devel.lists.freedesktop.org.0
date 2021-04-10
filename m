Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B627A35B002
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 21:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A096EC98;
	Sat, 10 Apr 2021 19:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CE96EC98
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 19:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJKSHAX82FyG7595ik9YKTA1S5YsYnVmk72y57A+OIjKKtFPUkgLGWryda6YH28xkQe7+C0hX+BVrXY/Uo9iwHgXGiYoUtD6+H0x+uQzi7g1XBnegkcsZqnXjFb94YwaZeLwLaVgSvUG/hsgpT0h4sNItHPJONMkGi3GdDFxtuTzuJvnhEsv70uLKEgli/nI0dp5QOvx8eN5MEkFXpWQTSVlA8BIljUfezE/4S70veFGcz4M6pcx39hyi84OkLRsHFdoqlW++rRU6v/zyrao0YQMkHlT+ztRl57XEfM4w89uyJunzeiljVRO3pT8a3LMN3tTsxHqLUioTHleR862vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nww0E80uCvG7va4sKaFASjvs/4l6XGrfHZlMauQVAA=;
 b=UORN/6Tixts6YM2yAWJoViZaBXwTR5xwhodU1gw3eMVd0Jvvbq+6XUFISo40U8UZkTZTI93kn6Aly3340P1Sd3ixEGInx3+EwcTM1ZjhrOki9E3QW0sLrIR3c/rO1svuyYL80tHhj0UdXSe8pxqILag5ClGQo9vSIxKw9akzsbtIiNCNaoolQS1qRfswLSCBskoC8pCpqXG1GRBPq/m6Tfe2XEiGY7C0afhHhvSJpLXk2FUe7RF5nG+2/7OwXiH8VgRxeh9MToThQ9CY4Mw+wJzuOKJuuJO8EIuHzVfUbFJdieVc5khGGsEtj1oejfkGJjTc5WHm4n1lwTaqaCLFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nww0E80uCvG7va4sKaFASjvs/4l6XGrfHZlMauQVAA=;
 b=SI2M9Iv8bkvB7WMediA0QafTFbti41qyY+qQ59aiJIYgLG8aQEeGIa/GBs8j1CqtXeYz3oRwe/Y42Oe5MyCZLNBnM55EnsumAWBI5Oilx37ETmQu6KCNPjnWmINFB6WMX8FGVxaYDT4t8gJr8w8NMt9CO3+1Ky+ApJNvsvrn1Ns=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB5982.namprd05.prod.outlook.com (2603:10b6:208:cf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.11; Sat, 10 Apr
 2021 19:04:42 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4042.009; Sat, 10 Apr 2021
 19:04:42 +0000
Subject: Re: [PATCH 2/2] drm/vmwgfx: Make sure unpinning handles reservations
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20210408172245.673785-1-zackr@vmware.com>
 <20210408172245.673785-2-zackr@vmware.com>
 <23071cd3-8133-c1d6-68f9-e423a08dd913@shipmail.org>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <606e3ea0-bdfe-58f3-5f0f-d2421d089166@vmware.com>
Date: Sat, 10 Apr 2021 15:04:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <23071cd3-8133-c1d6-68f9-e423a08dd913@shipmail.org>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: MN2PR15CA0042.namprd15.prod.outlook.com
 (2603:10b6:208:237::11) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 MN2PR15CA0042.namprd15.prod.outlook.com (2603:10b6:208:237::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Sat, 10 Apr 2021 19:04:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816f4bc0-5449-4b35-fd23-08d8fc537f70
X-MS-TrafficTypeDiagnostic: MN2PR05MB5982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB59825A7C6D897F61126FF33DCE729@MN2PR05MB5982.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXzxjTJ7mrzz9TasJoU5jfJ9ir3KlvlQ1/K4AkxMCzRL/uXqk1n9EZq3HmrEAPvfM0QDJg1IB4fvQRtDStDJ9MvDvd5+B3okEtPu+APpQfJUa0dYApaUHezpzs0oQE3Z+/C3WzihxklH8uL4ysrugh+hUVfvztqRdGL8P8j6r0Z8ss1aAzLPnicNy9eVHrP81k8B/yyCCIaM5YfPHm7ezp/00EyDc/T17aED3Xi+aPSDCFZ1sx4WD5W4xGXgoxABeM2xG7eDA6M4rMQf6mKpFG1ZdjWQ2XGZFBAAn0fzE3193DdcctxDURUVa/ie274ayxAZ938rGJcGuJnFwzZQgtLUPMK45HYq5RhwfZu2AuiZzdvw/pD5GxXPEv2ViqUareCkuSH+f6iPHdjg83YecYPmkz7p86oFOLP10XJ+sm+62DntNuV8DixtomlMWys+OhbprP73cpmib+63lONwJ5OaZoPE2uPYAEnXZAMiEWhAGBoK1hJPqwNRxvQyOSVr32ohieVM3lMFtzCrb2FF3LccEu1acbaT18/zYyr6G/meefuNYbsaHeONOb0v+mXImBoDdza+NriQBwJERAi5M/1OpiKqjUbaFO4OYcXHUTEJ3Ho5fIW0jyC7f2vX4RzfsJsFeEsg22KFi/DMzm+VL2McxDjQVI0BRltsJ4LLrpxeekbTIqphdrPk9Zu7U6DH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(66476007)(6486002)(83380400001)(5660300002)(8676002)(66574015)(38100700002)(31686004)(107886003)(66556008)(16526019)(86362001)(36756003)(8936002)(186003)(16576012)(31696002)(54906003)(4326008)(478600001)(2906002)(26005)(316002)(53546011)(2616005)(66946007)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?KzVhQ0xvVHREeFc2T1FKMjF6cERaNzdYeU1rMFlGVEdEM0h3eXNPZDkvR1dH?=
 =?utf-8?B?dC9heEJrN2lzTlRtQm16WStpbE5CNlFYQ0lvcnZ5bXdBcElNaFNZZ1hRdU9u?=
 =?utf-8?B?bjdYVjZJZzR6OWpCa1A2RlpySE5IVVB5SDQ2aTVzK1BBOWFRTHNqN1dOMVU3?=
 =?utf-8?B?TStIZ2xzSUxWNjRpU01WM2JGYU5lWm5HTFR1ejJOZW9OQVJyYnJoTjBnbi9M?=
 =?utf-8?B?bURwWEpMVDZHZ2RGSHhKQ2VlZHhXckE4dWU3MHFRRSszd2tWcU9LS0w2dGtQ?=
 =?utf-8?B?REwwYllyOHpwRWhRY3phU0E3ZnprT3Y3NlBnZmlQMC9lYmVOV2ZQOHd4bEh5?=
 =?utf-8?B?OWliRUtkdkZESnpjSCtTTTVYRUxvcmV0ZkdrMGJ2U3JTN3NLaklVcXE3YTFo?=
 =?utf-8?B?QWJ2UWdid0t5ZjhTV1FLQjJYMzBlODZoS2MrNG9rdm9VaURKZlpRc0JRSFNv?=
 =?utf-8?B?eFBFTW83RnVycmk3dmQxZ3h1RjdQRkhuSlJFWDBrOUord3hMRkdDZXgxVEE4?=
 =?utf-8?B?bnJQWUp5RTJCTHRaRUNkY0dkbHBwMC9jVWhKZDlUU2taWWtnaDVrQmhMRHFu?=
 =?utf-8?B?TndXWVJyTG0ycWlTODhrNUdtTjV4RXVBZ1g2dkdHcXRDc2Y2eTdLZURRYnNH?=
 =?utf-8?B?N0pZM2NtV3B6VGlWWmtnWjVtK0EveVQvL3BwcTh2R1FxSzJ2a1FSLy9GOGpM?=
 =?utf-8?B?ZytWYWtIaUc1cW1OelQwTG1FMUFDUS9FdDYzN1RVU012ck53WUVSazE4T0J2?=
 =?utf-8?B?VVVBbW44c2NERjZFMTN4YVJKaDM4RjFhcWxadndiTWxIaXRjbHRPdkxRY1hk?=
 =?utf-8?B?T2liaGRzZmVJUml6UWhGY0FkTkdMWCtzTU5oR3hiQndDRGtHVDA3THR3Zm0v?=
 =?utf-8?B?dnVOU1B6YjNNUWJ4N2VlYjFyVVBRVlhuOU1yQldHZS9BUWRXZG9paitXeDRT?=
 =?utf-8?B?UlJ1dmxjSHU1Y2cxS3JnR0hjL3duaE5wd2hmVTRTbDNzWnpNa2x5SXlDQnN0?=
 =?utf-8?B?VlNCRThWU0gzSEs3WVhTT2Nwc1IvSzh4d3JvZjE4OHp5ZURwQjdnSHFZSnFW?=
 =?utf-8?B?MjQwN0gva0E2Nkg5b0lWZDR2TUx4cE1Ta3hqNVd0V2hOdGhSeW1pV05SMVht?=
 =?utf-8?B?cnJJMGV6aHhGcUN6NDNiT0oxaHRqM2FTMXhwOHMrenRaOCtMSUsyOUdQWk9E?=
 =?utf-8?B?cVdpM2Z0eDFRZ0EvL2FjcWp1QnFJSkEwa2NQeHRaYzVka1lhZ3dTRkVKdG9u?=
 =?utf-8?B?UDBubmZtS3ZoVHFLY0NiZjlJWHdJOUJDSWtVbXhFeWpWRXBvZE1lSDB5YlJK?=
 =?utf-8?B?VU9HaU9MV3hSYzhiakNScE9tTG5wcUI0ZmE1VXA2Tk1NT0hsNW5penprVWVu?=
 =?utf-8?B?ejNxMmJsRXhEcUxVeDFrRUh5Zkk5TFdVdXZxSVo5N2Fxb2xjRHJVWDQ2SS9C?=
 =?utf-8?B?VzJVK3Q1ZjI0YXM5SXBLOEdrNkt1clJIdFYzb3paTkNyVzdrcFZ6bHF2NGpz?=
 =?utf-8?B?bTEvTHFUWmJ6MkhvR2syMG1iMS8yNG9DRm11MDIyWSt3Z2VUVnpOQU8xV0F3?=
 =?utf-8?B?NEhYV3FBT3Zqc3BLR2swWU1QdTBPcEVXVkpObEYvVVlSZjBKeEswQlI5Mk84?=
 =?utf-8?B?Uy82b1RWTHAxM3B1ZXZ2VmF1RTBlMEc5cld4OVgyck1xcXVOZTNPVXU3b3Y5?=
 =?utf-8?B?WUJoeHZOTDl4dVVhUHBkZGh5VkphYXhYYzhXS2FTQXRpbDROYUlGdUQwY0NG?=
 =?utf-8?Q?cuqI0wMyBHJnKtn+nuklFS92IqFzkXhQRmdjlL5?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816f4bc0-5449-4b35-fd23-08d8fc537f70
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 19:04:42.4810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eVHZSpLcSgqHyU+Y4Ozv3H6GO5LdUk8/W0/qcD5b9AP56zKELPqk5sYNBrvEmxkZLYRacjyjCGUuV9iUL/6dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB5982
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC85LzIxIDM6MzggQU0sIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gSGks
IFphY2ssCj4gCj4gT24gNC84LzIxIDc6MjIgUE0sIFphY2sgUnVzaW4gd3JvdGU6Cj4+IFF1aXRl
IG9mdGVuIGl0J3MgYSBsaXR0bGUgaGFyZCB0byB0ZWxsIGlmIHJlc2VydmF0aW9ucyBhcmUgYWxy
ZWFkeSBoZWxkCj4+IGluIGNvZGUgcGF0aHMgdGhhdCB1bnBpbiBibydzLiBXaGlsZSBvdXIgcGlu
bmluZy91bnBpbm5pbmcgY29kZSBzaG91bGQKPj4gYmUgbW9yZSBleHBsaWNpdCB0aGF0IHJlcXVp
cmVzIGEgc3Vic3RlbnRpYWwgYW1vdW50IG9mIHdvcmsgc28gaW5zdGVhZAo+PiB3ZSBjYW4gYXZv
aWQgdGhlIGlzc3VlcyBieSBtYWtpbmcgc3VyZSB3ZSB0cnkgdG8gcmVzZXJ2ZSBiZWZvcmUgCj4+
IHVucGlubmluZy4KPj4gQmVjYXVzZSB3ZSB1bnBpbiB0aG9zZSBibydzIG9ubHkgb24gZGVzdHJ1
Y3Rpb24vZXJyb3IgcGF0aHMganVzdCB0aGF0IAo+PiBjaGVjawo+PiB0ZWxscyB1cyBpZiB3ZSdy
ZSBhbHJlYWR5IHJlc2VydmVkIG9yIG5vdCBhbmQgYWxsb3dzIHRvIGNsZWFubHkgdW5waW4uCj4+
Cj4+IFJldmlld2VkLWJ5OiBNYXJ0aW4gS3Jhc3RldiA8a3Jhc3Rldm1Adm13YXJlLmNvbT4KPj4g
UmV2aWV3ZWQtYnk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgo+PiBG
aXhlczogZDFhNzNjNjQxYWZkICgiZHJtL3Ztd2dmeDogTWFrZSBzdXJlIHdlIHVucGluIG5vIGxv
bmdlciBuZWVkZWQgCj4+IGJ1ZmZlcnMiKQo+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgo+
PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggfCAxNyArKysr
KysrKysrKysrKysrLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tb2IuYyB8
wqAgOCArKysrLS0tLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9kcnYuaCAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAo+PiBp
bmRleCA4MDg3YTkwMTM0NTUuLjAzYmVmOWMxN2U1NiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmgKPj4gQEAgLTE1MTcsNiArMTUxNywyMSBAQCBzdGF0aWMgaW5saW5lIHN0
cnVjdCB2bXdfc3VyZmFjZSAKPj4gKnZtd19zdXJmYWNlX3JlZmVyZW5jZShzdHJ1Y3Qgdm13X3N1
cmZhY2UgKnNyZikKPj4gwqDCoMKgwqDCoCByZXR1cm4gc3JmOwo+PiDCoCB9Cj4+ICsvKgo+PiAr
ICogdm13X2JvX3VucGluX3NhZmUgLSBjdXJyZW50bHkgcGlubmluZyByZXF1aXJlcyBhIHJlc2Vy
dmF0aW9uIHRvIGJlIAo+PiBoZWxkCj4+ICsgKiBidXQgc29tZXRpbWVzIGl0J3MgaGFyZCB0byB0
ZWxsIGlmIHdlJ3JlIGluIGEgY2FsbGJhY2sgd2hvc2UgcGFyZW50Cj4+ICsgKiBpcyBhbHJlYWR5
IGhvbGRpbmcgYSByZXNlcnZhdGlvbiwgdG8gYXZvaWQgZGVhZGxvYWNrcyB3ZSBoYXZlIHRvIHRy
eQo+PiArICogdG8gZ2V0IGEgcmVzZXJ2YXRpb24gZXhwbGljaXRseSB0byBhbHNvIHRyeSB0byBh
dm9pZCBtZXNzaW5nIHVwIHRoZQo+PiArICogaW50ZXJuYWwgdHRtIGxydSBibyBsaXN0Cj4+ICsg
Ki8KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB2bXdfYm9fdW5waW5fc2FmZShzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvKQo+PiArewo+PiArwqDCoMKgIGJvb2wgbG9ja2VkID0gZG1hX3Jlc3Zf
dHJ5bG9jayhiby0+YmFzZS5yZXN2KTsKPiAKPiBJc24ndCB0aGVyZSBhIGNoYW5jZSBhbm90aGVy
IHRocmVhZCBpcyBob2xkaW5nIHRoZSBsb2NrIGFuZCByZWxlYXNpbmcgaXQgCj4gYXQgdGhpcyBw
b3NpdGlvbj8KClllcywgaXQgd2FzIGRlZmluaXRlbHkgcG9zc2libGUuIEluIHYyIEkgaW1wbGVt
ZW50ZWQgaXQgdGhlIHdheSBEYW5pZWwgCnN1Z2dlc3RlZCwgSSB0aGluayBpdCdzIGEgZGVjZW50
IGNvbXByb21pc2UuIFRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhdCAKdGhpcyEKCnoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
