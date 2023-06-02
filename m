Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00971FF79
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 12:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760310E653;
	Fri,  2 Jun 2023 10:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Fri, 02 Jun 2023 10:36:51 UTC
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE6210E644;
 Fri,  2 Jun 2023 10:36:51 +0000 (UTC)
Received: from [192.168.1.137] ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202306021230180079; Fri, 02 Jun 2023 12:30:18 +0200
Message-ID: <47893a27-27bc-2cfc-7ff1-9049248811f1@daenzer.net>
Date: Fri, 2 Jun 2023 12:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-CA
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
References: <SN6PR04MB5184576F8660D04D62AEE5C8EC49A@SN6PR04MB5184.namprd04.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: How to fetch the implicit sync fence for a GPU buffer?
In-Reply-To: <SN6PR04MB5184576F8660D04D62AEE5C8EC49A@SN6PR04MB5184.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F1B.6479C4BE.0044,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
 Spam="Unknown"; VOD="Unknown"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "'wayland-devel@lists.freedesktop.org'"
 <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/23 23:15, Hoosier, Matt wrote:
> Hi,
> 
>  
> 
> In the past there has been writing about Wayland’s model using implicit synchronization of GPU renderbuffers and KMS commits [1] [2].
> 
>  
> 
> It would sometimes be nice to do that waiting explicitly in a compositor before enqueueing a KMS pageflip that references a buffer who may go on rendering for some time still. This stalls the pipeline.
> 
>  
> 
> I’m wondering whether there’s an API -- maybe something analogous to drmPrimeHandleToFD() – that allows userspace to fetch a waitable fence fd for a dmabuf?

A dma-buf fd itself can serve this purpose; it polls as readable when the GPU has finished drawing to the buffer.

See https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 for how I used this to implement what you describe above in mutter. Note that this involves some Wayland state management challenges for correct operation in all cases though.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

