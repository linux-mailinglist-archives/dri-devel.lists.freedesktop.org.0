Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297451DCDD5
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 15:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAB06E245;
	Thu, 21 May 2020 13:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4916C6E07B;
 Thu, 21 May 2020 13:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4Ioe24dA0JcMz/Hc3EOIXJs9njE2chvQFKUVgMQnXsn4hjkcmKWrvf8tcMqjfZot7sDP9N2loQ5wFf+G2IhlAJpzgukVdli9oQKBPvfDLbYDJ+ho5EAcOedzkoiLk8sWfcKYaScNAs7mohfs4n+MB72QqlMDHz9GPxkJF/o95xHG32n3t22CTNLXGk2BKbs9Qjm02hwUY3JBjGIzLcI40y4W1V3nTGymAJMvpYBAbD/tbfVpvUALz4Y6ObnO/yi55mbcawGSeOFElh5YgFMf3vE0CBGin841tnWrKQA5jfQ9QtRx4S6FG2WI/VTbmHB2ErVAHR0zXP3EbUYW1pI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r4c/u0nJGhzzb0cOlJh0h+Tb3+zMkcxNcqhrS8GFRw=;
 b=OV2TsWt/dR6syYxuCoWBQg1xF94fnfn4rnfGkJj19Mo5gNL10ltwDQ4WRc+jyKY1BhCE+xUaP9YbJ650zaw8n0bL6+FVhGXENvL/kzFVmBeGE3rCgbw2SgQZBBaObkZeuJPIqJqLCbm4W3fhh+LidUuSJ9KjA+TMDkMC7104jT9VDi7/cGaTOIDRx9PG1EIK9DY22VaA/auGk8S+Qfdom4p3FFBtY7uuRhB9ubYj0d+ev9fuoTUXViEjmZkQIfIDxLUBtt7IK6YkB7K4ZKESt0ycafzosc3PkQG38ycf7R44FPFbhLzQDJY3TY5dvfhjZwou099HnAmtghFtAjAW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r4c/u0nJGhzzb0cOlJh0h+Tb3+zMkcxNcqhrS8GFRw=;
 b=hqv9O0ZqSZyvSc8lZwHb+8eSN8uJr+Hvlngvv1R8SmmVTaIC5qUwnTs3+xLR7ufo9mb4EF3Tv33nu6/4i4S6d+dwarkUy/6SIA/+tFwGeNEMs9tl2s4RgH5gOurTecD4Mw4dD4bb8oYyYOkyrTVUtTN/uTH1TKI/HOv+vMOvGbk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 21 May
 2020 13:20:19 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Thu, 21 May 2020
 13:20:19 +0000
Subject: Re: [PATCH v1 13/25] dma-buf: Use sequence counter with associated
 wound/wait mutex
To: "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200519214547.352050-14-a.darwish@linutronix.de>
 <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
 <20200521000930.GA359643@debian-buster-darwi.lab.linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cfde5db9-2b05-52df-4f88-1928779db669@amd.com>
