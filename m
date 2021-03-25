Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60D348FCF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B17D6ED0A;
	Thu, 25 Mar 2021 11:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EA16ED0A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gkb2QIPAHZ47Qy5z7ubNXZyDZcdbt9e/fB9YjDeV+7rHB4lcTgLG3xXL/LFiuANaV1Hsl9DynowCbn1x60C1YJKJsawIhvKRdlvpcl1P/Q8HSnHRHTUBQkST6x8Q8Db3h/KD0jyls/+Eapfb9n7/Mp2ZbGjlqmzuTNawS4BiQfS8ZCTMxGAsjVHzfIOQCMEr57QleTMkoyelsZW+BRbzoz/XdCjNhfmw5si+zj3eZXRDisoLXbVMplXq4JTEQfu2vJQhRFHHNOAztG//LAtfdmPNdWGI5rZK4wGtCoKS/KGDAqRJnPlsClvQmmH5y37dUEXf7N8f+ad0QJgPrveSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9xKUBao1hNAUyqmItUyabsMUHquzCGLrTYbNOd7mOE=;
 b=Sv0uTbK0GOm4xYAeO7geG+rE4hCAY4YGrN7rpTx6nWa++0+RmKw4jMCYFbqHS+6Ac0+3VRXeB/w5gqAGO1owHU6tmVZz+0KmJ05zBwstLQHieL70WYwGEUGWEIFfA5FLe9UO1bsQUkNM8N472IpukrYSoH9OeThmJ71dK3JJ9Gebah3V92/y9yHomHkV47E2kElkrPfQ0PwrFTH5Xr0at0rqDAYh2dGQ5oGER5Oy6Uhmztxqshw+xVZ5OzEWAVxfnGaGL/SS7YCNhbND8CWnFACRvWop2XoAnW3rezqY7CmcZNWUW0IrFVMn2tzCR9oHEGFpBJj6r6z+gPTEHX66PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9xKUBao1hNAUyqmItUyabsMUHquzCGLrTYbNOd7mOE=;
 b=oc4wDinH3YTzD0A24g/KQ7Dmmq/lXChkC1YocvyuPTPf/+7stFWtW2GShlyI+2oPzeOQZDdzTS0TR1/hOIFdzclE5MvoKA+mBSEpMLnoWjnYv8tHXr0YE7M0q7utP/vqdZ1q/Bwt4W8mdqCVba00Ad3krh3rPiEvpHU5VGadT//yw/paSyRFXgyKPndaDMAv3h7J7Ww6cT09U5R5WmTgrDc35EPCoFIm6PPVX5lELCAyUrhR+n+iAXk7LVFOZD0DB4YAB9Fw7Ako+x86mZjuqTopmqlbSBSP4tmvbibZO/JuxzYZ4z2aRWzyVQovLrjFUSgzJpQwJvgOC1msm5PRVA==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 11:30:25 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 11:30:25 +0000
Date: Thu, 25 Mar 2021 08:30:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210325113023.GT2356281@nvidia.com>
References: <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
 <20210324134833.GE2356281@nvidia.com>
 <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
