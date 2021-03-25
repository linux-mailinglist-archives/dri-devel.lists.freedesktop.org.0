Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094B834931E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B4B6EB5F;
	Thu, 25 Mar 2021 13:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770050.outbound.protection.outlook.com [40.107.77.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64D06EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:33:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYPcR7hJB5NUdVf8RI5avyU/xP+okdg74PPi2/3QUso5e4UqFhFDtyRlmooignkqJ1tG9Upy2kEZnfn7P1qb/a/KGK8lM6l/XI6NgXSdGVpAnLKIloClewd+ComWBi07tlR1Etnrb+XrCddvHxRYHzT5FfbI8/QqVCNA4Zo3gv69BgPGuiKd7K8vZYbGl9OPL6v+0kX1RKU+IWlT+He5UEF+9FUgNvmV4j2sGeiuQvGLB8O+RFSnrCDFcENnrB6M5ldfBy91psU3XvJ+kItngIqiGU9Et4perurB6dhki4K8/Re5LdHzj/HXCbrKNEpmq0rPBp9Gk/ZhEdwuv+41WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQtxOlF4utEJG2m6ynrCBmsNa1YpxhDBg0IecN1YEaw=;
 b=es11/38iTsYYzIydL7rdXPZqUYe9PZ+xYy4pyE3nCou8YdFs2dRcXMkAyXlWjxWOe9BLGBHeHTPuSM4/CpidT95ybzEpGtWEkkjgF3Jf6wap7s7yUrC3T2inC41LWYA7EM1Ghc1Id5lVyurIAKn+1d4OAvy1e2mAqauzCl9O987/qAcRsb/ue8WPPF2QpdX+TjEyT/UEHDG7jvjIc03+ii1pZeIrqapiddxleZ199qlNNgf4hLYp+56U1gX+1vADHkBCmHvx6NpX6a+y2OEWOjUnOhXUQuVL/0LyFb/3m09lsC88loBnweZZibR0FoHK9DjIxCVhsI6fnaXqMyD2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQtxOlF4utEJG2m6ynrCBmsNa1YpxhDBg0IecN1YEaw=;
 b=I1KH15yqGGka9Ga9DTk7qenj44DpGbUXeQkfQLLmtm8hNVJYgzG1HauYVu4QrjaYBz5G5OOFrr8KTK4rulRCUSJ7yuXtDnE+1nmHHwlVsA8qahLjjt92Uh5u++s4FqiWJCt2MAfs87a9CKkq2cM7aG9BuwXDGFDc//0WwzjfYsp9cnNcgQSNluL7Uype16v5j5dUMkThRpiMiMBYIi1XwzdKfnwj0uUHfgaSnqlY1izTNE3hNmneLjjW2TseE8HVlqKT0RtAemsoopzRc9ORZZCfeupN9ls583amSdVzjx8D9AV1ywF8DZIR+HjwKJztkDwLlrX0691rrgpZCKj7tg==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 13:33:48 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 13:33:48 +0000
Date: Thu, 25 Mar 2021 10:33:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210325133347.GY2356281@nvidia.com>
References: <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
 <20210325124206.GA599656@nvidia.com>
 <00f79bae-75c4-d694-8dc9-35ac21cd1006@amd.com>
 <20210325131756.GX2356281@nvidia.com>
 <13227fd0-6c41-992e-63e7-877f718c1577@amd.com>
Content-Disposition: inline
In-Reply-To: <13227fd0-6c41-992e-63e7-877f718c1577@amd.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: CH2PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:610:52::40) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR04CA0030.namprd04.prod.outlook.com (2603:10b6:610:52::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Thu, 25 Mar 2021 13:33:48 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPQ7P-002XHF-BM; Thu, 25 Mar 2021 10:33:47 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d4b75f-8ec2-4307-1dbd-08d8ef929f11
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:
X-Microsoft-Antispam-PRVS: <DM6PR12MB494350D0D6804B3F90E1E39CC2629@DM6PR12MB4943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AntlcmxSs+2OxtBnkjXkXoALS0mq810Q3Mf9g+GTpWMSVuTC1GmtJrz/9eGvD0S6xAJaWMVy22JKkIJ8I+T3IJTnr4IBKo1LkXTvP67Hf8ZUBu/MsArKNjqqgnY5nj9UYgtPaIXFrlzINSrb8Y4KJXMZnF8CWkhPI9iJjuCffThe35ICgALI0oGtS3FmJwVjQhdBTDFdn2w+zcf462BPXmj5b+XIWN54tkypoNqVmtOuTnJr1IE0cvmJosM7JNHQwgVWvkY9E8aWFWHMv2mOpllQnjuYR7cVb4MNu+j1yveHG26ODpxZGkk+i4DhT6O932FWq3wHr/gHxHQre7T47cTm0pxq/3/fZrZuYxU3f6rfWs4SwTMYREmWkxPMI12JtX1WQZO1CT0jdnJJmUqDuPdUhi5OECfjKQqyf1lgNWWqihGHBIAkp41C45q/ZmAXm/ZqiBuyW3sMhZoNl7/cHXDRVkY+rrQFQUbrbEjC4DqrcUwpUh6Nmbhs9HmZ6zFot4xFJhMREbQ1ZA4g6dfkSCmTHeG4ReDtkMgFeBYTBniZHbeb/8rnys9XICFgcqPZdzh/t/XT+60/yhgXTM6vIgrHjER8raxRd2MkPVt0pE2LQ2GSHYtiMwLKnPGUdkM6CLZvErI0Pn41TTE2o5iUYcQPV42JwC7z6iU5UqvCmMjyBtCq8GcIDWh0vkA0hLp7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(2616005)(4326008)(426003)(8936002)(38100700001)(8676002)(1076003)(6916009)(5660300002)(86362001)(83380400001)(9746002)(186003)(36756003)(316002)(478600001)(66556008)(66476007)(33656002)(9786002)(66946007)(2906002)(26005)(54906003)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGZrOHFuVm1HWlRrYlJwRngxMStXQ3orUytoQ0ZDT0FMVFlvQWtKU3pYTHk5?=
 =?utf-8?B?MzZlMkw3dkw4Z1hUZ1NBdTNyYVBTOWwvTm9Ib2FNMU5ITm1WRndqUkJxZDk0?=
 =?utf-8?B?Rkorc2wvOC9YWnBtaUlBN2lGY2F1dm9oNm1XRmJxOHN2UkMyNGZNZEFTTmdD?=
 =?utf-8?B?VDRYdDZUY212azZOMnVOc3gvN2RUQVNaemNvQVBzQjh4WHlqOGhTUWF0ODZ4?=
 =?utf-8?B?M2VKQytBTzdhR2tyQTYzQ2NNa2N2VFJVenhiOExNVlg3aHEzYkhhQlRIeVVX?=
 =?utf-8?B?bi85WnVNakJJd1JodHp1MU4yRkxsREhKL2Fsak94cStCUUtidTRvRFVtQzJt?=
 =?utf-8?B?Tm81TWlDWS80Rjlod3FZbzBKaVNRcmdGYXl3MThoWmJaZlpremNDTkU2VTht?=
 =?utf-8?B?L2t4KzJzb1pBcVFycHg3NzBOdWhoWkxyb2NDb1o5YlZ5SDArSmMyeEFTekhp?=
 =?utf-8?B?Z29ZSE9NZkxTbS9PY1liYjNuQlRmOU1EbjZYcS9rSU1GT0UxRzBRT3NjajdP?=
 =?utf-8?B?Y0Y1Q3BTc0hZM0dWY1BQMFE0ME1la0R6SkwwYkN2TmMyV09SS25iUEhKY1VS?=
 =?utf-8?B?bVovUEc5RFVhbkp3clNqK2tkN2dIeFQrc3EwdUJRVTcxMjh3N2c0UkQ0UVFP?=
 =?utf-8?B?N0JJS2lHR0l5M0sxS1ROMDJqMmVzcDM4Z2lNTEFOTG1PZ3RneGtCYWVpV3lk?=
 =?utf-8?B?eUZzUGRwTC9xc0FRQ2YxT2N1aWE0N01yRnlTU21YdkdFb2cwTEt4Qm1jM2lv?=
 =?utf-8?B?Nk9YRXl0cGNiaTJwbFpvaDA4Sm9Xb3J1cVJoYkhiTVBWdDdwdTVEQ0VCeEIr?=
 =?utf-8?B?M2FFSGQwSlk4RFNxR1BRZ00zMFlDajRVb3cydlIxQ0FYY1dBVE1rN0ZGY2M4?=
 =?utf-8?B?V0lvVFoxYjdPZFFrMkFrcVdsWXVXRFBSUzYwVWNpRjE1UlFDcm1NUUp3QUVK?=
 =?utf-8?B?bDRqT0xkZ0JYZ2UrUkpmaGNQK0k1VWlmUS8vc2ZyVngzbEx6RmZhVmNra2Jp?=
 =?utf-8?B?bXNnd3JWS2dnOGFlemdMaGQrZEo1cnZueXU2TkFsbkQzc0MrQmVYRFVSaFEv?=
 =?utf-8?B?djBRRzkwYzdIYURoc0JYa3Q0Q0pHWTNDbG5zeGo2ZGJlMDljRVlaOGo3ZFZk?=
 =?utf-8?B?OFBmRWJtWlhMR1hrYTJUVGt3dTZhWVc3bFQ4UHk5STNWYUM4dnk5clNSSHE3?=
 =?utf-8?B?akVRSGx0RVlYNGY2TVBxTEdPK3pRTXdlS0cyTHhOU0l2OWdaWGNBYlBPakJr?=
 =?utf-8?B?MXhRTEh6REN5c2szVVRUTTNFcmdOaVNwYXBEN2NQOFJEMi81VEhFUGE1bktq?=
 =?utf-8?B?SUV0WFNHMEw0SENXaUV0ZE5PalNnUDV5Zy9ITUV2R0dQVTJTRVNXb3hCRjhn?=
 =?utf-8?B?aTBFblpPclM1SnlVZWNJdUR0VjdGcTNMVTZDdjFQU2pKeE9oWm5hQXJEMDc5?=
 =?utf-8?B?VkE4czFjYityUTh0MWlUcE95ck9sNElGMDJZanBJZ3RtVXdmVFd3NGtFcEZp?=
 =?utf-8?B?YmwzeFJ3QzZzay9yYkg5TmZnbnJ1WGZWL0Z1dDlVOGw2eU9NY0NuU1lDNEhn?=
 =?utf-8?B?dkw5ZURjNldaNVZiUFZPRmNJZFlvRm91Zno1V1hPMWJ6clI5eXlLYStrc1Vx?=
 =?utf-8?B?OWJVcGxTOXBzQU5ZQzBhYVVaZHpTK1BIcDVEQUM4Nmp0V2M5SVk3ZkdHYm94?=
 =?utf-8?B?dWtSWHVqQU5VUklFMU5iSVFSOWROb3RHdEJwdlJqVzFtQXJyc2NwYklKNDRj?=
 =?utf-8?Q?rBLxsr4hqinJU77csxiRSfSWsW6TEZf9b1onGt9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d4b75f-8ec2-4307-1dbd-08d8ef929f11
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 13:33:48.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81HYouVxalRIrPtxWTO2m7VZwMm08QV9hgCUtsI+sk4bslC1pYZd8h2MnoHKB8R8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4943
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDI6MjY6NTBQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAyNS4wMy4yMSB1bSAxNDoxNyBzY2hyaWViIEphc29uIEd1bnRob3JwZToK
PiA+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDAyOjA1OjE0UE0gKzAxMDAsIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4gPiA+IAo+ID4gPiBBbSAyNS4wMy4yMSB1bSAxMzo0MiBzY2hyaWViIEph
c29uIEd1bnRob3JwZToKPiA+ID4gPiBPbiBUaHUsIE1hciAyNSwgMjAyMSBhdCAwMTowOToxNFBN
ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPiA+ID4gQW0gMjUuMDMuMjEgdW0g
MTM6MDEgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gPiA+ID4gPiA+IE9uIFRodSwgTWFyIDI1
LCAyMDIxIGF0IDEyOjUzOjE1UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3Jv
dGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IE5vcGUuIFRoZSBwb2ludCBoZXJlIHdhcyB0
aGF0IGluIHRoaXMgY2FzZSwgdG8gbWFrZSBzdXJlIG1tYXAgdXNlcyB0aGUKPiA+ID4gPiA+ID4g
PiBjb3JyZWN0IFZBIHRvIGdpdmUgdXMgYSByZWFzb25hYmxlIGNoYW5jZSBvZiBhbGlnbmVtZW50
LCB0aGUgZHJpdmVyIG1pZ2h0Cj4gPiA+ID4gPiA+ID4gbmVlZCB0byBiZSBhd2FyZSBvZiBhbmQg
ZG8gdHJpY2tlcnkgd2l0aCB0aGUgaHVnZSBwYWdlLXRhYmxlLWVudHJ5IHNpemVzCj4gPiA+ID4g
PiA+ID4gYW55d2F5LCBhbHRob3VnaCBJIHRoaW5rIGluIG1vc3QgY2FzZXMgYSBzdGFuZGFyZCBo
ZWxwZXIgZm9yIHRoaXMgY2FuIGJlCj4gPiA+ID4gPiA+ID4gc3VwcGxpZWQuCj4gPiA+ID4gPiA+
IE9mIGNvdXJzZSB0aGUgZHJpdmVyIG5lZWRzIHNvbWUgd2F5IHRvIGluZmx1ZW5jZSB0aGUgVkEg
bW1hcCB1c2VzLAo+ID4gPiA+ID4gPiBnZXJuYWxseSBpdCBzaG91bGQgYWxpZ24gdG8gdGhlIG5h
dHVyYWwgcGFnZSBzaXplIG9mIHRoZSBkZXZpY2UKPiA+ID4gPiA+IFdlbGwgYSBtbWFwKCkgbmVl
ZHMgdG8gYmUgYWxpZ25lZCB0byB0aGUgcGFnZSBzaXplIG9mIHRoZSBDUFUsIGJ1dCBub3QKPiA+
ID4gPiA+IG5lY2Vzc2FyaWx5IHRvIHRoZSBvbmUgb2YgdGhlIGRldmljZS4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gU28gSSdtIHByZXR0eSBzdXJlIHRoZSBkZXZpY2UgZHJpdmVyIHNob3VsZCBub3Qg
YmUgaW52b2x2ZWQgaW4gYW55IHdheSB0aGUKPiA+ID4gPiA+IGNob29zaW5nIG9mIHRoZSBWQSBm
b3IgdGhlIENQVSBtYXBwaW5nLgo+ID4gPiA+IE5vLCBpZiB0aGUgZGV2aWNlIHdhbnRzIHRvIHVz
ZSBodWdlIHBhZ2VzIGl0IG11c3QgaW5mbHVlbmNlIHRoZSBtbWFwCj4gPiA+ID4gVkEgb3IgaXQg
Y2FuJ3QgZm9ybSBodWdlIHBnYWVzLgo+ID4gPiBObywgdGhhdCdzIHRoZSBqb2Igb2YgdGhlIGNv
cmUgTU0gYW5kIG5vdCBvZiB0aGUgaW5kaXZpZHVhbCBkcml2ZXIuCj4gPiBUaGUgY29yZSBtbSBk
b2Vzbid0IGtub3cgdGhlIHBhZ2Ugc2l6ZSBvZiB0aGUgZGV2aWNlLCBvbmx5IHdoaWNoIG9mCj4g
PiBzZXZlcmFsIHBhZ2UgbGV2ZWxzIHRoZSBhcmNoIHN1cHBvcnRzLiBUaGUgZGV2aWNlIG11c3Qg
YmUgaW52b2xldmQKPiA+IGhlcmUuCj4gCj4gV2h5PyBTZWUgeW91IGNhbiBoYXZlIGEgZGV2aWNl
IHdoaWNoIGhhcyBmb3IgZXhhbXBsZSAyNTZLaUIgcGFnZXMsIGJ1dCBpdAo+IHNob3VsZCBwZXJm
ZWN0bHkgd29yayB0aGF0IHRoZSBDUFUgbWFwcGluZyBpcyBhbGlnbmVkIHRvIG9ubHkgNEtpQi4K
ClRoZSBnb2FsIGlzIHRvIG9wdGltaXplIGxhcmdlIHBhZ2Ugc2l6ZSB1c2FnZSBpbiB0aGUgcGFn
ZSB0YWJsZXMuCgpUaGVyZSBhcmUgdGhyZWUgY3JpdGVyYSB0aGF0IGltcGFjdCB0aGlzOgogMSkg
VGhlIHBvc3NpYmxlIENQVSBwYWdlIHRhYmxlIHNpemVzCiAyKSBUaGUgdXNlZnVsIGNvbnRpZ3Vp
dHkgdGhlIGRldmljZSBjYW4gY3JlYXRlIGluIGl0cyBpb21lbW9yeQogMykgVGhlIFZBJ3MgYWxp
Z25tZW50LCBhcyB0aGlzIHNldHMgYW4gdXBwZXIgYm91bmQgb24gMSBhbmQgMgoKSWYgYSBkZXZp
Y2UgaGFzIDI1NmsgcGFnZXMgYW5kIHRoZSBhcmNoIHN1cHBvcnRzIDJNIGFuZCA0ayB0aGVuIHRo
ZSBWQQpzaG91bGQgYWxpZ24gdG8gc29tZXdoZXJlIGJldHdlZW4gNGsgYW5kIDI1NmsuIFRoZSBp
ZGVhbCBhbGlnbm1lbnQKd291bGQgYmUgdG8gb3B0aW1pemUgUFRFIHVzYWdlIHdoZW4gc3R1ZmZp
bmcgMjU2ayBibG9ja3MgYnkgZnVsbHkKcG9wdWxhdGluZyBQVEVzIGFuZCBkZXBlbmRzIG9uIHRo
ZSBhcmNoJ3MgIyBvZiBQVEUncyBwZXIgcGFnZS4KCklmIGEgZGV2aWNlIGhhcyAyNTZrIHBhZ2Vz
IGFuZCB0aGUgYXJjaCBzdXBwb3J0cyAyNTZrIHBhZ2VzIHRoZW4gdGhlClZBIHNob3VsZCBhbGln
biB0byAyNTZrLgoKVGhlIGRldmljZSBzaG91bGQgbmV2ZXIgYmUgdG91Y2hpbmcgYW55IG9mIHRo
aXMsIGl0IHNob3VsZCBzaW1wbHkKaW5mb3JtIHdoYXQgaXRzIG9wZXJhdGluZyBwYWdlIHNpemUg
aXMgYW5kIHRoZSBNTSBzaG91bGQgdXNlIHRoYXQgdG8KYWxpZ24gdGhlIFZBLgoKSmFzb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