Date: Thu, 21 May 2020 15:20:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200521000930.GA359643@debian-buster-darwi.lab.linutronix.de>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.24 via Frontend Transport; Thu, 21 May 2020 13:20:11 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed5e00d8-ae0e-4154-8b1b-08d7fd89b505
X-MS-TrafficTypeDiagnostic: DM6PR12MB4139:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB41398F7161EA0E006681D40A83B70@DM6PR12MB4139.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEL0NUeUWJfNg9FPTJuUTJY5TP9DmXyc65UYhlyTVon6IJYUzMeHJWU/6av3Xj4DARwotBufJtpb/BM1DZN7Ky9eFEdBdxRXlr4DM8franPl0Do+ye5ieCH3ixtbD6BmCSjIS3KnxJX+7SAnatZRl/9AlWTmJLGS8kYZ281iLKnTl9YAj+7UnILX/5V749OomYnsuQUvsauVDHeFDymIGDrO5aiAamN9W6nRP/jQI1xK6KJ33ZrUTAnTLlGM6zmVkpqvMaY9YDJxzV8GKQJniCYAqEOX5BXN01SUWmlsxkmJy5d2VAdJl/AeL8IJ0j9+mdONl/aVdtPtQ0FbexkjHY+wWyu+/ce9ca+bqh6ctlCFvp0LHmN0TYk/OUulVAjl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(7416002)(2616005)(186003)(6666004)(5660300002)(31686004)(66556008)(66946007)(66574014)(66476007)(36756003)(478600001)(8936002)(2906002)(16526019)(6486002)(8676002)(316002)(110136005)(4326008)(86362001)(31696002)(54906003)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: B46FXa2FCEaz+dG67toXIgVNuSsaLcpscjHId66nMMlW47umexbk1+N8e/SI7IGgOzntViF6BSRiSOR/4cFF+eypQ60qbVRrkeIJXS+vmTcP5hSFV72mvI1EPPlqK77kU2B0B83yoHrXASNLh8wPX7g1Q8zAXVFqlb7Nx9U29zVDoCkQdPVie7D859C0POY6Nttd8SMy8dOSCCqmUic/aPu0shJP5JdgUMx0n0M1yWg15OTxBJZY7FsVL/NY8HqCAdT3QLuq464PvzJs92JcQ9eTnj9XUv7CALLNPvKy5cAqhbB8plMZmQNBR25R9VV6TZUH+ytFeKyYvTLZ6wScQLqfG9eXmKZMZt+9/wNpZh76Al6pJ7MyWjYxID5zhAwYiKNypF/cG+Ktks1fWjgG6xbq//+3UetwWrChZJe+7FKlF+Cl0fgNszLCK5FhIziSl8Z93Noj2reGfZri6XC79CbpkdaV12Kj0JvK+6E07Yr2EQurMbdMJUNrGPKmWXi8+akteByoGMcAWvYaFk9ssnPrzoRM/+3R4Ka6k8tbSFsywZMkL2Lcwjt29EuRcfCc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5e00d8-ae0e-4154-8b1b-08d7fd89b505
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 13:20:18.8667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ob6VJAffOdCyKSe3wkyrTxBr7MfV0pbv/MwlM6ukBm4ugF0xih2Wn/LaFNVRMQW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
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
Cc: dri-devel@lists.freedesktop.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDUuMjAgdW0gMDI6MDkgc2NocmllYiBBaG1lZCBTLiBEYXJ3aXNoOgo+IE9uIFdlZCwg
TWF5IDIwLCAyMDIwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAxOS4wNS4yMCB1bSAy
Mzo0NSBzY2hyaWViIEFobWVkIFMuIERhcndpc2g6Cj4+PiBBIHNlcXVlbmNlIGNvdW50ZXIgd3Jp
dGUgc2lkZSBjcml0aWNhbCBzZWN0aW9uIG11c3QgYmUgcHJvdGVjdGVkIGJ5IHNvbWUKPj4+IGZv
cm0gb2YgbG9ja2luZyB0byBzZXJpYWxpemUgd3JpdGVycy4gSWYgdGhlIHNlcmlhbGl6YXRpb24g
cHJpbWl0aXZlIGlzCj4+PiBub3QgZGlzYWJsaW5nIHByZWVtcHRpb24gaW1wbGljaXRseSwgcHJl
ZW1wdGlvbiBoYXMgdG8gYmUgZXhwbGljaXRseQo+Pj4gZGlzYWJsZWQgYmVmb3JlIGVudGVyaW5n
IHRoZSBzZXF1ZW5jZSBjb3VudGVyIHdyaXRlIHNpZGUgY3JpdGljYWwKPj4+IHNlY3Rpb24uCj4+
Pgo+Pj4gVGhlIGRtYS1idWYgcmVzZXJ2YXRpb24gc3Vic3lzdGVtIHVzZXMgcGxhaW4gc2VxdWVu
Y2UgY291bnRlcnMgdG8gbWFuYWdlCj4+PiB1cGRhdGVzIHRvIHJlc2VydmF0aW9ucy4gV3JpdGVy
IHNlcmlhbGl6YXRpb24gaXMgYWNjb21wbGlzaGVkIHRocm91Z2ggYQo+Pj4gd291bmQvd2FpdCBt
dXRleC4KPj4+Cj4+PiBBY3F1aXJpbmcgYSB3b3VuZC93YWl0IG11dGV4IGRvZXMgbm90IGRpc2Fi
bGUgcHJlZW1wdGlvbiwgc28gdGhpcyBuZWVkcwo+Pj4gdG8gYmUgZG9uZSBtYW51YWxseSBiZWZv
cmUgYW5kIGFmdGVyIHRoZSB3cml0ZSBzaWRlIGNyaXRpY2FsIHNlY3Rpb24uCj4+Pgo+Pj4gVXNl
IHRoZSBuZXdseS1hZGRlZCBzZXFjb3VudF93d19tdXRleF90IGluc3RlYWQ6Cj4+Pgo+Pj4gICAg
IC0gSXQgYXNzb2NpYXRlcyB0aGUgd3dfbXV0ZXggd2l0aCB0aGUgc2VxdWVuY2UgY291bnQsIHdo
aWNoIGVuYWJsZXMKPj4+ICAgICAgIGxvY2tkZXAgdG8gdmFsaWRhdGUgdGhhdCB0aGUgd3JpdGUg
c2lkZSBjcml0aWNhbCBzZWN0aW9uIGlzIHByb3Blcmx5Cj4+PiAgICAgICBzZXJpYWxpemVkLgo+
Pj4KPj4+ICAgICAtIEl0IHJlbW92ZXMgdGhlIG5lZWQgdG8gZXhwbGljaXRseSBhZGQgcHJlZW1w
dF9kaXNhYmxlL2VuYWJsZSgpCj4+PiAgICAgICBhcm91bmQgdGhlIHdyaXRlIHNpZGUgY3JpdGlj
YWwgc2VjdGlvbiBiZWNhdXNlIHRoZSB3cml0ZV9iZWdpbi9lbmQoKQo+Pj4gICAgICAgZnVuY3Rp
b25zIGZvciB0aGlzIG5ldyBkYXRhIHR5cGUgYXV0b21hdGljYWxseSBkbyB0aGlzLgo+Pj4KPj4+
IElmIGxvY2tkZXAgaXMgZGlzYWJsZWQgdGhpcyB3d19tdXRleCBsb2NrIGFzc29jaWF0aW9uIGlz
IGNvbXBpbGVkIG91dAo+Pj4gYW5kIGhhcyBuZWl0aGVyIHN0b3JhZ2Ugc2l6ZSBub3IgcnVudGlt
ZSBvdmVyaGVhZC4KPj4gTWhtLCBpcyB0aGUgZG1hX3Jlc3Ygb2JqZWN0IHRoZSBvbmx5IHVzZXIg
b2YgdGhpcyBuZXcgc2VxY291bnRfd3dfbXV0ZXgKPj4gdmFyaWFudCA/Cj4+Cj4+IElmIHllcyB3
ZSBhcmUgdHJ5aW5nIHRvIGdldCByaWQgb2YgdGhpcyBzZXF1ZW5jZSBjb3VudGVyIGZvciBxdWl0
ZSBzb21lCj4+IHRpbWUsIHNvIEkgd291bGQgcmF0aGVyIGludmVzdCB0aGUgYWRkaXRpb25hbCB0
aW1lIHRvIGZpbmlzaCB0aGlzLgo+Pgo+IEluIHRoaXMgcGF0Y2ggc2VyaWVzLCBlYWNoIGV4dHJh
ICJzZXFjb3VudCB3aXRoIGFzc29jaWF0ZWQgbG9jayIgZGF0YQo+IHR5cGUgY29zdHMgdXMsIGV4
YWN0bHk6Cj4KPiAgICAtIDEgdHlwZWRlZiBkZWZpbml0aW9uLCBzZXFjb3VudF93d19tdXRleF90
Cj4gICAgLSAxIHN0YXRpYyBpbml0aWFsaXplciwgU0VRQ05UX1dXX01VVEVYX1pFUk8oKQo+ICAg
IC0gMSBydW50aW1lIGluaXRpYWxpemVyLCBzZXFjb3VudF93d19tdXRleF9pbml0KCkKPgo+IERl
ZmluaXRpb25zIGZvciB0aGUgdHlwZWRlZiBhbmQgdGhlIDIgaW5pdGlhbGl6ZXJzIGFib3ZlIGFy
ZQo+IHRlbXBsYXRlLWNvZGUgb25lIGxpbmVycy4KCkluIHRoaXMgY2FzZSBJJ20gcGVyZmVjdGx5
IGZpbmUgd2l0aCB0aGlzLgoKPgo+IFRoZSBsb2dpYyB3aGljaCBhdXRvbWF0aWNhbGx5IGRpc2Fi
bGVzIHByZWVtcHRpb24gdXBvbiBlbnRlcmluZyBhCj4gc2VxY291bnRfd3dfbXV0ZXhfdCB3cml0
ZSBzaWRlIGNyaXRpY2FsIHNlY3Rpb24gaXMgYWxzbyBhbHJlYWR5IHNoYXJlZAo+IHdpdGggc2Vx
Y291bnRfbXV0ZXhfdCBhbmQgYW55IGZ1dHVyZSwgcHJlZW1wdGlibGUsIGFzc29jaWF0ZWQgbG9j
ay4KPgo+IFNvLCB5ZXMsIGRtYS1yZXN2IGlzIHRoZSBvbmx5IHVzZXIgb2Ygc2VxY291bnRfd3df
bXV0ZXguCj4KPiBCdXQgZXZlbiBpbiB0aGF0IGNhc2UsIGdpdmVuIHRoZSBvbmUgbGluZXIgdGVt
cGxhdGUgY29kZSBuYXR1cmUgb2YKPiBzZXFjb3VudF93d19tdXRleF90IGxvZ2ljLCBpdCBkb2Vz
IG5vdCBtYWtlIHNlbnNlIHRvIGJsb2NrIHRoZSBkbWFfcmVzdgo+IGFuZCBhbWRncHUgY2hhbmdl
IHVudGlsIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSB0aGUgc2VxdWVuY2UgY291bnRlcgo+
IGlzIGNvbXBsZXRlbHkgcmVtb3ZlZC4KPgo+ICoqSWYgYW5kIHdoZW4qKiB0aGUgc2VxdWVuY2Ug
Y291bnRlciBnZXRzIHJlbW92ZWQsIHBsZWFzZSBqdXN0IHJlbW92ZQo+IHRoZSBzZXFjb3VudF93
d19tdXRleF90IGRhdGEgdHlwZSB3aXRoIGl0LiBJdCB3aWxsIGJlIGV4dHJlbWVseSBzaW1wbGUu
CgpDb21wbGV0ZWx5IGFncmVlLCBqdXN0IHdhbnRlZCB0byBwcmV2ZW50IHRoYXQgd2Ugbm93IGFk
ZCBhIGxvdCBvZiBjb2RlIAp3aGljaCBnZXRzIHJlbW92ZWQgYWdhaW4gfjMgbW9udGggZnJvbSBu
b3cuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4K
PiBUaGFua3MsCj4KPiAtLQo+IEFobWVkIFMuIERhcndpc2gKPiBMaW51dHJvbml4IEdtYkgKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
