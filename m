Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42731B8C6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7AA6E1ED;
	Mon, 15 Feb 2021 12:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540AC6E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:10:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d451ugoTJKWIfVM+OL/xKpBU8cuC1vRtIOP8cfxcPex1He0w70fUCXSSvF5Bd57tdVX5duESPd7OjeaRuMnbP/KNqca7I87d9SfLV/QXivJqyBqUujySkLpG+BUcYJYVpOT2+srlO2vO6Tr4cMGwZRvCtdW8FI2yzKat9RKNPjCMUoNJ9xBD3ypW8UdtAGJ4WhTmPtGxvlv8kmuOok92Q55hQMlrtPNhjDefpy7s/gFYIhBe8gRzZ6ngkWpwl9j0+0hVxNfxmiysYhkt6sciI+Mj4t9KuLtdwW9ALOM4xdFT93vMh4avVFOCRxrcJJ4up4K1H8ZQH/YUH7MQqHf59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQRgbhmFdA7RPj4GwlHs/L351IfylaAsY7zg/BQogmQ=;
 b=hproz+3Zlz0HX73oMQCStnT9BwOaFtKaKjE4Kn2gcd3kDQaRTcn5dFas5gdxzkZtq5zWrkyO6cNn21TFQAfLm4ammCEBndo4Ky4XKyUXe+guCjd1EcazBaG04sQnqQMc7MKImYbnuJM43X9V/oSD3KGTyWrs2211LkSitkH2YvHVpNUBgCbT7G7j40ILYIG0pdjg2DSsXiBSbz5zFOLnorlHjfjv3vMcsnraZCZRUVlI5GhpJbU4lqmjQV5usvw+GgfaVCntKtlGklSulPDE70zZ3Kn9w9qBV7mrZzpE9V9JLYCHAQ12xfrxowQArcxxodL527Z0jqxSyXzoHpIW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQRgbhmFdA7RPj4GwlHs/L351IfylaAsY7zg/BQogmQ=;
 b=Y+pJQM2OxIiDUiGK6o2RG5fqgxKJmqexZPNqZGPEnMgwSdt0au3/ZUctLyNx/8MrRsC+MGXKlUgs5TBr5lsaPxzztgRBn1g0JMd0UIsD6Rux/hwQVssDi5u8pNgUUYYxFQ87kXLEJS5396jJoxkJEtza89YpP4sZuEJXc0a3TSs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:10:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 12:10:19 +0000
Subject: Re: DMA-buf and uncached system memory
To: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
 <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <80c42ce0-6df1-71ab-81ec-e46cc56840ba@amd.com>