Content-Disposition: inline
In-Reply-To: <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::29) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Thu, 25 Mar 2021 11:30:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPOBz-002UD2-SU; Thu, 25 Mar 2021 08:30:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9775d30-4b3e-4dda-1384-08d8ef816260
X-MS-TrafficTypeDiagnostic: DM5PR12MB1753:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1753C9559B04448BB6033C9CC2629@DM5PR12MB1753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+QJ3UfsGyQSFec7PQgJUcCRzA7hEZBAp82alGrob56nM/3/3HAYFiwPiaklsgECsVbD6FRman4LHT3yUBuefQLeiNdb+7I/eB9ELKPttgU6qweWnZgcmGyJBgxRnu9IMSJPZ+SSs0F1QmgxQjFEQnk/EoKy8k5n0A/TZbU8Ybf0HCWlK40dPBQsO5M2iDXtfC8+P6zspL5APTMkkexBB6+OYO25JbJohtE8mCJUWcJhXwWa/gEwv7qoop1c0uWdVohCtwix8iAuyx8KZIXLhYC0Wfo5dQRSg7zVC9if6zezU3t1k8hRsQY5wbyPpauiGlFQkHBey09ZXRE/Td0tTg4GjwCRyoyycDSysJZCRwyV7AQ88b/JcG3tH+5dhWlxcljexI7SmUv/5PG31G8T6Dhl4531dydy+DsZp85aZjCfM/1E9ADG/wi6ekUVbqF3ZMzYnLE14uI2plpkaauvYMTgOx4Pm2FyhPMC1eVb0c1wiBmCOeQxdc6nmPCgMWr+Hr76JSU4s0Bwyh3RVI/rzRRpLeAqi+gY+C+QOdYltcfyN6rnoOy4mK8Czyv4K353bxQ+HMKLGheShg/J+0MwAT68eWsSz/dPE6G23TkjkNR/VtTw9ahXCK2vPJC1b2/Dlh//FEwSghR4fNKhRwRFCdU4qQZAR9C+VlDRCCCNxvUl2LSUZmKZ/us2ht2YzOiJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(186003)(6916009)(33656002)(26005)(38100700001)(54906003)(66946007)(316002)(66556008)(36756003)(4326008)(66574015)(83380400001)(66476007)(5660300002)(8676002)(8936002)(9786002)(478600001)(9746002)(2616005)(86362001)(2906002)(426003)(1076003)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enIxZGszQ2dCN0VwTGFZUzRROFVwYU4xVkIwVXg2bUhHWnN0blJHWFgrTjV5?=
 =?utf-8?B?WktNeG9pdU5YdjBrUW1YdlhZM2lZenBHN0dPdDFQOWN3Rmw2Z3JwN3JoYy85?=
 =?utf-8?B?WHRwTit2SFVoQ3dOclNSY1hla0RDUVZPZTRlT0w3bW0xU0ZMSHpqcW9YUUlV?=
 =?utf-8?B?UGxNTXZoQkZlaTE5TGtxZjZpUTBCZStGQWticjhkMkVkQ0NSMkZsYmkrWnJr?=
 =?utf-8?B?VHhnQ1YzQThqRENESzhkZ0xucUhqeTZGRmpnb2ttUWJBY2ZkR0VCZURZdFp2?=
 =?utf-8?B?L1oxVkJVd2s0eWJNYzJiTU1DUzdPSlI2WXZaVVNQaVRjR0hLaFVkbDVPb1NB?=
 =?utf-8?B?bTVFMjlYQWtpaitJRzIvRTZrazJ2TkRZOXVLNHdmc3MrcE0vNEQvd2NNTUh5?=
 =?utf-8?B?NUZTd0ZSSlBuQ2M5SnFPM0owUURCNyttdFJlKy85a1d1R3NucUR2cm94L3E3?=
 =?utf-8?B?UWZoTTJhSHNIbkhmbzFoTXhMNlpGb1dNaXZLcVpyU3dGOUo3aXFrTDRkbi96?=
 =?utf-8?B?U0wvRmhqanltY1JXZHdLTnVRczBIaEhmSlhlbW1IbVNyZzlQd2Jsd1FqaE5H?=
 =?utf-8?B?YkxnVXQ1alVOa2VUb2V4dVkzNnNtRUx6enNHbEJxNlRXNjhiMFJJS0M5RXpp?=
 =?utf-8?B?ZE9YQ3RCT0NXcm9Tb3BQQUVEbld0QnQ3eEJlcjNXZUlzclM1UkFRcGFMcU5x?=
 =?utf-8?B?NjFIVDlUT21xRXE3bUVNNmtqa2hoN2JVRzVEU0swNzFjMGFCbDBTNktOMTFC?=
 =?utf-8?B?Q2JqRkdid2hNcE4yTHcvVE9nV0RkNU1qdzhWYkdzWVNuMUJ0bUFDd2VRWFN3?=
 =?utf-8?B?K0tZM3o1Z2t5bXgxQUV0ZFd5WGFhOWp0ZVQzSkpGL1NHZU95SUpzTWlOcWg4?=
 =?utf-8?B?M1B3dEdLLzVSbnQwWGZtOVMweFZ0anN5aWh5UWc5YUJtL1BUUEdVZ1dQVEcr?=
 =?utf-8?B?aysyUTV6MFlFMkF0YkRUczlJTzhpRXRIZEt5NzFQVHBWYTF1TmQ3WHhrUE9B?=
 =?utf-8?B?WTVYNUVOd2krMUo4ZzdPa094eC92Rm1qN1ZKako0eGh3aW9UMXpqMFljMXB4?=
 =?utf-8?B?aWpWZjhRN0NobDI4cEsxODJMUDg4Z1ZmWCtwTDZlRmhtaysvTHZUOFl1TjRn?=
 =?utf-8?B?N0E1QS80SC8zTkUrVFJ1WGFVK3JFL2FxWDZQWTE2a210a2hNZjR5VTArU2c5?=
 =?utf-8?B?RUVHSXNNYjdNakY2TXcwcVZJSW10cncyOXQzR21JUTRqRXg3NGRGd3owaWFO?=
 =?utf-8?B?M3FiSEc2aTBBdWZFUTR5NnV1czBIVTdNT2pOK2ZpMk1Sd0Q3dzFJeEM5Z0ZG?=
 =?utf-8?B?ZzB0T3hqcERlaFRYb2xsVW4yYXJMRC9XYXA2YzFpYld1L29URk8yWFhvcytR?=
 =?utf-8?B?cmllU204SitWMDd0RmdzcWpiSEw0YllXM2JMaHA5UHdkajRESUUvK1ZEYW9a?=
 =?utf-8?B?cjNVMG01dnFrRm5memU3SWVRbXpaY2NDT09WV3h2bys2Q0VkejBoTGNzY3ls?=
 =?utf-8?B?cXRUV2hFVUo5MGYwTWsxV0xoS08wYno5eHRuQjZjMDZKZTA3R1FWd29RVk9S?=
 =?utf-8?B?MEd6QXY1ZUptMGRraSt1K1NSWktIK2RReC9SU3EvcTJVVklqZTV3Z2lkbTFv?=
 =?utf-8?B?WFMyb1NBcUNJV2M5Y1N6RWZvQXlaT1lzM0F3TTRNY29jdmovK3NJcjYvYmpy?=
 =?utf-8?B?NGZ5eHNBT0pOanZ4TDlOSGplWE1hc0tTa3pJbHA5b1YyWVR3OWkzWWZSbTRO?=
 =?utf-8?Q?wRB1ut4VyAHH2jWiAPDXBz469e5I+CL792xKusN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9775d30-4b3e-4dda-1384-08d8ef816260
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 11:30:25.5207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Bhd5AMwKeYC/lHg/PjFxhdXzj2L6IE395NRxM0MhPOZTT0L6Y/IKMMShdluVugm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1753
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMTA6NTE6MzVBTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKCj4gPiBQbGVhc2UgZXhwbGFpbiB0aGF0IGZ1cnRoZXIuIFdoeSBk
byB3ZSBuZWVkIHRoZSBtbWFwIGxvY2sgdG8gaW5zZXJ0IFBNRHMKPiA+IGJ1dCBub3Qgd2hlbiBp
bnNlcnQgUFRFcz8KPiAKPiBXZSBkb24ndC4gQnV0IG9uY2UgeW91J3ZlIGluc2VydGVkIGEgUE1E
IGRpcmVjdG9yeSB5b3UgY2FuJ3QgcmVtb3ZlIGl0Cj4gdW5sZXNzIHlvdSBoYXZlIHRoZSBtbWFw
IGxvY2sgKGFuZCBwcm9iYWJseSBhbHNvIHRoZSBpX21tYXBfbG9jayBpbiB3cml0ZQo+IG1vZGUp
LiBUaGF0IGZvciBleGFtcGxlIG1lYW5zIHRoYXQgaWYgeW91IGhhdmUgYSBWUkFNIHJlZ2lvbiBt
YXBwZWQgd2l0aAo+IGh1Z2UgUE1EcywgYW5kIHRoZW4gaXQgZ2V0cyBldmljdGVkLCBhbmQgeW91
IGhhcHBlbiB0byByZWFkIGEgYnl0ZSBmcm9tIGl0Cj4gd2hlbiBpdCdzIGV2aWN0ZWQgYW5kIHRo
ZXJlZm9yZSBwb3B1bGF0ZSB0aGUgZnVsbCByZWdpb24gd2l0aCBQVEVzIHBvaW50aW5nCj4gdG8g
c3lzdGVtIHBhZ2VzLCB5b3UgY2FuJ3QgZ28gYmFjayB0byBodWdlIFBNRHMgYWdhaW4gd2l0aG91
dCBhIG11bm1hcCgpIGluCj4gYmV0d2Vlbi4KClRoaXMgaXMgYWxsIGJhc2ljYWxseSBtYWdpYyB0
byBtZSBzdGlsbCwgYnV0IFRIUCBkb2VzIHRoaXMKdHJhbnNmb3JtYXRpb24gYW5kIEkgdGhpbmsg
d2hhdCBpdCBkb2VzIGNvdWxkIHdvcmsgaGVyZSB0b28uIFdlCnByb2JhYmx5IHdvdWxkbid0IGJl
IGFibGUgdG8gdXBncmFkZSB3aGlsZSBoYW5kbGluZyBmYXVsdCwgYnV0IGF0IHRoZQpzYW1lIHRp
bWUsIHRoaXMgc2hvdWxkIGJlIHF1aXRlIHJhcmUgYXMgaXQgd291bGQgcmVxdWlyZSB0aGUgZHJp
dmVyIHRvCmhhdmUgc3VwcGxpZWQgYSBzbWFsbCBwYWdlIGZvciB0aGlzIFZNQSBhdCBzb21lIHBv
aW50LgoKPiA+IEFwYXJ0IGZyb20gdGhhdCBJIHN0aWxsIGRvbid0IGZ1bGx5IGdldCB3aHkgd2Ug
bmVlZCB0aGlzIGluIHRoZSBmaXJzdAo+ID4gcGxhY2UuCj4gCj4gQmVjYXVzZSB2aXJ0dWFsIGh1
Z2UgcGFnZSBhZGRyZXNzIGJvdW5kYXJpZXMgbmVlZCB0byBiZSBhbGlnbmVkIHdpdGgKPiBwaHlz
aWNhbCBodWdlIHBhZ2UgYWRkcmVzcyBib3VuZGFyaWVzLCBhbmQgbW1hcCBjYW4gaGFwcGVuIGJl
Zm9yZSBib3MgYXJlCj4gcG9wdWxhdGVkIHNvIHlvdSBoYXZlIG5vIHdheSBvZiBrbm93aW5nIGhv
dyBwaHlzaWNhbCBodWdlIHBhZ2UKPiBhZGRyZXNzCgpCdXQgdGhpcyBpcyBhIG1tYXAtdGltZSBw
cm9ibGVtLCBmYXVsdCBjYW4ndCBmaXggbW1hcCB1c2luZyB0aGUgd3JvbmcgVkEuCgo+ID4gSSBy
ZWFsbHkgZG9uJ3Qgc2VlIHRoYXQgZWl0aGVyLiBXaGVuIGEgYnVmZmVyIGlzIGFjY2Vzc2VkIGJ5
IHRoZSBDUFUgaXQKPiA+IGlzIGluID4gOTAlIG9mIGFsbCBjYXNlcyBjb21wbGV0ZWx5IGFjY2Vz
c2VkLiBOb3QgZmF1bHRpbmcgaW4gZnVsbAo+ID4gcmFuZ2VzIGlzIGp1c3Qgb3B0aW1pemluZyBm
b3IgYSByZWFsbHkgdW5saWtlbHkgY2FzZSBoZXJlLgo+IAo+IEl0IG1pZ2h0IGJlIHRoYXQgeW91
J3JlIHJpZ2h0LCBidXQgYXJlIGFsbCBkcml2ZXJzIHdhbnRpbmcgdG8gdXNlIHRoaXMgbGlrZQo+
IGRybSBpbiB0aGlzIHJlc3BlY3Q/IFVzaW5nIHRoZSBpbnRlcmZhY2UgdG8gZmF1bHQgaW4gYSAx
RyByYW5nZSBpbiB0aGUgaG9wZQo+IGl0IGNvdWxkIG1hcCBpdCB0byBhIGh1Z2UgcHVkIG1heSB1
bmV4cGVjdGVkbHkgY29uc3VtZSBhbmQgcG9wdWxhdGUgc29tZSAxNisKPiBNQiBvZiBwYWdlIHRh
Ymxlcy4KCklmIHRoZSB1bmRlcmx5aW5nIGRldmljZSBibG9jayBzaXplIGlzIHNvIGJpZyB0aGVu
IHN1cmUsIHdoeSBub3Q/IFRoZQoidW5leHBlY3RlZGx5IiBzaG91bGQgYmUgcXVpdGUgcmFyZS9u
b24gZXhpc3RhbnQgYW55aG93LgoKSmFzb24KIApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
