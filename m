Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1E2D801D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 21:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D066E0B7;
	Fri, 11 Dec 2020 20:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D50F6E0B7;
 Fri, 11 Dec 2020 20:44:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMt61MCFDnqtivg+o/PkdgHluVyPq2Va3DTliH+9Pum8ijFr25ep6Bv7HBdNPtdz0Kc8oILTJH5AubSZMXoU23tK27ioTUCvT6RANP1FlKghjzhndgRNy/xjffCY00QmhfzePkjDm3wPwcN3frjIou0SVKz2p/MoaQs78FPGfCQRWKiZAYWXam2nlYffT+WQePJZaiYfVqYyhHO1UFZmq7BcI1y6dDocCYUfwNZ15xXyYpsfi3IhQxWvhHLh9dcTJTd2JU/XnNMEk+8BkXXZa1J+X3tlP4wPFVTEWxd13Y+Tkuexv+HB6zTn3i4pNeaz6ulgkMia2ztbSt8GmqL2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1o0vhdRTuOzLayQfHcH/Fp7QuPCJYVpYpomljEO4ys=;
 b=BVaz5EBaGq5axDBAaCpDyxJex4Y2P5NnhJZ0nIEUFJPoQzPBaL1Vy85micsv3lc24SmLtUu/DwMGzGgz474zXe34Zv3Meewx6MtOmAdHMnE20Y0LylermnTvA5re7YKJsLT+icy3DgbajIpppr5Dw9oFrM5iCF6b1H6acnkMLKpRaxrx+GPq3lKj1ZDrkYtrPQApgcjEGuoqF/04sVZk/800CCLi3DCXjWQWf+bIn69UweV7fZMLM2y3gA/XoxiMdn+aQ7//i7lrfzzmq8ErlgBRGiBFTgQKn9BhGy4NGornz0lGNPeC8sPVvw24Z0bMb7WEiGIDI4N+jqzcZzblxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1o0vhdRTuOzLayQfHcH/Fp7QuPCJYVpYpomljEO4ys=;
 b=WjaD6yaR3Me6PZ7yC1U7WMDdniWn4CHsRGIOz1oFcobt6Krx7w23DRKvPNzBCfPVKPrAHacWh7ZEQZURiPi2H2M3rOsWQMtUcGBf5ZWqRQpFMXJhX2U2H7QxmnPC4GFPEIAmLPkUAIhGtg2Ht54qx4XwiRuV5n281ZBXP6pBh1U=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB0220.namprd12.prod.outlook.com (2603:10b6:4:4e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Fri, 11 Dec
 2020 20:44:47 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.017; Fri, 11 Dec 2020
 20:44:46 +0000
Subject: Re: [PATCH 1/1] drm/scheduler: Job timeout handler returns status (v2)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20201210021438.9190-1-luben.tuikov@amd.com>
 <20201210021438.9190-2-luben.tuikov@amd.com>
 <39a74cea2b6f3bfcc7b86de7a7a1dbcc93e21a7f.camel@pengutronix.de>
 <b42284c3-b774-41dc-d4fa-1a61d9d25df4@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <2c1533c3-aa93-60a4-90b2-bcd1fc105bf9@amd.com>
Date: Fri, 11 Dec 2020 15:44:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <b42284c3-b774-41dc-d4fa-1a61d9d25df4@amd.com>
Content-Language: en-GB
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.250) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 20:44:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29b2aa6b-1ada-4067-fba5-08d89e1598c8
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02202943B5DEAB989F6A367199CA0@DM5PR1201MB0220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92v2ImFlw32iScUxGmNhnRnq38T9rxy6tMlA9jtNLlsU9EdC2SpdC9Rp9qZjkVKPivMeN9UgFtmIz0D1Nb0UJXdVd3CiNFCtvxLZNwyo15pl9yd7wELGOhwn9/IgiQpIsYZsIhcpG00JReGt5iQh13G9D19a/NhbaMnRl9bISA5J5xn3anuMkgZcK/mjSN2Q4XDCgf+mPum66QuYebjSmisge8bwN0hISU/euTtcNUaAmI5a7XAoQuPmCegh4jGIu6XFf/da6WMAo+epa2FHNCdioxBc0snxjNB973oGJeUo7jBBgirvPeDbizzGzrj+BQWklAo5iIIZsxGdDGWkIptc+esatxw67lhJ3iERiIAYd7qreeBEYhnWA8Mk7mmlqXuHaBFyptoV/EmFq1zaDrfOz9gBDpigizup9gc4bH7wrhQBiqsGYWt9Bx8rBznp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(44832011)(36756003)(26005)(66556008)(110136005)(66946007)(8676002)(956004)(7416002)(2906002)(5660300002)(54906003)(2616005)(4326008)(34490700003)(31696002)(6486002)(66574015)(86362001)(83380400001)(66476007)(52116002)(508600001)(6506007)(16526019)(53546011)(6512007)(186003)(8936002)(31686004)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEZ6VFNsRDRIR3pqMFNyMEkyL3E4bHUwSFh6Wnc2UmpQZGk1SUNrS1VCZCtm?=
 =?utf-8?B?a2svcVJsM3BrVWluVGNtMUNXc0VMRm1tV1pRRldBM1l4bjV4em9aV3FFYmY5?=
 =?utf-8?B?UEp0WTNia3c3SEtFOURQcUJ5ejBOZ0xsSllDbmpKQlRkM00vZU9ZMEdrdkhZ?=
 =?utf-8?B?cFdNbHZwQnJJbStDN05hNmUwaVlpeUdvOWlUeDNGejdoamNCdGNiTDA2MHU4?=
 =?utf-8?B?Mi9KMGkvbUVxTUlBenA2cDJQdHJFRWowb0ZPb292WXpyL3FPM2JEOHdPcUwy?=
 =?utf-8?B?cUtjSmNWeVNPckgyS0dubDh0Z1FMV0ExRG94YXY0aFhnTFlKMHZUUXB4MGw1?=
 =?utf-8?B?Z3ordytXSC9Cbmw3VUIrVEJ0MU1FNDNRSnVvYmYvTlJ1U1FBeitJTnFnRW9Z?=
 =?utf-8?B?UlY0bkpqOEQyZnFUQUhXaUM4aE9VTURiWVhRRFNGTGNOQ0hOQ1hzdTREbFo4?=
 =?utf-8?B?NmdPQjVzaEJOcTZXamsxNTJCN21OeURvOEZkcWVUeW4rYm1RcVdVNlBWWEE4?=
 =?utf-8?B?ckJiYlljM0xDU0F4RWYzeE9rSno3S0NsMzhiQmNBb2NPdXZHeUkyMzJsZmZE?=
 =?utf-8?B?ampLQURIUHJVcm1jUGFrblhZeDVrVWtSZks0b2V3UXpldnNTdnJXTjNFTmJX?=
 =?utf-8?B?OFlVSUxlR0dHS1lGOTNLWHNUNUlSY29LSkRKQ1Jwa3hXM2tOVEFTQ2RxdHVZ?=
 =?utf-8?B?SWxGTVdqNDRlZXh6Vy9vNTdyeDlVSHZmV2I4cWZmZHZKbmNTR2xYdWJJSG0y?=
 =?utf-8?B?cUdkdXVHY2xlc28wOXFKY21kZGUxYmJYMWFVcU5VYy9PNHFFZEVmcExBNHRl?=
 =?utf-8?B?WnMwdjgrdmsrVEVSOGo2d2RMM3UzazhZeGxncjNySEhJOGNtMDdtTmFwMEhT?=
 =?utf-8?B?T24zRFRCOUNkRk5tK3NQTjF3VFBFR2d6YkZGM3NuMkY5VDVmbnRVRzFvTzNR?=
 =?utf-8?B?RkhCNDRha1MwODdzclV0eVNWenVHTUhYWjBvR0VVeDM4aXVtbFcrZXh3eXlj?=
 =?utf-8?B?TkhiL2RnbWNqUGF3S2c5eGlpUWlmK05UeVo5dGxsKy9vclh5Q3I4NGZMZ1BL?=
 =?utf-8?B?WkNkdVd2ZkozeGtrMjF1OEh1WHlranVYR0tMTDcvVEdlcElMUloyV3d4VGU5?=
 =?utf-8?B?WVNmSHVwWGZEK3hxeUVQZnA3VDBMRWo0MTNiaENkZFVVMVJkc29ZSU0xeTBF?=
 =?utf-8?B?azRELzdETmNkNnNCVHMrRG43WS9TUmUwbGsyeEE0cmZZcDFCaWN2TlM4S05U?=
 =?utf-8?B?TU9oUU5LTVlGbjN1VjBjaGozSnRQQXZkbzZGbVVnMkVIS0w0QlNxSzhSYld5?=
 =?utf-8?Q?Rnhc4HB9Skq8MlzsneUCn3eQNiWqe+/tPg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 20:44:46.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b2aa6b-1ada-4067-fba5-08d89e1598c8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ou6X061Es2XT4Z6968YfP4R0uV5ayMtV80sEF8G1FDWBsUh4YVHCQl16pm2wERT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0220
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
Cc: kernel test robot <lkp@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMi0xMCA0OjQxIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTAu
MTIuMjAgdW0gMTA6MzEgc2NocmllYiBMdWNhcyBTdGFjaDoKPj4gSGkgTHViZW4sCj4+Cj4+IEFt
IE1pdHR3b2NoLCBkZW4gMDkuMTIuMjAyMCwgMjE6MTQgLTA1MDAgc2NocmllYiBMdWJlbiBUdWlr
b3Y6Cj4+PiBbU05JUF0KPj4+IC1zdGF0aWMgdm9pZCBldG5hdml2X3NjaGVkX3RpbWVkb3V0X2pv
YihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQo+Pj4gK3N0YXRpYyBlbnVtIGRybV90
YXNrX3N0YXR1cyBldG5hdml2X3NjaGVkX3RpbWVkb3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pv
Ygo+Pj4gKwkJCQkJCSAgICAgICAqc2NoZWRfam9iKQo+Pj4gIMKgewo+Pj4gIMKgCXN0cnVjdCBl
dG5hdml2X2dlbV9zdWJtaXQgKnN1Ym1pdCA9IHRvX2V0bmF2aXZfc3VibWl0KHNjaGVkX2pvYik7
Cj4+PiAgwqAJc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUgPSBzdWJtaXQtPmdwdTsKPj4+IEBAIC0x
MjAsOSArMTIxLDE2IEBAIHN0YXRpYyB2b2lkIGV0bmF2aXZfc2NoZWRfdGltZWRvdXRfam9iKHN0
cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpCj4+PiAgIAo+Pj4gIMKgCWRybV9zY2hlZF9y
ZXN1Ym1pdF9qb2JzKCZncHUtPnNjaGVkKTsKPj4+ICAgCj4+PiArCS8qIFRlbGwgdGhlIERSTSBz
Y2hlZHVsZXIgdGhhdCB0aGlzIHRhc2sgbmVlZHMKPj4+ICsJICogbW9yZSB0aW1lLgo+Pj4gKwkg
Ki8KPj4gVGhpcyBjb21tZW50IGRvZXNuJ3QgbWF0Y2ggdGhlIGtlcm5lbCBjb2Rpbmcgc3R5bGUs
IGJ1dCBpdCdzIGFsc28gbW9vdAo+PiBhcyB0aGUgd2hvbGUgYWRkZWQgY29kZSBibG9jayBpc24n
dCBuZWVkZWQuIFRoZSBjb2RlIGp1c3QgYmVsb3cgaXMKPj4gaWRlbnRpY2FsLCBzbyBsZXR0aW5n
IGV4ZWN1dGlvbiBjb250aW51ZSBoZXJlIGluc3RlYWQgb2YgcmV0dXJuaW5nCj4+IHdvdWxkIGJl
IHRoZSByaWdodCB0aGluZyB0byBkbywgYnV0IG1heWJlIHlvdSBtZWFuIHRvIHJldHVybgo+PiBE
Uk1fVEFTS19TVEFUVVNfQ09NUExFVEU/IEl0J3MgYSBiaXQgY29uZnVzaW5nIHRoYXQgYWJvcnRl
ZCBhbmQgam9iCj4+IHN1Y2Nlc3NmdWxseSBmaW5pc2hlZCBzaG91bGQgYmUgc2lnbmFsZWQgd2l0
aCB0aGUgc2FtZSByZXR1cm4gY29kZS4KPiAKPiBZZXMgYW5kIG5vLiBBcyBJIHRyaWVkIHRvIGRl
c2NyaWJlIGluIG15IHByZXZpb3VzIG1haWwgdGhlIG5hbWluZyBvZiB0aGUgCj4gZW51bSB2YWx1
ZXMgaXMgYWxzbyBub3QgdmVyeSBnb29kLgoKSSB0cmllZCB0byBtYWtlIHRoZSBuYW1pbmcgYXMg
bWluaW1hbCBhcyBwb3NzaWJsZToKQ09NUExFVEU6IHRoZSB0YXNrIGlzIG91dCBvZiB0aGUgaGFy
ZHdhcmUuCkFMSVZFOiB0aGUgdGFzayBpcyBpbiB0aGUgaGFyZHdhcmUuCgo+IAo+IFNlZSBldmVu
IHdoZW4gdGhlIGpvYiBoYXMgY29tcGxldGVkIHdlIG5lZWQgdG8gcmVzdGFydCB0aGUgdGltZXIg
Zm9yIHRoZSAKPiBwb3RlbnRpYWwgbmV4dCBqb2IuCgpTdXJlLCB5ZXMuIEJ1dCB0aGlzIGlzIHNv
bWV0aGluZyB3aGljaCB0aGUgRFJNIGRlY2lkZXMtLXdoeSBzaG91bGQKZHJpdmVycyBrbm93IG9m
IHRoZSBpbnRlcm5hbHMgb2YgdGhlIERSTT8gKGkuZS4gdGhhdCBpdCByZXN0YXJ0cwp0aGUgdGlt
ZXIgb3IgdGhhdCB0aGVyZSBpcyBhIHRpbWVyLCBldGMuKSBSZXR1cm4gbWluaW1hbAp2YWx1ZSBh
bmQgbGV0IHRoZSBEUk0gZGVjaWRlIHdoYXQgdG8gZG8gbmV4dC4KCj4gCj4gT25seSB3aGVuIHRo
ZSBkZXZpY2UgaXMgY29tcGxldGVseSBnb25lIGFuZCB1bnJlY292ZXJhYmxlIHdlIHNob3VsZCBu
b3QgCj4gcmVzdGFydCB0aGUgdGltZXIuCgpZZXMsIGFncmVlZC4KCj4gCj4gSSBzdWdnZXN0IHRv
IGVpdGhlciBtYWtlIHRoaXMgYW4gaW50IGFuZCByZXR1cm4gLUVOT0RFViB3aGVuIHRoYXQgCj4g
aGFwcGVucyBvciByZW5hbWUgdGhlIGVudW0gdG8gc29tZXRoaW5nIGxpa2UgRFJNX1NDSEVEX05P
REVWLgoKSXQgd2FzIGFuIGludCwgYnV0IHlvdSBzdWdnZXN0ZWQgdGhhdCBpdCdkIGJlIGEgbWFj
cm8sIHNvIEkgbWFkZQppdCBhbiBlbnVtIHNvIHRoYXQgdGhlIGNvbXBsaWVyIGNhbiBjaGVjayB0
aGUgdmFsdWVzIGFnYWluc3QgdGhlIG1hY3JvcwpyZXR1cm5lZC4KCkkgc3VnZ2VzdGVkLCBEUk1f
VEFTS19TQ0hFRF9FTk9ERVYsIGJ1dCBsZXQgQW5kcmV5IGFkZCBpdAp3aGVuIGhlIGFkZHMgaGlz
IHBhdGNoZXMgb24gdG9wIG9mIG15IHBhdGNoIGhlcmUsIGJlY2F1c2UgaGlzCndvcmsgYWRkcyBo
b3RwbHVnL3VucGx1ZyBzdXBwb3J0LgoKQWxzbywgbm90ZSB0aGF0IGlmIHRoZSBwZW5kaW5nIGxp
c3QgaXMgZnJlZWQsIHdoaWxlIHRoZSBEUk0KaGFkIGJlZW4gYmxvY2tlZCwgaS5lLiBub3RpZmll
ZCB0aGF0IHRoZSBkZXZpY2UgaXMgZ29uZSwKdGhlbiByZXR1cm5pbmcgRFJNX1RBU0tfU0NIRURf
RU5PREVWIHdvdWxkIGJlIG1vb3QsIGFzIHRoZXJlCmFyZSBubyB0YXNrcyBpbiB0aGUgcGVuZGlu
ZyBsaXN0LgoKVGhpcyBwYXRjaCBoZXJlIGlzIGdvb2QgYXMgaXQgaXMsIHNpbmNlIGl0IGlzIG1p
bmltYWwgYW5kIGRvZXNuJ3QgbWFrZQphc3N1bXB0aW9ucyBvbiBEUk0gYmVoYXZpb3VyLgoKUmVn
YXJkcywKTHViZW4KCj4gCj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4gCj4+Cj4+PiArCWRybV9z
Y2hlZF9zdGFydCgmZ3B1LT5zY2hlZCwgdHJ1ZSk7Cj4+PiArCXJldHVybiBEUk1fVEFTS19TVEFU
VVNfQUxJVkU7Cj4+PiArCj4+PiAgwqBvdXRfbm9fdGltZW91dDoKPj4+ICDCoAkvKiByZXN0YXJ0
IHNjaGVkdWxlciBhZnRlciBHUFUgaXMgdXNhYmxlIGFnYWluICovCj4+PiAgwqAJZHJtX3NjaGVk
X3N0YXJ0KCZncHUtPnNjaGVkLCB0cnVlKTsKPj4+ICsJcmV0dXJuIERSTV9UQVNLX1NUQVRVU19B
TElWRTsKPj4+ICDCoH0KPj4gUmVnYXJkcywKPj4gTHVjYXMKPj4KPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
