Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6BC158542
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 22:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776CF6E24D;
	Mon, 10 Feb 2020 21:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81236E248;
 Mon, 10 Feb 2020 21:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQC6BlPyzxCjmJtNODxvuAExQj2QATzJ4RHA13wNOxRNitjVZho4DlqbwWGjAp4iDdZR/gah1mtS62poqhHiU2y3MMcEm2ArxLZxpQuwW7Mpj1HfGgALBZOCK5D78S2FFVSd+ox6tHY8/DspcS40ULlDISbNjnxd2yRM6FeBtey5Vd6u8ME9AyedPXmyAN29QJkjkmm01W5OnShCDjoaUuam1ElQF2LhXbVopBD58dCd6kpmAnqLtqy61i/BKzPMmi73ECba7+0hR9q1nZDrQWgJcsTeoynnKxywil8DoJyeofx+FDZfvvRWE6n6v0eCNR8JpUhiAzypi/4BnSj5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2/VWtj9SJdnO8+npHrxvvque3Q6F9wF+C8sqkFfRBk=;
 b=AfOC7ypEwZlCnP3jLLy9aApf/wz38lxqkqBp9oGkb74d7DWKu0M/a9UK3Kv5fXnNXN9SW5XuyBc4AR/hL6WlJjpKTtO7opalPbAGYrEQmoPz3PPW6O5ELSm4srGOeGnCiGK2XAnfy2QctGRHv9b5c0Sl8+d6Fc2tZ3z+y+LZSUDk/vC5zKj1doxXHkz/lkLwH/e4sKVxnPIS1bRtq4pyv9L3zcAOThhXZo4WRl/8S4gypGAlQGF/yUaa8888KL//ysi6TTRNKkG/0IKJyjlvuJK2FOJ0loOCqOsRpYSDjQGYAy/G+5EGc44n9+ItGGihlmT5SJlCxndPujYKXwMoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2/VWtj9SJdnO8+npHrxvvque3Q6F9wF+C8sqkFfRBk=;
 b=iyOj6MazeY4lwr+cpOk5eo379OGWhZsypbIOQpqlizqBuY+U6WHgGWecsBWXXb1xIUqF5t3Bcew56IDX/dYvlS2mm14VASEo9ujmN5K3B+PofFBmMZEEFv2ZV91IU0S3IUI6UBhn3zNR30xW3+/iT4K4s5yTM2UbAVkVgSTnA7o=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (20.178.29.90) by
 DM6PR12MB3049.namprd12.prod.outlook.com (20.178.31.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Mon, 10 Feb 2020 21:50:33 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::799b:b372:6589:c8a]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::799b:b372:6589:c8a%7]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 21:50:33 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
 <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
Date: Mon, 10 Feb 2020 16:50:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
Content-Language: en-CA
X-ClientProxiedBy: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:115::26)
MIME-Version: 1.0
Received: from localhost.localdomain (165.204.55.250) by
 YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Mon, 10 Feb 2020 21:50:32 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6391852-06b8-4208-c5ab-08d7ae7340fb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3049:|DM6PR12MB3049:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB304908E4F8885A223CF65C5299190@DM6PR12MB3049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(189003)(199004)(2616005)(316002)(54906003)(956004)(110136005)(86362001)(52116002)(31696002)(26005)(2906002)(31686004)(53546011)(6506007)(16526019)(186003)(6486002)(66476007)(66946007)(6512007)(66556008)(5660300002)(478600001)(4326008)(8936002)(966005)(45080400002)(8676002)(44832011)(36756003)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3049;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CnU2tmhNsDIVFedRhzlrGIxjptTX1j1cJla03oZRjnMoSIneQMp8qohRyUDOA8sefbSK8vadOQgaNhFsrfvBZccp5Q9385nni/s9pKPLn6DW9wI8P9hfPBQyu0PVTAfyJ4quPmkOatq32926LOOBWh/eSDs3dB6mItUD3raDwpLcnpYQE+YmDV56oquN/hT3yXSvzkHD7jzFnUkuP29F3jFsyM5nr2zfzQJjUH/5pKBzWAKVe5+aEvd5dwNmjiL6Ay6CKlwkA0Kv7Sz3PIRGsDcjqzZYGvx/dwIMlvOyOjDlFPSIFzVcWH2jRJLygWXMGD+nA2nTAbNh6MvmXB9zHDd682rZfy4EZKBCCrm5o8GvSlnaTD/5/z/i5ZnbGb+hce22Oe8qHaoEiY1vAxKU59aogD7HuqzlFGQ1XrUjU1oZMuBAR+VdocF794FXBoaCfzE6hlPUhZLvOe7RzJGHQgjSG1CAjUkHCchZDUn6RRtcnucJD1aqE0ZSTI6R6qhDyWqq9VzEMVEYibPKKKTH2Q==