Date: Mon, 15 Feb 2021 13:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
 (2a02:908:1252:fb60:3e90:5494:cc4a:73e5) by
 FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.11 via Frontend Transport; Mon, 15 Feb 2021 12:10:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7174aca6-b803-43eb-3187-08d8d1aaa96c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43369DE3146253E70EE3A47A83889@MN2PR12MB4336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3ekg0GQQ/LKr8mvNw2aXxQohA3zhUvVuoX+jGaOnMcMU3b7bjDBfPCzwSRofOidtxSBe8TYfFEoZxUfLHr2EQD//A/DW8ZTCvsmbZ/GFtNKXX13yphIbER6D9Bknst7FRhoQs21NrVOeEB7oYyb/DgKQzxjaZiPm7kbbmDH5rjHNpE4Wh6WhTdjgD+HAsLKv4XLeVzMp8BWsFlFEiSdYpXE+b74Bmg2fVIvfh4RTDgTUkdFpKbPtv4eEJI+hK5uNwNpjcQ0WCRpGJcTBPCKE70OqYfCHYY8EFzW5BOXg1STBssymBmhRLMxnLA6WCwSHPUCnZCJ7RX+9qsq+JgHRKtoSFwMRx9GDXC3qYuf6uBnk01XxRHS4Z59CV3t3OJvjGRoh+3GqcMcJqT7nGA1juomDF45RijJTHiyEwuT7rTtxmnM/BlFe0hC4+3CfqOw7FJ6NR6DCyi+5bzbUJN7Ei+5V6L8LFjcb4Zi8BTInyRxXelVjHKCwnzCk8IYMEiYs2mzEAvaxtY40K8vLp1xNL8IEiLqBnjryHhzdJWIX6oEfVTYAVyF48hRdK5i+twFHtvwQbVt0RMOUbE/wLBhwR+t1PLrRYk5MMAoCufI7xr2vWH2CD2KGfRufObEpeg4dyHICgNUAufcCB+3xLSvCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(110136005)(83380400001)(316002)(66476007)(66946007)(66556008)(2616005)(52116002)(86362001)(8936002)(36756003)(31696002)(6486002)(31686004)(5660300002)(478600001)(4326008)(66574015)(6666004)(186003)(16526019)(2906002)(966005)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFpTRVZ6VU9mR0UzcXpqZEI1NGhteWN3RnRHc2o5bHh5Q1M3cDJUYVB0ZzNK?=
 =?utf-8?B?QzJtZFJ3N1E4S0F5YVJVTGt2NFkxYUd5ODZ5Q3ZXbm9EQTFtdElxQ3dvSmZR?=
 =?utf-8?B?N01Xa0FnaVNjUWFBYmMraFRzd1lIUTQvKzlRYTNLbStSNUl4M1dZM1ZWTXdG?=
 =?utf-8?B?YW0zaXdqUEdOckpYbFU4SUhYVWgzbjF5RGd1UUVjaS9Xam01c0ZFY0tzdnRK?=
 =?utf-8?B?dWFTckppWnZlZnhGaThhV2Fta1VIUWlPa01oL29Uaisyc09oUGNKUXhTZ2Nr?=
 =?utf-8?B?RTVaTmpFWFA1L1F1WEF2YzM0b2NjWDFrbmFRNlJxRTM5SnRRWm9lSHp0eUxr?=
 =?utf-8?B?ZFNoYllDTGVheGNwa2ZJNDAxZnVUQmxVWFp2MmVJb0N3R1VwNUFnQm0zY05p?=
 =?utf-8?B?UkdPd3ROanhobUVCcDBqdWVoOWFTR24zbVFKSHBFVUY2eVhwRjZnNnhyVlU1?=
 =?utf-8?B?Y2NSbVlQd2phUmdDVG95ZjZ4d1MvZlJtOWZ5TWNUZEp2eHhFSG9kODd3LzdB?=
 =?utf-8?B?ZDJQTUFadm51U2k4bHRHNVBDTGxRbXI4SXJEWHJ4dzRGd1lrWFE4NGQ4QUp6?=
 =?utf-8?B?c3dQRjZ0V3FDemdOU2FUd2g4ZEp6NE9lZitwMWZMRjIxN0h3VTkrMlMySzZ3?=
 =?utf-8?B?b25DWUlEek9FMFNBVm5zUDNBUmJkdE5YNXd5MjVueVN6V2x2L283bk5IdzZO?=
 =?utf-8?B?UW0xSkp0SEhyczNoS1VFTlZTNi9sVGJBelBJdXV2akp3K085SWp5SjRMdUsy?=
 =?utf-8?B?Z1FYSHhjdWF0R1A0bWRlUUR0SXd6MXJOb2FETjlWdUc1eFpkdlF3Y1dOWHdB?=
 =?utf-8?B?cERVWnA2bkVNdHI0ZWlzNGZsYVROSnF2cVhueDdVQWpWUVdXNzMrNTk4Unly?=
 =?utf-8?B?amFPRGk4d3lUY3gwTXJkdmVubkZHYjJLajRFbk9vTi9YZlFvKzk1ZGV5djRN?=
 =?utf-8?B?YkRJS0xNaFMzVDl1b0xFRGc5d25xbXgzSExxRlNyUngrQVBTN0FtZTIzR1VT?=
 =?utf-8?B?Zk9iaDVZMWtpVVJWdXUrRDJBWGVzWnhlZVZHaVNtNm56QmdNTFhVMnM1Z1Zv?=
 =?utf-8?B?dk05T00rWjZmT0d0cDR0bENGWWllWHVPL3k0S0FzbVdPYUNIVDFUWmZ1NExn?=
 =?utf-8?B?SWs2Y0hMM2tYRVBVUGhaRXZVTlhoTC92d1BGL002b3VNdS93RkdlM0NoS25j?=
 =?utf-8?B?Vmk3cUZ2V2I4ZjhqVWZka202dHdjVktRUEErZ2w4cHZ6MUpiaHV0MGs2cXBs?=
 =?utf-8?B?cjV0SjVzakYxOW4vekRiOWMyb0xHenlOa0tIRWVTZmxLS0lwRWJmNTBvT0NJ?=
 =?utf-8?B?blZwUlpkRUhCdEZXSXhaMTJwU1pIN3NpV0g3c1ltbS9RV1RqSWVFNjl1aDhq?=
 =?utf-8?B?Q1RES1UxdWRKQ1Yybk96aGtDdWg3MGttSWtZZjF6emVhM3hYQnllR2pRckN4?=
 =?utf-8?B?NWlZUHdHYTlnaG9DM3Qxd0VSOHJzNzFXdFFoWVY1YVRES3V1b01zdllBNG80?=
 =?utf-8?B?cmF5WVd2bXM2ZFVudi83T0hOWjlXelh3ZEszWVVnMTdVbTF3elFCeC9jeXFZ?=
 =?utf-8?B?M25DNk5GdlJvT1hYTHZxL1RqZmRCQ3cxVWpxMkFCS2IrVmpETUdkYitRQTds?=
 =?utf-8?B?RUZ2WWk2aW0wblBUR1MvWXM2NXlTN25UcEVsMmk2d1Z1bVFaRnRlazVrRHJL?=
 =?utf-8?B?VnYrQTJRNFBUTTNxVlhTa25PSlJCdXA3TUlnaTB1MTVTTFlLeTlSRFBKRWdj?=
 =?utf-8?B?TC9WTXBHUUNGWExhUCt4M0RhcURjUDBNNlR5dUMyRzJDZW9BSkVGblBMa3oz?=
 =?utf-8?B?Ym1EV1RySVlCdWN2Njl3VGtwTVhjUWlNZzgvZjNwd2ttQ05MbERqOU1QWTNC?=
 =?utf-8?Q?DenRz48PduoMD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7174aca6-b803-43eb-3187-08d8d1aaa96c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:10:19.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH+3EjADKYNE7CmJnXGaLfR2pq1I024x/AqPTAHuN4Pqpg5TIYTbCf7DknIryaic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxNS4wMi4yMSB1bSAxMzowMCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+IEhpCj4K
