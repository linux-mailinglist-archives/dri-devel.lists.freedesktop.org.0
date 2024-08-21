Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586895A492
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 20:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3E110E0A1;
	Wed, 21 Aug 2024 18:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0E910E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 18:15:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 78D27CE0EA7;
 Wed, 21 Aug 2024 18:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468D3C32786;
 Wed, 21 Aug 2024 18:15:16 +0000 (UTC)
Message-ID: <0e201905-7b65-4a51-b884-6cc41d01e466@xs4all.nl>
Date: Wed, 21 Aug 2024 20:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] media: i2c: tc358743: export InfoFrames to debugfs
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
 <501bb64b027022ebcfb9636e9267dfba520c4a67.1724249421.git.hverkuil-cisco@xs4all.nl>
 <CAPY8ntBz9Z-OVHpHinANN5WP6Ki8Fa0Fv0VFj+6kniRr-yOqPA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAPY8ntBz9Z-OVHpHinANN5WP6Ki8Fa0Fv0VFj+6kniRr-yOqPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/08/2024 18:12, Dave Stevenson wrote:
> Hi Hans
> 
> This is a very useful little series - thanks.
> 
> On Wed, 21 Aug 2024 at 15:16, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Export InfoFrames to debugfs.
> 
> I had a tc358743 to hand, so thought this warranted a quick test.
> I think you have an off-by-one on the length that this exposes.
> 
> log_status is giving me state
>    [  428.600874] tc358743 10-000f: -----HDMI status-----
>    [  428.600881] tc358743 10-000f: HDCP encrypted content: no
>    [  428.600887] tc358743 10-000f: Input color space: RGB limited range
>    [  428.601404] tc358743 10-000f: AV Mute: off
>    [  428.601921] tc358743 10-000f: Deep color mode: 8-bits per channel
>    [  428.604407] tc358743 10-000f: HDMI infoframe: Auxiliary Video
> Information (AVI), version 2, length 13
>    [  428.604425] tc358743 10-000f:     colorspace: RGB
>    [  428.604433] tc358743 10-000f:     scan mode: Underscan
>    [  428.604441] tc358743 10-000f:     colorimetry: No Data
>    [  428.604449] tc358743 10-000f:     picture aspect: 16:9
>    [  428.604456] tc358743 10-000f:     active aspect: Same as Picture
>    [  428.604463] tc358743 10-000f:     itc: No Data
>    [  428.604469] tc358743 10-000f:     extended colorimetry: xvYCC 601
>    [  428.604476] tc358743 10-000f:     quantization range: Limited
>    [  428.604483] tc358743 10-000f:     nups: Unknown Non-uniform Scaling
>    [  428.604490] tc358743 10-000f:     video code: 4
>    [  428.604497] tc358743 10-000f:     ycc quantization range: Limited
>    [  428.604505] tc358743 10-000f:     hdmi content type: Graphics
>    [  428.604511] tc358743 10-000f:     pixel repeat: 0
>    [  428.604519] tc358743 10-000f:     bar top 0, bottom 0, left 0, right 0
> 
> pi@bookworm64:~/edid-decode $ xxd /sys/kernel/debug/v4l2/tc358743\
> 10-000f/infoframes/avi
> 00000000: 8202 0d2d 1228 0404 0000 0000 0000 0000  ...-.(..........
> 
> At the transmitting end I've got
> pi@bookworm64:~/edid-decode $ sudo xxd
> /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/avi
> 00000000: 8202 0d2d 1228 0404 0000 0000 0000 0000  ...-.(..........
> 00000010: 00
> 
> edid-decode -I decodes the latter fine, but aborts on the former.
> Oddly the "fail" message from parse_if_hdr [1] doesn't get printed, it
> just stops with

I fixed this in edid-decode.

> pi@bookworm64:~/edid-decode $ ./build/edid-decode -I
> /sys/kernel/debug/v4l2/tc358743\ 10-000f/infoframes/avi
> edid-decode InfoFrame (hex):
> 
> 82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00
> 
> ----------------
> 
> HDMI InfoFrame Checksum: 0x2d
> 
> AVI InfoFrame
>   Version: 2
>   Length: 13
> 
> 
> [1] https://git.linuxtv.org/edid-decode.git/tree/parse-if.cpp#n21
> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/i2c/tc358743.c | 36 +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 35 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
>> index 65d58ddf0287..c7652c0dbaeb 100644
>> --- a/drivers/media/i2c/tc358743.c
>> +++ b/drivers/media/i2c/tc358743.c
>> @@ -87,6 +87,10 @@ struct tc358743_state {
>>         struct timer_list timer;
>>         struct work_struct work_i2c_poll;
>>
>> +       /* debugfs */
>> +       struct dentry *debugfs_dir;
>> +       struct v4l2_debugfs_if *infoframes;
>> +
>>         /* edid  */
>>         u8 edid_blocks_written;
>>
>> @@ -430,12 +434,35 @@ static void tc358743_erase_bksv(struct v4l2_subdev *sd)
>>
>>  /* --------------- AVI infoframe --------------- */
>>
>> +static ssize_t
>> +tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
>> +                        char __user *ubuf, size_t count, loff_t *ppos)
>> +{
>> +       u8 buf[V4L2_DEBUGFS_IF_MAX_LEN] = {};
>> +       struct v4l2_subdev *sd = priv;
>> +       int len;
>> +
>> +       if (!is_hdmi(sd))
>> +               return 0;
>> +
>> +       if (type != V4L2_DEBUGFS_IF_AVI)
>> +               return 0;
>> +
>> +       i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_16BYTE - PK_AVI_0HEAD + 1);
>> +       len = buf[2] + 3;
> 
> tda1997x has len = buffer[2] + 4;
> adv7842 and adv7604 have len = buf[2] + 1; and then return len + 3;
> adv7511 has len = buffer[2]; and return len + 4;
> 
> So I think this should be len = buf[2] + 4;

Yes, that's correct. I forgot about the extra checksum byte that HDMI
inserts in InfoFrames.

Thank you, I've updated the patch and added a Tested-by with your email.

Regards,

	Hans

> 
> Doing so makes edid-decode happy.
> pi@bookworm64:~/edid-decode $ sudo ./build/edid-decode -I
> /sys/kernel/debug/v4l2/tc358743\ 10-000f/infoframes/avi
> edid-decode InfoFrame (hex):
> 
> 82 02 0d 2d 12 28 04 04 00 00 00 00 00 00 00 00
> 00
> 
> ----------------
> 
> HDMI InfoFrame Checksum: 0x2d
> 
> AVI InfoFrame
>   Version: 2
>   Length: 13
>   VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
>   Y: Color Component Sample Format: RGB
>   A: Active Format Information Present: Yes
>   B: Bar Data Present: Bar Data not present
>   S: Scan Information: Composed for an underscanned display
>   C: Colorimetry: No Data
>   M: Picture Aspect Ratio: 16:9
>   R: Active Portion Aspect Ratio: 8
>   ITC: IT Content: No Data
>   EC: Extended Colorimetry: xvYCC601
>   Q: RGB Quantization Range: Limited Range
>   SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
>   YQ: YCC Quantization Range: Limited Range
>   CN: IT Content Type: Graphics
>   PR: Pixel Data Repetition Count: 0
>   Line Number of End of Top Bar: 0
>   Line Number of Start of Bottom Bar: 0
>   Pixel Number of End of Left Bar: 0
>   Pixel Number of Start of Right Bar: 0
> 
> I haven't double checked the maths to ensure that we have read that
> extra byte via i2c_rd though.
> 
>   Dave
> 
>> +       if (len > V4L2_DEBUGFS_IF_MAX_LEN)
>> +               len = -ENOENT;
>> +       if (len > 0)
>> +               len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
>> +       return len < 0 ? 0 : len;
>> +}
>> +
>>  static void print_avi_infoframe(struct v4l2_subdev *sd)
>>  {
>>         struct i2c_client *client = v4l2_get_subdevdata(sd);
>>         struct device *dev = &client->dev;
>>         union hdmi_infoframe frame;
>> -       u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
>> +       u8 buffer[HDMI_INFOFRAME_SIZE(AVI)] = {};
>>
>>         if (!is_hdmi(sd)) {
>>                 v4l2_info(sd, "DVI-D signal - AVI infoframe not supported\n");
>> @@ -2161,6 +2188,11 @@ static int tc358743_probe(struct i2c_client *client)
>>         if (err < 0)
>>                 goto err_work_queues;
>>
>> +       state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
>> +       state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
>> +                                                 V4L2_DEBUGFS_IF_AVI, sd,
>> +                                                 tc358743_debugfs_if_read);
>> +
>>         v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
>>                   client->addr << 1, client->adapter->name);
>>
>> @@ -2188,6 +2220,8 @@ static void tc358743_remove(struct i2c_client *client)
>>                 flush_work(&state->work_i2c_poll);
>>         }
>>         cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
>> +       v4l2_debugfs_if_free(state->infoframes);
>> +       debugfs_remove_recursive(state->debugfs_dir);
>>         cec_unregister_adapter(state->cec_adap);
>>         v4l2_async_unregister_subdev(sd);
>>         v4l2_device_unregister_subdev(sd);
>> --
>> 2.43.0
>>
> 