X-MS-Exchange-AntiSpam-MessageData: dSU7VGq3bFi0WkGUQ16wKA7Bl3fGm9fJ+Ff1b7D4waQfK/rYJFYdHbUtjiH5umE3kPI9YmW23+Upi5oSG+87O0H8nz+dCSZvSCPJKnfL/OFqUcETXo6FpmKXhCzfTYm6U5dvHy7iUWiDTsiDqR3k9g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6391852-06b8-4208-c5ab-08d7ae7340fb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 21:50:33.2187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yivNunzqndpyIp+ahWRiKuZ7C04FWJtYXU9gEc+SfoVlB11HdZLqyzTW2TDfnb7S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
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
Cc: Emily Deng <Emily.Deng@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, steven.price@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCgpUaGFuayB5b3UgZm9yIGJyaW5naW5nIGF3YXJlbmVzcyBvZiB0aGlzIGlzc3Vl
LCBwdWJsaWNseS4KCkFzIHNvb24gYXMgdGhpcyBwYXRjaCBzaG93ZWQgdXAgYmFjayBpbiBOb3Zl
bWJlciBvZiAyMDE5LApJIG9iamVjdGVkIHRvIGl0LCBwcml2YXRlbHkuCgpJIHN1Z2dlc3RlZCB0
byBpbnN0ZWFkIHVzZSBhIF9saXN0XyB0byBzdG9yZSB0aGUgInN0YXRlIiBvZgphbGwgam9icyBv
ZiB0aGUgc2FtZSBzdGF0ZS4gVGhlbiwgYXQgYW55IHRpbWUsIHRpbWVvdXQgaW50ZXJydXB0Cm9y
IHdoYXRldmVyLCB3ZSBjYW4gYXRvbWljYWxseSAoaXJxIHNwaW5sb2NrKSBtb3ZlIHRoZSB0aW1l
b3V0L2JhZApqb2IgdG8gdGhlIHRpbWVkb3V0L2NsZWFudXAvYmFkIGpvYiBsaXN0LCBhbmQgd2Fr
ZSBzb21lb25lIHVwCnRvIGRlYWwgd2l0aCB0aGF0IGxpc3QgYXN5bmNocm9ub3VzbHksIGFuZCBy
ZXR1cm4gZnJvbSB0aGUgaW50ZXJydXB0L2V0Yy4KaW1tZWRpYXRlbHkuCgpUaGVuIGluIGR1ZSB0
aW1lLCBpZiBhbnkgbW9yZSBpbnRlcnJ1cHRzIG9yIHdoYXRub3QgdGFrZSBwbGFjZSwKdGhlIGpv
YiB3aWxsIGVpdGhlciBiZSBpbiB0aGUgdGltZW91dCBsaXN0IG9yIG5vdC4gSWYgaXQgaXQsCnRo
ZW4gdGhlIGluc3RpZ2F0b3IgYmFja3Mgb2ZmIGFzIHNvbWVvbmUgZWxzZSAodGhlIGxpc3QgaGFu
ZGxlcikgd2lsbC9pcwphd2FrZSBhbmQgaGFuZGxpbmcgaXQgKG9idmlvdXNseSBhIHN0YXRlIHZh
cmlhYmxlIG1heSBiZSBrZXB0IGFzIHdlbGwpLgoKVGhpcyBkcmF3cyBzb21ld2hhdCBmcm9tIG15
IGRheXMgd2l0aCBpU0NTSSwgU0NTSSBhbmQgU0FTLCAxNSB5ZWFycyBhZ28sCndoZXJlIGEgZGV2
aWNlIGNhbiBjb21wbGV0ZSBhIGpvYiAodGFzaykgYXQgYW55dGltZSByZWdhcmRsZXNzCm9mIHdo
YXQgdGhlIFNDU0kgbGF5ZXIgInRoaW5rcyIgdGhlIHRhc2sncyBzdGF0ZSBpczogdGltZWQtb3V0
LCBhYm9ydGVkLAp3aGF0ZXZlci4gSXQgaXMgYSB2ZXJ5IHNpbXBsZSBhbmQgZWxlZ2FudCBzb2x1
dGlvbiB3aGljaCBnZW5lcmFsaXplcwp3ZWxsLgoKUmVnYXJkcywKTHViZW4KCk9uIDIwMjAtMDIt
MTAgMTE6NTUgYS5tLiwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4gTHVjYXMgLSBQaW5nIG9u
IG15IHF1ZXN0aW9uIGFuZCBhbHNvIEkgYXR0YWNoZWQgdGhpcyB0ZW1wb3Jhcnkgc29sdXRpb24g
Zm9yIGV0bmF2aXYgdG8gY2xhcmlmeSBteSBwb2ludC4gSWYgdGhhdCBzb21ldGhpbmcgYWNjZXB0
YWJsZSBmb3Igbm93IGF0IGxlYXN0IGkgY2FuIGRvIHRoZSBzYW1lIGZvciB2M2Qgd2hlcmUgaXQg
cmVxdWlyZXMgYSBiaXQgbW9yZSBjb2RlIGNoYW5nZXMuCj4gCj4gQW5kcmV5Cj4gCj4gT24gMi82
LzIwIDEwOjQ5IEFNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+IFdlbGwgYSByZXZlcnQg
d291bGQgYnJlYWsgb3VyIGRyaXZlci4KPj4+Cj4+PiBUaGUgcmVhbCBzb2x1dGlvbiBpcyB0aGF0
IHNvbWVib2R5IG5lZWRzIHRvIHNpdCBkb3duLCBnYXRoZXIgQUxMIHRoZSByZXF1aXJlbWVudHMg
YW5kIHRoZW4gY29tZSB1cCB3aXRoIGEgc29sdXRpb24gd2hpY2ggaXMgY2xlYW4gYW5kIHdvcmtz
IGZvciBldmVyeW9uZS4KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+Cj4+Cj4+IEkgY2FuIHRvIHRha2Ug
b24gdGhpcyBhcyBpbmRlZWQgb3VyIGdlbmVyYWwgZGVzaWduIG9uIHRoaXMgYmVjb21lcyBtb3Jl
IGFuZCBtb3JlIGVudGFuZ2xlZCBhcyBHUFUgcmVzZXQgc2NlbmFyaW9zIGdyb3cgaW4gY29tcGxl
eGl0eSAoYXQgbGVhc3QgaW4gQU1EIGRyaXZlcikuIEN1cnJlbnRseSBJIGFtIG9uIGEgaGlnaCBw
cmlvcml0eSBpbnRlcm5hbCB0YXNrIHdoaWNoIHNob3VsZCB0YWtlIG1lIGFyb3VuZCBhIHdlZWsg
b3IgMiB0byBmaW5pc2ggYW5kIGFmdGVyIHRoYXQgSSBjYW4gZ2V0IHRvIGl0Lgo+Pgo+PiBSZWdh
cmRpbmcgdGVtcG9yYXJ5IHNvbHV0aW9uwqAgLSBJIGxvb2tlZCBpbnRvIHYzZCBhbmQgZXRuYXZp
diB1c2UgY2FzZXMgYW5kIHdlIGluIEFNRCBhY3R1YWxseSBmYWNlIHRoZSBzYW1lIHNjZW5hcmlv
IHdoZXJlIHdlIGRlY2lkZSB0byBza2lwIEhXIHJlc2V0IGlmIHRoZSBndWlsdHkgam9iIGRpZCBm
aW5pc2ggYnkgdGhlIHRpbWUgd2UgYXJlIHByb2Nlc3NpbmcgdGhlIHRpbWVvdXTCoCAoc2VlIGFt
ZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIgYW5kIHNraXBfaHdfcmVzZXQgZ290bykgLSB0aGUgZGlm
ZmVyZW5jZSBpcyB3ZSBhbHdheXMgY2FsbCBkcm1fc2NoZWRfc3RvcC9zdGFydCBpcnJlc3BlY3Rp
dmVseSBvZiB3aGV0aGVyIHdlIGFyZSBnb2luZyB0byBhY3R1YWxseSBIVyByZXNldCBvciBub3Qg
KHNhbWUgYXMgZXh0ZW5kIHRpbWVvdXQpLiBJIHdvbmRlciBpZiBzb21ldGhpbmcgbGlrZSB0aGlz
IGNhbiBiZSBkb25lIGFsc28gZm9yIHZlMyBhbmQgZXRuYXZpdiA/Cj4+Cj4+IEFuZHJleSAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFt
cDtkYXRhPTAyJTdDMDElN0NsdWJlbi50dWlrb3YlNDBhbWQuY29tJTdDY2U5N2JjMjk5ODhlNDA2
OGVmODEwOGQ3YWU0YTA0M2QlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAl
N0MwJTdDNjM3MTY5NTA1Mjc3MzgxMzI3JmFtcDtzZGF0YT1GeVYwcTN5NXVXUHdCZ0pGNVFaTFdB
UmNYYXU5MTZFVWNZZXoyVkElMkZxUkElM0QmYW1wO3Jlc2VydmVkPTAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