PiBBbSAxNS4wMi4yMSB1bSAxMDo0OSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+PiBIaQo+
Pgo+PiBBbSAxNS4wMi4yMSB1bSAwOTo1OCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+PiBI
aSBndXlzLAo+Pj4KPj4+IHdlIGFyZSBjdXJyZW50bHkgd29ya2luZyBhbiBGcmVlc3luYyBhbmQg
ZGlyZWN0IHNjYW4gb3V0IGZyb20gc3lzdGVtIAo+Pj4gbWVtb3J5IG9uIEFNRCBBUFVzIGluIEEr
QSBsYXB0b3BzLgo+Pj4KPj4+IE9uIHByb2JsZW0gd2Ugc3R1bWJsZWQgb3ZlciBpcyB0aGF0IG91
ciBkaXNwbGF5IGhhcmR3YXJlIG5lZWRzIHRvIAo+Pj4gc2NhbiBvdXQgZnJvbSB1bmNhY2hlZCBz
eXN0ZW0gbWVtb3J5IGFuZCB3ZSBjdXJyZW50bHkgZG9uJ3QgaGF2ZSBhIAo+Pj4gd2F5IHRvIGNv
bW11bmljYXRlIHRoYXQgdGhyb3VnaCBETUEtYnVmLgo+Cj4gUmUtcmVhZGluZyB0aGlzIHBhcmFn
cmFoLCBpdCBzb3VuZHMgbW9yZSBhcyBpZiB5b3Ugd2FudCB0byBsZXQgdGhlIAo+IGV4cG9ydGVy
IGtub3cgd2hlcmUgdG8gbW92ZSB0aGUgYnVmZmVyLiBJcyB0aGlzIGFub3RoZXIgY2FzZSBvZiB0
aGUgCj4gbWlzc2luZy1waW4tZmxhZyBwcm9ibGVtPwoKTm8sIHlvdXIgb3JpZ2luYWwgaW50ZXJw
cmV0YXRpb24gd2FzIGNvcnJlY3QuIE1heWJlIG15IHdyaXRpbmcgaXMgYSBiaXQgCnVuc3BlY2lm
aWMuCgpUaGUgcmVhbCB1bmRlcmx5aW5nIGlzc3VlIGlzIHRoYXQgb3VyIGRpc3BsYXkgaGFyZHdh
cmUgaGFzIGEgcHJvYmxlbSAKd2l0aCBsYXRlbmN5IHdoZW4gYWNjZXNzaW5nIHN5c3RlbSBtZW1v
cnkuCgpTbyB0aGUgcXVlc3Rpb24gaXMgaWYgdGhhdCBhbHNvIGFwcGxpZXMgdG8gZm9yIGV4YW1w
bGUgSW50ZWwgaGFyZHdhcmUgb3IgCm90aGVyIGRldmljZXMgYXMgd2VsbCBvciBpZiBpdCBpcyBq
dXN0IHNvbWV0aGluZyBBTUQgc3BlY2lmaWM/CgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gQmVz
dCByZWdhcmRzCj4gVGhvbWFzCj4KPj4+Cj4+PiBGb3Igb3VyIHNwZWNpZmljIHVzZSBjYXNlIGF0
IGhhbmQgd2UgYXJlIGdvaW5nIHRvIGltcGxlbWVudCAKPj4+IHNvbWV0aGluZyBkcml2ZXIgc3Bl
Y2lmaWMsIGJ1dCB0aGUgcXVlc3Rpb24gaXMgc2hvdWxkIHdlIGhhdmUgCj4+PiBzb21ldGhpbmcg
bW9yZSBnZW5lcmljIGZvciB0aGlzPwo+Pgo+PiBGb3Igdm1hcCBvcGVyYXRpb25zLCB3ZSByZXR1
cm4gdGhlIGFkZHJlc3MgYXMgc3RydWN0IGRtYV9idWZfbWFwLCAKPj4gd2hpY2ggY29udGFpbnMg
YWRkaXRpb25hbCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbWVtb3J5IGJ1ZmZlci4gSW4gCj4+IHZy
YW0gaGVscGVycywgd2UgaGF2ZSB0aGUgaW50ZXJmYWNlIGRybV9nZW1fdnJhbV9vZmZzZXQoKSB0
aGF0IAo+PiByZXR1cm5zIHRoZSBvZmZzZXQgb2YgdGhlIEdQVSBkZXZpY2UgbWVtb3J5Lgo+Pgo+
PiBXb3VsZCBpdCBiZSBmZWFzaWJsZSB0byBjb21iaW5lIGJvdGggY29uY2VwdHMgaW50byBhIGRt
YS1idWYgCj4+IGludGVyZmFjZSB0aGF0IHJldHVybnMgdGhlIGRldmljZS1tZW1vcnkgb2Zmc2V0
IHBsdXMgdGhlIGFkZGl0aW9uYWwgCj4+IGNhY2hpbmcgZmxhZz8KPj4KPj4gVGhlcmUnZCBiZSBh
IHN0cnVjdHVyZSBhbmQgYSBnZXR0ZXIgZnVuY3Rpb24gcmV0dXJuaW5nIHRoZSBzdHJ1Y3R1cmUu
Cj4+Cj4+IHN0cnVjdCBkbWFfYnVmX29mZnNldCB7Cj4+IMKgwqDCoMKgwqBib29sIGNhY2hlZDsK
Pj4gwqDCoMKgwqDCoHU2NCBhZGRyZXNzOwo+PiB9Owo+Pgo+PiAvLyByZXR1cm4gb2Zmc2V0IGlu
ICpvZmYKPj4gaW50IGRtYV9idWZfb2Zmc2V0KHN0cnVjdCBkbWFfYnVmICpidWYsIHN0cnVjdCBk
bWFfYnVmX29mZiAqb2ZmKTsKPj4KPj4gV2hhdGV2ZXIgc2V0dGluZ3MgYXJlIHJldHVybmVkIGJ5
IGRtYV9idWZfb2Zmc2V0KCkgYXJlIHZhbGlkIHdoaWxlIAo+PiB0aGUgZG1hX2J1ZiBpcyBwaW5u
ZWQuCj4+Cj4+IEJlc3QgcmVnYXJkcwo+PiBUaG9tYXMKPj4KPj4+Cj4+PiBBZnRlciBhbGwgdGhl
IHN5c3RlbSBtZW1vcnkgYWNjZXNzIHBhdHRlcm4gaXMgYSBQQ0llIGV4dGVuc2lvbiBhbmQgCj4+
PiBhcyBzdWNoIHNvbWV0aGluZyBnZW5lcmljLgo+Pj4KPj4+IFJlZ2FyZHMsCj4+PiBDaHJpc3Rp
YW4uCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
